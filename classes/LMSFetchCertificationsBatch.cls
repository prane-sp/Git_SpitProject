public class LMSFetchCertificationsBatch implements  Database.Batchable<sObject>,Database.Stateful,Database.AllowsCallouts
{
    public Database.QueryLocator start(Database.BatchableContext context)
    {
        return Database.getQueryLocator([Select Id,Course_Id__c,Last_Fetch_Date__c,Course_Name__c from LMS_Course__c where Is_Active__c=true]);
    }
    public void execute(Database.BatchableContext context, List<sObject> scope)
    { 
        List<LMS_Course__c> lstCourses= (List<LMS_Course__c>)scope;
        Map<Id,List<PartnerPortalCertificate>> mapCourseData= new  Map<Id,List<PartnerPortalCertificate>>();
        List<LMS_Course__c>lstCourseToUpdate= new List<LMS_Course__c>();
        for(LMS_Course__c course : lstCourses)
        {
            //Fetch all the certifications for each course
            Date fetchDate= course.Last_Fetch_Date__c;
            if(fetchDate!=null)
            {
                fetchDate=fetchDate.addDays(1);
            }
            // Fetch all the certification details 
            try
            {
                string token=null;
                if(Test.isRunningTest())
                {
                    token='****';
                }
                PartnerPortalGetCertificatesApi courseGradeAPI = new PartnerPortalGetCertificatesApi(String.valueOf(course.Course_Id__c),token,fetchDate);
                courseGradeAPI.execute();
                
                if(courseGradeAPI.Certificates!=null && courseGradeAPI.Certificates.size()>0)
                { 
                    for(PartnerPortalCertificate cert:courseGradeAPI.Certificates)
                    {
                        cert.courseId= course.Course_Id__c;
                    }
                    mapCourseData.put(course.Id,courseGradeAPI.Certificates);
                }  
                if(fetchDate==null)
                {fetchDate=Date.today();}
                lstCourseToUpdate.add(new LMS_Course__c(Id=course.Id,Last_Fetch_Date__c=fetchDate));
            }
            catch(Exception ex)
            {
                SilverPeakUtils.logException(ex);
                continue;
            }
        }
        System.Savepoint sp= Database.setSavepoint();
        try
        {
            
            if(lstCourseToUpdate.size()>0)
            {
                update lstCourseToUpdate;
            }
            if(mapCourseData.size()>0)
            {
                LMSBatchHelper.InsertCertificationData(mapCourseData);
            }
        }
        catch(Exception ex)
        {
            Database.rollback(sp);
            SilverPeakUtils.logException(ex);
        }
        
        
    }  
    
    public void finish(Database.BatchableContext context)
    {
        LMSFetchCertificationDetailsBatch obj= new LMSFetchCertificationDetailsBatch();
        Database.executeBatch(obj,1);
        
    }
}
@IsTest 
public class TestRequeueCaseController {
    @IsTest(SeeAlldata=true)
    public static void TestRequeueCase()
    {
        Account acc = new Account(Name='acme');
        insert acc;
        Profile prof = [SELECT Id FROM Profile WHERE Name='System Administrator']; 
        User usr = new User(Alias = 'standt', Email='testUser@testtechuser.com', 
                                 EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US', 
                                 LocaleSidKey='en_US', ProfileId = prof.Id,
                                 TimeZoneSidKey='America/Los_Angeles', UserName='testUser@testtechuser.com');
        
        usr.IsActive =true;
        insert usr;
        
        System.debug('usr.Id'+usr.Id);
        System.debug('usr.Email'+usr.Email);
        
        Contact con = new Contact(FirstName='TestFirstName',LastName='TestLastName',AccountId=acc.Id, email='testUser@testpartnerUser.com');
        insert con;
        Case caseData = new Case();
        caseData.ContactId= con.Id;
        caseData.Subject='Test Data';
        caseData.Status='In Process';
        caseData.Type='Technical Support';
        caseData.Origin='Web';
        caseData.Priority='P3 - Normal';
        caseData.OwnerId=usr.Id;
        caseData.CC10__c='abc1@example.com';
        caseData.CC11__c='abc1@example.com';
        caseData.CC12__c='abc1@example.com';
        caseData.CC9__c='abc1@example.com';
        caseData.CC8__c='abc1@example.com';
        caseData.CC7__c='abc1@example.com';
        caseData.CC6__c='abc1@example.com';
        caseData.CC5__c='abc1@example.com';
        caseData.CC4__c='abc1@example.com';
        caseData.CC3__c='abc1@example.com';
        caseData.CC2__c='abc1@example.com';
        caseData.CC1__c='abc1@example.com';
        insert caseData;
        
        caseData.OwnerId=usr.Id;
        update caseData;
        System.debug('caseData.Id'+caseData.OwnerId);
        PageReference pageRef= new PageReference('/apex/RequeueCase?id='+caseData.Id);
        Test.setCurrentPage(pageRef);
        ApexPages.StandardController stdController = new ApexPages.StandardController(caseData);
        RequeueCaseController controller = new RequeueCaseController(stdController);
        controller.AutoSave();
        Case outputCase=[Select OwnerId,Status from Case where Id=:caseData.Id];
        System.assertEquals('Customer Awaiting Call', outputCase.Status);
        
    }
}
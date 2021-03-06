@isTest
public class RegisterAccountControllerTest {
    @isTest
    public  Static void test()
    {
        Account initialAcct = new Account(Name = 'testAcct', Email_Domain_Used__c='@saa.com');
        insert initialAcct;
        
        RegisterAccountController rac = new RegisterAccountController(null);
        Account newAcct = new Account(Name = 'testAccount',business_is_Product_Sales__c = 20,business_is_Services_Sales__c = 30,business_is_Consulting_Sales__c = 50);
        newAcct.Email_Domain_Used__c = '@saa.com';
        rac.acct = newAcct;
        rac.ppapa.Region__c = 'abc';
        rac.ppapa.Country__c = 'USA';
        rac.acct.TOP_3_industries__c = 'abcd;sads;s';
        rac.acct.Phone = '3144978194';
        rac.acct.Tax_ID_Number__c = '123456789';
        rac.acct.Distributor_of_Choice__c = 'Disney';
        rac.acct.BillingCity = 'San Francisco';
        rac.acct.BillingState = 'California';
        rac.acct.Years_in_Business__c = '25';
        rac.acct.BillingStreet = 'sanxia';
        rac.acct.BillingPostalCode = '51121';
        rac.acct.Website = 'snapbi.com';
        rac.acct.Integrate_cloudsolutions_with_vendors__c = 'No';
        rac.acct.Are_you_an_authorized_partner_of__c = 'asds';
        rac.acct.Marketting_Oferrings__c = 'asd';
        rac.acct.Primary_target_market_size__c = '1~20';
        rac.acct.Provide_technical_support__c = 'Not any';
        rac.acct.Own_brand_of_professional_services__c = 'Dell';
        rac.acct.Number_of_employees_in_your_organization__c = '20~50';
        rac.acct.total_annual_sales_revenues_last_year__c = '1000000';  
        rac.acct.Silver_Peak_oppo_pend__c = 'pending';
        rac.acct.Are_you_the_primary_partner_contact__c = 'Yes';
        rac.acct.Reseller_Agreement_Acknowledged__c = false;
        
        rac.primaryContact.Email = 'abc@saa.com';
        rac.primaryContact.LastName = 'Acme';
        rac.primaryContact.Phone = '3144978194';
        rac.primaryContact.Title = 'Silly Bear';
        rac.primaryContact.FirstName = 'Winnie';
        rac.primaryContact.Business_Function__c = 'kkk';
        rac.primaryContact.Job_Role__c = 'ccc';
        
        rac.signatoryContact.LastName = 'Bcme';
        rac.signatoryContact.Email = 'ccc@saa.com';
        rac.signatoryContact.Phone = '3144978194';
        rac.signatoryContact.FirstName = 'Winnie';
        rac.signatoryContact.Title = 'Silly Bear';
        rac.signatoryContact.Business_Function__c = 'kkk';
        rac.signatoryContact.Job_Role__c = 'ccc';
        
        rac.marketingContact.LastName = 'Acme';
        rac.marketingContact.Email = 'sss@saa.com';
        rac.marketingContact.Phone = '3144978194';
        rac.marketingContact.FirstName = 'Winnie';
        rac.marketingContact.Title = 'Silly Bear';
        rac.marketingContact.Business_Function__c = 'kkk';
        rac.marketingContact.Job_Role__c = 'ccc';
        
        rac.registerContact.LastName = 'Acme';
        rac.registerContact.Email = 'rrr@saa.com';
        rac.registerContact.Phone = '3144978194';
        rac.registerContact.FirstName = 'Winnie';
        rac.registerContact.Title = 'Silly Bear';
        rac.registerContact.Business_Function__c = 'kkk';
        rac.registerContact.Job_Role__c = 'ccc';
        
        rac.dataBinding = new Map<String,String>{
            'pcEmail' => 'pc@saa.com',
            'scEmail' => 'sc@saa.com',
            'mcEmail' => 'mc@saa.com',
            'rcEmail' => 'rc@saa.com',
            'outside' => '12',
            'inside' => '12',
            'engineers' => '22',
            'product' => '30',
            'services' => '20',
            'consulting' => '50',
            'accountName' => 'Acme',
            'pcLastName' => 'Bcme',
            'scLastName' => 'scme',
            'mcLastName' => 'mcme',
            'rcLastName' => 'rcme'           
        };
        rac.insertAccount();
        rac.insertAccount();
        
        RegisterAccountController newRac = new RegisterAccountController(null);
        Account newAcct1 = new Account(Name = 'testAccount',business_is_Product_Sales__c = 10,business_is_Services_Sales__c = 30,business_is_Consulting_Sales__c = 50);
        newAcct1.Email_Domain_Used__c = '123';
        newRac.acct = newAcct1;
        try
        {
            newRac.insertAccount();
        }
        catch(Exception e)
        {
            e.getMessage();
        }
        
        newAcct1.Email_Domain_Used__c = '';
        newAcct1.Are_you_the_primary_partner_contact__c = 'No';
        newAcct1.Tax_ID_Number__c = 'test';
        newAcct1.Integrate_cloudsolutions_with_vendors__c = 'Yes';
        newAcct1.Please_Name_the_Vendors__c = '';
        newAcct1.Distributor_of_Choice__c = '123';
        
        newRac.dataBinding = new Map<String,String>{
            'pcEmail' => 'pp@saa.com',
            'scEmail' => 'pp@saa.com',
            'mcEmail' => 'pp@saa.com',
            'rcEmail' => 'pp@saa.com',
            'outside' => 'a',
            'inside' => 'b',
            'engineers' => 'c',
            'product' => 'a',
            'services' => 'b',
            'consulting' => 'c',
            'accountName' => 'Acme1',
            'pcLastName' => 'Bcme2',
            'scLastName' => 'scme3',
            'mcLastName' => 'mcme4',
            'rcLastName' => 'rcme5'           
        };
        newRac.acct.BillingCity = '234';
        newRac.acct.BillingState = '234';
        newRac.primaryContact.Email = 'abc@saa.com';
        newRac.primaryContact.LastName = 'Acme123';
        newRac.primaryContact.Phone = '314497phone8194';
        newRac.primaryContact.FirstName = '1231';
        newRac.primaryContact.Title = '123';
        
        
        newRac.signatoryContact.LastName = '123';
        newRac.signatoryContact.Email = 'ccc@saa.com';
        newRac.signatoryContact.Phone = 'phone';
        newRac.signatoryContact.FirstName = '123';
        newRac.signatoryContact.Title = '123';
        
        
        newRac.marketingContact.LastName = 'Ac123me';
        newRac.marketingContact.Email = 'sss@saa.com';
        newRac.marketingContact.Phone = 'phone4978194';
        newRac.marketingContact.FirstName = '123';
        newRac.marketingContact.Title = '123';
        
        
        newRac.registerContact.LastName = '123';
        newRac.registerContact.Email = 'sss@saa.com';
        newRac.registerContact.Phone = 'phone4978194';
        newRac.registerContact.FirstName = '123';
        newRac.registerContact.Title = '123';
        
        try
        {
            newRac.insertAccount();
        }
        catch(Exception e)
        {
            system.debug(e.getMessage());
        }
    }
}
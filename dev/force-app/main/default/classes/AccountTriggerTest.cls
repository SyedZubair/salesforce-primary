@isTest(SeeAllData = false)
public class AccountTriggerTest {

    //3 things
    //1. Setup the virtual data
    //2. Proper testing (Positive, Negative, Load/Stress)
    //3. Assertion should be in place
    //
   
    //1. Setup the virtual data
    @testSetup
    static void testData(){
        //Here I will create the virtual data
        //200 Records
        List<Account> newAccountList = new List<Account>{};
            
            for(Integer i =0; i<200; i++){
                Account acc = new Account (Name = 'Uday '+i, Active__c ='Yes', Match_Billing_Address__c = true, ShippingPostalCode = '234567'+i);
                newAccountList.add(acc);
            }
        
        insert newAccountList;     
       
        
    }
    
    //2. Proper testing (Positive, Negative, Load/Stress)
    @isTest
    static void testPositive(){
        List<Account> virAccount = [Select Id, Name, Active__c from Account];
        system.debug('Inside Virtual Account list: '+virAccount);
        
        for(Account acc: virAccount){
            acc.Active__c = 'No';
        }
        
        Test.startTest();
        
        try{
            update virAccount;
        }catch(Exception ex){
            //3. Assertion should be in place
            system.debug('Exception: '+ex.getMessage());
            system.assertNotEquals('', ex.getMessage());
        }
        
        
        //Once DML is done this is the result
        system.assertNotEquals('Yes', virAccount[0].Active__c);
        system.assertEquals(200, virAccount.size());
        
        Test.stopTest();
    }
    
    @isTest
    static void testNegative(){
        //Would be testing the negative of actual logic
        //Test Scenario 1 - Passing Null Values to the method
        AccountTriggerHandler.validateAccountActive(null, null);
        
        //Test Scenario 2 - Passing empty Values to the method
        //Old and new empty map
        Map<Id, Account> triggerOldMap = new Map<Id, Account>{};
            Map<Id, Account> triggerNewMap = new Map<Id, Account>{};
        AccountTriggerHandler.validateAccountActive(triggerOldMap, triggerNewMap);
        
        //Test Scenario 3 - Passing Null & empty Values to the method
        AccountTriggerHandler.validateAccountActive(triggerOldMap, null);
        
        //Uday to handle the null scenario
        //AccountTriggerHandler.captureBillingPostalCode(null);
        
    }
    
}
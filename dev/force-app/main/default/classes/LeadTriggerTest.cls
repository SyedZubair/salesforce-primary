@isTest
public class LeadTriggerTest {

    @testSetup
    public static void testData(){
        //Lead leadRecord = new Lead(FirstName = 'Test', LastName='Test', Company='Test-harnes');
        //insert leadRecord;
    }
    
    @isTest 
    public static void postiveTest(){
       /* try{
            Lead queriedLead = [Select Id, Name,FirstName,LeadSource,  AnnualRevenue from Lead ];
            queriedLead.AnnualRevenue = 123;
            queriedLead.FirstName = '13213213';
            queriedLead.LeadSource = 'test';
            
            Test.startTest();
            update queriedLead;
            Test.stopTest();
            
            System.assertEquals('13213213', queriedLead.FirstName);
            
        }catch(Exception ex){
            
        }*/
        
    }
     
    @isTest 
    public static void negativeTest(){
        //Map<Id, Lead> oldMap, newMap;
        //oldMap = new Map<Id, Lead>([select id, AnnualRevenue, FirstName from Lead]);
        //newMap = new Map<Id, Lead>([select id, AnnualRevenue, FirstName from Lead]);
            
        //LeadTriggerHelper.restricFieldValueChange(oldMap, newMap);
    }
    
}
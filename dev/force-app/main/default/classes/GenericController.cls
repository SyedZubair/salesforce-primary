/*
Desc - It is a class for Lightning Generic Component

*/

public class GenericController {

    @AuraEnabled
    public static List<Lead> getMeOpenLeads(){
        List<Lead> openLeadList = [Select Id, Name, Email, Company, ProductInterest__c from Lead 
                                   Where ProductInterest__c != null and Status =: 'Open - Not Contacted'];
        
        return openLeadList;
        
    }
    
    
    @AuraEnabled
    public static List<Case> getMeOpenCases(){
        List<Case> openCaseList = [Select Id, CaseNumber, Status, Priority, CreatedDate from Case 
                                   Where Status != null and Status =: 'New'];
        
        return openCaseList;
        
    }
    
     @AuraEnabled
    public static List<Case> getMeTheCase(Id caseId){
        List<Case> openCaseList = [Select Id, CaseNumber, Status, Priority, CreatedDate from Case 
                                   Where Id =: caseId];
        
        return openCaseList;
        
    }
    
    
    
    @AuraEnabled
    public static List<Opportunity> getOpps(){
        List<Opportunity> oppList = [Select Id, Name, StageName, CloseDate from Opportunity];
        
        return oppList;
        
    }
    
    
    
}
public class AccountTriggerHandler {
    
    public static void validateAccountActive(Map<Id, Account>triggerOldMap, Map<Id, Account> triggerNewMap){
	
        //Maps should not be null
        if(triggerOldMap != null && triggerNewMap != null){
            
            for(Id accountId: triggerOldMap.keySet()){
                
                Account OldAccount = triggerOldMap.get(accountId);
                Account newAccount = triggerNewMap.get(accountId);
                //validate if the account is active 
                if(OldAccount.Active__c == 'Yes' && OldAccount.Active__c != newAccount.Active__c){
                    system.debug('Inside validation if block');
                    newAccount.Active__c.addError('You cannot make it inactive !!!!');
                }else{
                    system.debug('Inside validation else block');
                }
                
            }
        }
    }
    
    public static void captureBillingPostalCode(List<Account> triggerNew){
        for(Account acc : triggerNew)
        {
            if(acc.Match_Billing_Address__c)
            {
                acc.BillingPostalCode= acc.ShippingPostalCode;
            }
        }
    }
    
}
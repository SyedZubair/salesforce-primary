public class ContactTriggerHandler {
    
    @future
    public static void restoreContact(Set<Id> newContactIds){
        
        Map<Id, Contact> newMap  = new Map<Id, Contact>( [select Id, Name, MailingCountry, AccountId from Contact where Id IN: newContactIds ]);
        
        set<Id> accountIds = new set<id>{};
            for(Id contactId: newMap.keyset()){
                accountIds.add(newMap.get(contactId).AccountId);
            }
        
        List<Account> accountList = [Select Id, Name, BillingCountry, BillingCity, BillingState, BillingPostalCode, BillingStreet from Account where Id IN: accountIds];
        
        for(Id contactId: newMap.keyset()){
            for(Account acc: accountList){
                if(newMap.get(contactId).AccountId == acc.Id){
                    newMap.get(contactId).MailingCountry = acc.BillingCountry;
                    system.debug('Contact Mailing Country : '+newMap.get(contactId).MailingCountry);
                    system.debug('Account Billing Country : '+acc.BillingCountry);
                }    
            }
            
        }
        
        Database.upsert(newMap.values());
    }
}
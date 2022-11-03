public class AccountBatch implements Database.Batchable<sobject>{

    //Start - Data Load
    //Execute - Executing business logic
    //Finish - Termination of the batch
    
    public List<Account> start(Database.BatchableContext dbc){
        system.debug('inside start method');
        return Database.query('Select Id, Name from Account');
    }
    
    public void execute(Database.BatchableContext dbc, List<Account> records){
        system.debug('inside execute method');
        for(Account act: records){
            act.Private__c = true;
        }
        
        update records;
        
    }
    
    
    public void finish(Database.BatchableContext dbc){
        system.debug('inside finish method');
    }
    
}
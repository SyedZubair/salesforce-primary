public class SchedulerExample implements Schedulable{
    
    
    public void execute(SchedulableContext con){
        //logic to perform processing
        List<Account> accountList = Database.query('Select Id, Name from Account where Private__c=false');
        for(Account act: accountList){
            act.Private__c = true;
        }
        
        update accountList;
    }

}
public class AccountAsynQueue implements Queueable{
    
    public void execute(System.QueueableContext qc){
        //logic
        //1. Query 
        //2. Write business logic
        //3. send email after processing
        //
        //Batch Processing - Huge data 2Mn 
        //Queueable - if their any failures, need to reprocess the same, 
        //
        List<Account> accountList = Database.query('Select Id, Name from Account where Private__c=true');
        for(Account act: accountList){
            act.Private__c = false;
        }
        
<<<<<<< HEAD
        update accountList;
        // to create conflict in repo
=======
        //update accountList;
        Databse.update(accountList, false);
>>>>>>> fa831b831ba15084a20a87b8eb490fa933d1a594
        
        if(accountList.size()>0){
            AccountAsynQueue queueInstance = new AccountAsynQueue();        
            System.enqueueJob(queueInstance);
        }
        
    }

}
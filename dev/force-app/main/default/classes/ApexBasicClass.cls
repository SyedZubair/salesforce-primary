public class ApexBasicClass {
    
    private String name {get;set;}
    
    //constructor overridding
    public ApexBasicClass(String name){ 
        this.name = name;
    }
    
    public void sayHello(){
        system.debug('Name: '+this.name);
    }
    
    //sObject
    public static Account getMeTheAccount(String recordId){
        
        try{
            
            if(recordId !='' ){
                
                Account acct = [Select Id, Name From Account Where Id =: recordId];
                
                system.debug('Account Name: '+acct.Name);
                return acct;
            }else{
                return null;
            }
            
        }catch(Exception ex){
            system.debug('Exception caught: '+ex.getMessage());
            return null;
        }
       
        
    }
    
   
    
    

}
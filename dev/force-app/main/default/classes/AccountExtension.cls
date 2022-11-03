public class AccountExtension {
    
    //Save - save of record along with business logic
    //Clone - clone of record along with business logic
    //Delete - deletion of record along with business logic
    //
    
    public AccountExtension(ApexPages.standardController con){
        
    }
    
    public void save(){
        //overridding
        system.debug('You clicked on save');
    }

}
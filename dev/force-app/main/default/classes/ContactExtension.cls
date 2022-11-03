public class ContactExtension {

    public Boolean mainContentDisplay {get;set;}
    public Boolean calcPanel {get;set;}
    public Boolean errorMsgRender {get;set;}
    public Boolean result {get;set;}
    
    public Contact con {get;set;}
    
    // The extension constructor initializes the private member
    // variable acct by using the getRecord method from the standard
    // controller.
    public ContactExtension(ApexPages.StandardController stdController) {
        mainContentDisplay 	= true;
        calcPanel 			= false;
        errorMsgRender		= false;
        result				= false;
        con 				=  new Contact();
        con.RecordTypeId = [Select id, developername from RecordType where DeveloperName =: 'Visa_Techcon'].id;
        
    }

    public void renderCalc(){
        mainContentDisplay 	= false;
        calcPanel 			= true;
        result				= false;
    }
    
    public PageReference back(){
        mainContentDisplay 	= true;
        calcPanel 			= false;
        result				= false;
       return ApexPages.currentPage();

    }
    
    public void calculate(){
        /*mainContentDisplay 	= false;
        calcPanel 			= true; */
        
        try{
            
            errorMsgRender		= false;
            result				= false;
            system.debug('Contact: '+con);
            con.Email = con.Visa_NT_Id__c+'@visa.com';
            
            
            upsert con Email;
            
            con = [select id, Email, Name, Carbon_Credits__c, TLT__c, Salutation, FirstName, LastName, Visa_NT_Id__c, CC_Spenditure__c from contact where id=: con.Id];
            if(con != null){
                result	= true;
            }
        }catch(Exception ex){
            errorMsgRender		= true;
            result				= false;
            //ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR, 'Please fill the mandatory fields'));
        }
        
        
    }
}
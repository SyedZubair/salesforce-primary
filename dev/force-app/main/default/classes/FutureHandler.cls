public class FutureHandler {
    
    private static final String WAREHOUSE_URL = 'https://th-superbadge-apex.herokuapp.com/equipment';
    
    
    //future method
    //it is method doing is processing of the async things in background, 
    //when the resources are available
    //
    //Batch    	Executing 1Mn (2hrs)
    //Queueable Executing 50K (3 hrs)
    //Future - Waits until the resources are free (after 5hrs)

    @future(callout = true)
    public static void processContactCreation(){
        //logic to perform processing
        List<Account> accountList = Database.query('Select Id, Name from Account where Private__c=false');
        for(Account act: accountList){
            act.Private__c = true;
        }
        
        update accountList;
        
        
         List<Product2> lstOfEqup = new List<Product2>();
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(WAREHOUSE_URL);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        
        if (response.getStatusCode() == 200){
            List<Json2Apex> lstOfEquipments = (List<Json2Apex>) JSON.deserialize(response.getBody(), List<Json2Apex>.class);
            
            for(Json2Apex inst : lstOfEquipments){
                Product2 prod = new Product2();
                prod.Cost__c = inst.cost;
                prod.Lifespan_Months__c = inst.lifespan;
                prod.Maintenance_Cycle__c = inst.maintenanceperiod;
                prod.Name = inst.name;
                prod.Current_Inventory__c = inst.quantity;
                prod.Replacement_Part__c = inst.replacement;
                prod.Warehouse_SKU__c = inst.sku;
                
                lstOfEqup.add(prod);
            }
        }
        
        if(lstOfEqup != null && lstOfEqup.size() > 0){
            UPSERT lstOfEqup Warehouse_SKU__c;
        }
        
        
    }
    
    
     //Wrapper class for Responce details.
    private class Json2Apex{
        private String id;
        private Integer cost;
        private Integer lifespan;
        private Integer maintenanceperiod;
        private String name;
        private Integer quantity; 
        private boolean replacement;
        private String sku;          
    }
    
}
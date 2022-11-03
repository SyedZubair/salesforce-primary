public class MaintenanceRequestHelper {
    
    public static void updateWorkOrders(Map<Id,Case> mapMaintenanceRequestClosed)
    { 
    	// Create a list of maintaince request 
        List<Case> listMaintainceToInsert  = new List<Case>();
        
        // Create a list to store the Product Maintenance Cycle
        List<Product2> listProduct = [select Id, Maintenance_Cycle__c from Product2];  
        Map<Id,decimal> mapProduct = new Map<Id, decimal>();

        for (Product2 p : listProduct) {
            if (p != null) {
                if(p.Maintenance_Cycle__c != null){
                    mapProduct.put(p.Id, p.Maintenance_Cycle__c);
                }               
            }
        }

         // Now, let's make the magic happen
        for(Case maintenance:mapMaintenanceRequestClosed.values())
        {
            Case maintenanceNew = new Case();
            maintenanceNew.Subject = maintenance.Subject; 
            if (mapProduct.get(maintenance.Equipment__c) != null) 
            {            	
            	// Set the Due Date for the next maintenance
                 maintenanceNew.Date_Due__c = Date.today().addDays(Integer.valueOf(mapProduct.get(maintenance.Equipment__c)));
            }
            maintenanceNew.Vehicle__c = maintenance.Vehicle__c;
            maintenanceNew.Product__c = maintenance.Product__c;
            maintenanceNew.ContactId  = maintenance.ContactId;
            maintenanceNew.AccountId  = maintenance.AccountId;
            maintenanceNew.AssetId    = maintenance.AssetId;
            maintenanceNew.Type       = 'Routine Maintenance';
            maintenanceNew.Status     = 'New';
            maintenanceNew.Equipment__c = maintenance.Equipment__c;
            maintenanceNew.Date_Reported__c = Date.today();
            // Add this new maintenance to the list
            listMaintainceToInsert.add(maintenanceNew);
        }
        // Finally, with all complete list of future maintenance, we can now add the records:
        insert listMaintainceToInsert ;
    }        
    
}
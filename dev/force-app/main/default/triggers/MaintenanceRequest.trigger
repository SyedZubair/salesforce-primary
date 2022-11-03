trigger MaintenanceRequest on Case (after update) {
   //create new maintaince request when existing request of type Repair or Routine Maintenance is Closed.
   Map<Id,Case> mapMaintenanceRequestClosed = new Map<Id,Case>(); //holds the closed maintaince request
   for(Case maintenanceRec : trigger.new)
   {
       if(('Repair'.equals(maintenanceRec.Type) || 'Routine Maintenance'.equals(maintenanceRec.Type)) && 'Closed'.equals(maintenanceRec.Status))
       {
           mapMaintenanceRequestClosed.put(maintenanceRec.Id,maintenanceRec);
       }
   }
   // New maintaince request creating in the handler
   MaintenanceRequestHelper.updateWorkOrders(mapMaintenanceRequestClosed);  
}
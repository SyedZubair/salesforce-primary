public class WarehouseSyncSchedule implements Schedulable 
{
    public void execute(System.SchedulableContext cont)
    {
     	WarehouseCalloutService.runWarehouseEquipmentSync();
        
    }
}
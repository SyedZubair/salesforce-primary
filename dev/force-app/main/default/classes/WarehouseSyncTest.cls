@isTest private class WarehouseSyncTest {
	
	@isTest static void SyncTest() 
    {
		WarehouseSyncSchedule sync = new WarehouseSyncSchedule();
        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new WarehouseCalloutServiceMock());   
       	Datetime dt = Datetime.now().addMinutes(2);
        String CRON_EXP = '0 '+ dt.minute() + ' * ' + dt.day() + ' ' + dt.month() + ' ? ' + dt.year();
        String jobID = System.schedule('Test the Queue Status', CRON_EXP, sync);
        Test.stopTest();
        CronTrigger cTId = [SELECT State FROM CronTrigger WHERE Id = :jobID];
        System.assertEquals('WAITING', String.valueOf(cTId.State), 'job ID Does not Match');
    }
}
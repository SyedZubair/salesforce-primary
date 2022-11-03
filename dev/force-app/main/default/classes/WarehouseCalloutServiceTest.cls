@isTest private class WarehouseCalloutServiceTest 
{
  static testMethod void testCallOutWarehouseService()
  {
		Test.setMock(HttpCalloutMock.class, new WarehouseCalloutServiceMock());   
      	WarehouseCalloutService.runWarehouseEquipmentSync();
  }
}
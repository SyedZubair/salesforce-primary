@isTest
private class ParkLocatorTest 
{
    @isTest static void testCallout() 
    { 
        Test.setMock(WebServiceMock.class, new ParkServiceMock()); 
		ParkLocator.country('Germany');
        
    }
}
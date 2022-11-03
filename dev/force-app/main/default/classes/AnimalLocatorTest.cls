@isTest private class AnimalLocatorTest 
{
    @isTest static void testPostCallout(){
    Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock()); 
        string res = AnimalLocator.getAnimalNameById(1);
    }
	
}
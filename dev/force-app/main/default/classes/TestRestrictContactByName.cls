@IsTest
private class TestRestrictContactByName {
	static testmethod void testMaintenanceRequest() {
        try
        {
            Contact con = new Contact(LastName = 'INVALIDNAME');
        	insert con;
        } catch(Exception e){
            
        } 
      
    }
}
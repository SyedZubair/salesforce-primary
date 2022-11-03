@isTest
private class AccountManagerTest 
{
     private static testMethod void getAccountTest1() 
     {
         Account TestAcc = new Account(Name='Test record');
         insert TestAcc;
         Contact TestCon= new Contact(LastName='Test',  AccountId = TestAcc.id);
         insert TestCon;
         RestRequest req = new RestRequest();
         req.addHeader('Content-Type', 'application/json');
         req.requestURI = 'https://ap4.salesforce.com/services/apexrest/Accounts/'+TestAcc.Id+'/contacts';
         req.httpMethod ='GET';
         RestContext.request= req;
         Account acc = AccountManager.getAccount();
     }
}
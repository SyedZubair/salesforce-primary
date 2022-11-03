@RestResource(urlMapping='/Accounts/*/contacts')
global class AccountManager 
{
    @HttpGet
    global static Account getAccount()
    {
        RestRequest req = RestContext.request;
        string accId = req.requestURI.subStringBetween('Accounts/','/contacts');
        return [Select Id,Name,(Select id,name from contacts) From Account WHERE ID =: accId];
    }
}
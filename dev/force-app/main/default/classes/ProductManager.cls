public class ProductManager {
    
    //Query All the products
    @AuraEnabled
    public static List<Product2> fetchAllProducts(){
        
      List<Product2> products = [SELECT Id, Name, IsActive, Family, Cost__c FROM Product2 Where IsActive =true];
        return products;
        
    }
    
    
    @AuraEnabled
    public static String serverEcho(String firstName) {
        return ('Hello from the server, ' + firstName);
    }

}
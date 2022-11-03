public class CountryCodeHelper {
  /*public static String getCountryCode(String country) {
    Country_Code__mdt countryCode = [
      SELECT Id, MasterLabel, Country_Code__c
      FROM Country_Code__mdt
      WHERE MasterLabel = :country
      LIMIT 1
    ];
  
    return countryCode.Country_Code__c;
  }*/
    
    public static String getCountryCode(String country){
        Country_Code__mdt countryCodeMeta = Country_Code__mdt.getInstance(country);
        System.debug('----->'+countryCodeMeta);
        return countryCodeMeta.Country_Code__c;
    }
    
    
}
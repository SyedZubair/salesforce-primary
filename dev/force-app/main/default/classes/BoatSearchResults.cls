public class BoatSearchResults 
{
	@AuraEnabled
     public static List <Boat__c> getBoats(String boatTypeId) 
     {
         system.debug('inside getBoats:'+boatTypeId);
      if(String.isNotBlank(boatTypeId)){ 
          system.debug('inside if');
             return [SELECT id, Geolocation__Latitude__s,Geolocation__Longitude__s,BoatType__c, picture__c, name,contact__r.Name
                    FROM Boat__c
                    WHERE BoatType__c =:boatTypeId];
      } 
      else { 
          return [SELECT id, Geolocation__Latitude__s,Geolocation__Longitude__s,BoatType__c, picture__c, name,contact__r.Name
                    FROM Boat__c];
      }
        //return null; 
     }
    
}
({
	createNewBoat : function(component, selectedBoat) 
    {
       
		var newRecord = $A.get('e.force:createRecord');	
        newRecord.setParams({
            "entityApiName" : 'Boat__c'
         });  
        if(!selectedBoat == "")
        {
            newRecord.setParams({
                "defaultFieldValues" : {"BoatType__c" : selectedBoat}
            });
        }  
        newRecord.fire();
	}
})
({
    doInit : function(component, event, helper) 
    {
        var action = component.get('c.getBoats');
        action.setParams({
            "formData":null
        });
        action.setCallback(this,function(respone){ 
            var resp = respone.getState();
            if(resp === 'SUCCESS'){
                component.set('v.boatTypeObj',respone.getReturnValue());
            }
        });
         $A.enqueueAction(action);

	},
    createBoat :  function(component, event, helper) 
    {
		var boatSelected = component.find('selectedBoat').get('v.value');
        component.set('v.showNewButton', createRecordEvent);
        //helper.createNewBoat(component,boatSelected);
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
    },
	onFormSubmit : function(component, event, helper) 
    { 
        var boatSelected = component.find('selectedBoat').get('v.value');
		var evn = component.getEvent('FormSubmit');
        evn.setParams({"formData" : 
                       {"boatTypeId" : boatSelected}
        });
        evn.fire();       
	}
})
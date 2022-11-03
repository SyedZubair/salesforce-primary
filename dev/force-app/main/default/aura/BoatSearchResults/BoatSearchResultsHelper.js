({
    onSearch : function(component,boatTypeId)
    {  
        var action = component.get("c.getBoats");
        action.setParams({
            boatTypeId :boatTypeId
        });
        action.setCallback(this, function(response){ 
        var status = response.getState();alert(status);
            if(status === "SUCCESS"){
             if(! $A.util.isEmpty(response.getReturnValue())){ 
                    component.set("v.boats",response.getReturnValue()); 
                } else {
                     component.set("v.recordError","No boats found");
                }
            }
        });
        $A.enqueueAction(action);	
	}
})
({
	doSearch : function(component, event, helper) {
		console.log("BSRController: search called");
        var methodParams= event.getParam("arguments");
        helper.onSearch(component,methodParams.boatTypeId);
	},
    
    onBoatSelect : function(component, event, helper) {
        var eventSelcBoatId = event.getParam('boatId');
        component.set("v.selectedBoatId",eventSelcBoatId);
    }
})
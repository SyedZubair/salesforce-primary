({
	onFormSubmit : function(component, event, helper) {
		var selectedBoat = event.getParam('formData'); 
        var childComp = component.find("BSRcmp");
        childComp.search(selectedBoat.boatTypeId);
	}
})
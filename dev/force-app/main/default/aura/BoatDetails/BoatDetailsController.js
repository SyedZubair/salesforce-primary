({
	onBoatSelected : function(component, event, helper) {
		 var boatSelected = event.getParam("boat");
        component.set("v.id",boatSelected.Id);
        var service = component.find("service");
        service.reloadRecord() ;
	},
    onRecordUpdated : function(component, event, helper) {
        
    },
    
    onBoatReviewAdded : function(component, event, helper)
    {      
        component.find("tabs").set("v.selectedTabId", "boatreviewtab");
        //invoke a refresh on the reviews tab, calling public method refresh
        //BRcmp is the aura:id for the component when invoked in BoatDetails.cmp
        var boat = component.get("v.boat");
        console.log("onRecordUpdated called | boat: " + boat.Id);
        var BRcmp = component.find("BRcmp");
        console.log(BRcmp);
        var auraMethodResult = BRcmp.refresh();
        console.log("auraMethodResult: " + auraMethodResult); 
    }
})
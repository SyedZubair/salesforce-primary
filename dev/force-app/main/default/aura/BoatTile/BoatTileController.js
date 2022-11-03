({
	onBoatClick : function(component, event, helper) 
    {
        var boat = component.get("v.boat");
        var evnt = component.getEvent("BoatSelect");
        evnt.setParams({
            "boatId" : boat
        });
        evnt.fire();   
        
        var evntBoatSelected = $A.get("e.c:BoatSelected");
        evntBoatSelected.setParams({
            "boat" : boat
        });
        evntBoatSelected.fire();   
        
        //send geolocation to map.cmp through the PlotMapMarker Application event
		var lat = boat.Geolocation__Latitude__s;
		var long = boat.Geolocation__Longitude__s;
		var label = boat.Name; 
		var plotMapMarker = $A.get("e.c:PlotMapMarker");
        plotMapMarker.setParams({
            "sObjectId ":boat.Id,
            "lat":lat,
            "long":long,
            "label": label
        });
        plotMapMarker.fire();    
	}
})
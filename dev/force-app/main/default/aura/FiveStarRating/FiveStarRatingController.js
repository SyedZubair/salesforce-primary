({
	afterScriptsLoaded : function(component, event, helper) {
    // var domEl = [get dom element of rating area]
     var domEl = component.find("ratingarea").getElement();
     var currentRating = component.get("v.value");
    
     var readOnly = component.get("v.readOnly");
    var maxRating = 5;
    var callback = function(rating) {
     console.log('Hello1');
     console.log(rating);
    component.set('v.value',rating);
    console.log('Hello2');
    }
    console.log('Hello3');
    component.ratingObj = rating(domEl,currentRating ,maxRating,callback,readOnly); 
},
onValueChange: function(component,event,helper) {
     if (component.ratingObj) {
        var value = component.get('v.value');
        component.ratingObj.setRating(value,false);
    }
}
})
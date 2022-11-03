({
	pullOpenLeads : function(component) {
        
        component.set('v.columns', [
            {label: 'Name', fieldName: 'Name', type: 'text'},
            {label: 'Company Name', fieldName: 'Company', type: 'text'},
            {label: 'Email', fieldName: 'Email', type: 'email'},
            {label: 'Product Interests', fieldName: 'ProductInterest__c', type: 'text'}
        ]);
        
        //alert('invoking open lead action');
		//To make a call from JS to Apex
		//3 points
		//a. Create a object/var
		//b. prepare payload
		//c. call apex and handle results
		//
		//a) create a object
        var action = component.get('c.getMeOpenLeads');
        
        action.setParams({});
        
        action.setCallback(this,function(result){
           // alert('Did you returned anything?');
                            var returned = result.getReturnValue(); 
                            component.set('v.data', returned);
            	console.log(JSON.stringify(returned));
                           }
                           );
        
        //lightning action
        $A.enqueueAction(action);
             
        
        
	},
    pullOpenCases : function(component) {
        
        var actions = [
            { label: 'Show details', name: 'show_details' },
            { label: 'Delete', name: 'delete' }
        ];
        
        component.set('v.casesColumns', [
            {label: 'Case Number', fieldName: 'CaseNumber', type: 'text'},
            {label: 'Status', fieldName: 'Status', type: 'text'},
            {label: 'Priority', fieldName: 'Priority', type: 'text'},
            {label: 'Date/Time Opened', fieldName: 'CreatedDate', type: 'date'},
            { type: 'action', typeAttributes: { rowActions: actions } }
        ]);
        
        //alert('invoking open lead action');
		//To make a call from JS to Apex
		//3 points
		//a. Create a object/var
		//b. prepare payload
		//c. call apex and handle results
		//
		//a) create a object
        var action = component.get('c.getMeOpenCases');
        
        action.setParams({});
        
        action.setCallback(this,function(result){
            // alert('Did you returned anything?');
            var returned = result.getReturnValue(); 
            component.set('v.cases', returned);
            console.log(JSON.stringify(returned));
        });
        
        //lightning action
        $A.enqueueAction(action);
             
        
        
	},
    pullOpps : function(component) {
        
        
        component.set('v.oppsColumns', [
            {label: 'Opp Name', fieldName: 'Name', type: 'text'},
            {label: 'Stage', fieldName: 'StageName', type: 'text'},
            {label: 'Close Date', fieldName: 'CloseDate', type: 'date'}        
        ]);
        
        //alert('invoking open lead action');
		//To make a call from JS to Apex
		//3 points
		//a. Create a object/var
		//b. prepare payload
		//c. call apex and handle results
		//
		//a) create a object
        var action = component.get('c.getOpps');
        
        action.setParams({});
        
        action.setCallback(this,function(result){
            // alert('Did you returned anything?');
            var returned = result.getReturnValue(); 
            component.set('v.opps', returned);
            console.log(JSON.stringify(returned));
        });
        
        //lightning action
        $A.enqueueAction(action);
             
        
        
	},
    getSelectedCase : function(component, caseId) {
        
        var action = component.get('c.getMeTheCase');
        
        action.setParams({
            'caseId': caseId
        });
        
        action.setCallback(this,function(result){
            // alert('Did you returned anything?');
            var returned = result.getReturnValue(); 
            component.set('v.SelectedCase', returned);
            
            component.set("v.isModalVisible", true);
            
            console.log(JSON.stringify(returned));
        });
        
        //lightning action
        $A.enqueueAction(action);
             
        
        
	}
    
})
({
	handleClick : function(component, event, helper) {
		//make the attribute to true
		//isModalVisible
		component.set("v.isModalVisible", true);
	},
    handleCancel : function(component, event, helper) {
		//make the attribute to true
		//isModalVisible
		component.set("v.isModalVisible", false);
    },
    doInit: function(component, event, helper) {
        //call the helper
        helper.pullOpenLeads(component);
        helper.pullOpenCases(component);
        helper.pullOpps(component);
        
    },
    handleRowAction: function (cmp, event, helper) {
        var action = event.getParam('action');
        var row = event.getParam('row');

        switch (action.name) {
            case 'show_details':
                alert('Selected Record Id: '+row.Id);
                alert('Showing Details: ' + JSON.stringify(row));
                helper.getSelectedCase(cmp, row.Id);
                break;
            case 'delete':
                alert('You clicked on delete')
                break;
        }
    }
})
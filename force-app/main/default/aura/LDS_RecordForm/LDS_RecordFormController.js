({
	handleSubmit : function(component, event, helper) {
		event.preventDefault(); 
        const fields = event.getParam('fields');
        fields.AccountId = component.get('v.recordId');
        component.find('recordForm').submit(fields);
	}
})
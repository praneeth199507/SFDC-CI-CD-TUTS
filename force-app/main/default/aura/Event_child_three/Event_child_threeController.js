({
	pump : function(component, event, helper) {
		var nam = event.getParam('empName');
        var ag = event.getParam('age');
        component.set('v.mName',nam);
        component.set('v.mage',ag);
	}
})
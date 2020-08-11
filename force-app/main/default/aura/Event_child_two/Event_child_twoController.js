({
	jump : function(component, event, helper) {
		var nqwe = event.getParam('empName');
        var a = event.getParam('age');
        component.set("v.myName",nqwe);
        component.set("v.myage",a);
	}
})
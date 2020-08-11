({
	jump : function(component, event, helper) {
		var a = component.get("v.aval");
        var b = component.get("v.bval");
        var c = a + b;
        component.set("v.cval",c);
	}
})
({
	append : function(component, event, helper) {
		var fname=component.find("fname").get("v.value");
        var lname=component.find("lname").get("v.value");
        var name = fname+" "+lname;
        component.find("name").set("v.value",name);
        
	},
    dispend : function(component, event, helper) {
		component.find("fname").set("v.value","");
        component.find("lname").set("v.value","");
        component.find("name").set("v.value","");
        
	}
})
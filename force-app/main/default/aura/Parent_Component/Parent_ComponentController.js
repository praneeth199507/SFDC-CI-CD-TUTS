({
	show : function(component, event, helper) {
		component.set("v.name","Praneeth Reddy");
        component.set("v.age",25);
        component.set("v.city","HYD");
        component.set("v.place","Golconda");
        
	},
    invoke : function(component, event, helper) {
		alert("This awesome");
        
	}
})
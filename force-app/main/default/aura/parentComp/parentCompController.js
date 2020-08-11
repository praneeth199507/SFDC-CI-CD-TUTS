({
	parentbutton : function(com, event, helper) {
        alert('From Parent Component Controller');
        com.set("v.Bvalue","99");
		
	},
    onChildAttrChange: function(cmp, evt) {
        alert("Parent attribute has changed");
        alert("old value: " + evt.getParam("oldValue"));
        alert("current value: " + evt.getParam("value"));
    },
    handleeevent : function(component, event, helper) {
		alert('Handled in first  parent branch');
        var sdet = event.getParams('parentvalue');
        component.set("v.Bvalue",sdet.parentvalue);
	}

})
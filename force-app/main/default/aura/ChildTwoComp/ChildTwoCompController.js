({
	handlereevent : function(component, event, helper) {
		alert('Handled in second branch parent');
        var sdet = event.getParams('parentvalue');
        component.set("v.allit",sdet.parentvalue);
	}
})
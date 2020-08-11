({
	invoke : function(component, event, helper) {
		  var evt = component.getEvent('myEvent');
        evt.setParams({'empName':'Praneeth Reddy'});
        evt.fire();
	}
})
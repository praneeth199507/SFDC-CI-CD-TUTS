({
	invoke : function(component, event, helper) {
        var evt = $A.get("e.c:Event_Two");
        evt.setParams({"empName":"Praneeth Reddy","age":"yu"});
        evt.fire();
	}
})
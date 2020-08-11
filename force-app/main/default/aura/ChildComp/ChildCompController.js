({
	handlechildbutton : function(component, event, helper) {
        var attributeValue = component.get("v.Avalue");
        var firstevent = $A.get("e.c:LearnEvent");               
                firstevent.setParams({
                        parentvalue: attributeValue
                });
        console.log('Value of event is ' + attributeValue);
                firstevent.fire();  
		
	},
    handleevent : function(component, event, helper) {
       alert('Handled in source component');
	}
})
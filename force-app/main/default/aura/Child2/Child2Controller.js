({
	fetchData : function(component, event, helper) {
		alert('In Second Component');
        var par = event.getParam('arguments');
        alert(par.param1);
        component.set('v.first',par.param1);
       
	}
})
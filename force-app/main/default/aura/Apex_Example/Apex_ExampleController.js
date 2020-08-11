({
	display : function(component, event, helper) {
        var abc = component.get("c.callMe");
        abc.setCallback(this,function(response){
            console.log('Method Invoked');
        var state = response.getState();
        if(state==='SUCCESS'){
            console.log('Operation Success');
            var res = response.getReturnValue();
            component.set("v.fname",res);
        }
        else{
            if(state==='ERROR'){
                console.log('Error');
            }
        }
        });
        
        $A.enqueueAction(abc);
		
	}
})
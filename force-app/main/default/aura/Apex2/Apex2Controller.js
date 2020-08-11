({
	invoke : function(component, event, helper) {
        var gd = component.find("fname").get("v.value");
        component.set("v.columns",[
            {label:"Name",fieldName:"Name",type:"text"},
            {label:"Stage Name",fieldName:"StageName",type:"text"}
        ]);
		var action = component.get("c.myData");
        action.setParams({"sn":gd});
        action.setCallback(this,function(response){
           var state = response.getState();
            console.log("Method Invoked");
            if(state==="SUCCESS"){
                 console.log("Method Success");
                var def = response.getReturnValue();
                component.set("v.acc",def);
            }
            else{
                  console.log("Method Failure");
            }
        });
        $A.enqueueAction(action);
        
	}
})
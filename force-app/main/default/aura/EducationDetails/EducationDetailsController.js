({
	deldetails : function(co, event, helper) {
         
        var temp = co.get("v.deledudetails");
        var currentindex = co.get("v.indexNo");
        if(currentindex > -1)
            temp.splice(currentindex,1);
        co.set("v.deledudetails",temp)
	}
})
({
	aftersubmit : function(comp) {
        var intvalue = comp.get("v.abc");
        
        if(intvalue == "true"){
            alert("HAHAHA...U cant submit now");
            comp.set("v.abc","false");
        }
        
        else{
            alert("Value is False");
            comp.set("v.abc","true");
        }
		
	},
    
    aftercheck : function(comp,eve,help){
        help.helperCheck(comp,eve);
    },
    
    
    adddetails : function(comp,eve,help){
    var currenteddetlist = comp.get("v.addedudetails");
    var oldvalue = parseInt((currenteddetlist.length));
    var newvalue = parseInt((oldvalue.length)+1);
    currenteddetlist.push(newvalue);
    comp.set("v.addedudetails",currenteddetlist)
    }
})
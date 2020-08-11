({
	handlerecordchanges : function(component, event, helper) {
		  var evechange = event.getParams();
        if(evechange.changeType==="LOADED"){           
            console.log("Loaded Record")        
            var toastresults = $A.get("e.force:showToast")
            toastresults.setParams({
                "title":"Load Successfull",
                "message":"Record Load Was Successfull"
            });
             toastresults.fire();
        }              
        else if(evechange.changeType==="CHANGED"){ 
             console.log("Loaded Record")        
            var toastresult = $A.get("e.force:showToast")
            toastresult.setParams({
                "title":"Updated",
                "message":"Record Update Was Successfull"
            });
             toastresult.fire();
        }
        else if(evechange.changeType==="REMOVED"){  
            var settoast = $A.get("e.force:showToast");
            settoast.setParams({
                'title':'Deleted',
                'message':'Record is successfully Deleted'
            });
            settoast.fire();
        }      
        else if(evechange.changeType==="ERROR"){
            console.log("error while loading")
        }
	},
    
    handleSaveRecord : function(component, event, helper) {
        component.find("showRecords").saveRecord($A.getCallback(function(saveResult){
             var status = saveResult.state;  
            if(status==="SUCCESS"){
                console.log(" Record Update Success");
            }
            else if (status=="ERROR")
                 console.log(" Record Update Failure");
           }));
        
	},
    
     handleDelete : function(component, event, helper) {
         component.find("showRecords").deleteRecord($A.getCallback(function(deleteresult){
                 var res = deleteResult.state;
             if(res==="SUCCESS"){
                 console.log(" Record Deletion Success");
             }
             else if(res==="ERROR"){
                 console.log(" Record Deletion Failure");
             }
         }));
         
     },
    
    handleNew : function(component, event, helper) {
        
        component.find("createRecord").getNewRecord(
            'Account',
            null,
            false,
            $A.getCallback(function(){
            
        }));
       
    },
    
    handleCreate : function(component, event, helper) {
        component.find("createRecord").saveRecord($A.getCallback(function(saveResult){
             var status = saveResult.state;  
            if(status==="SUCCESS"){
                console.log(" New Record creation Success");
            }
            else if (status=="ERROR")
                 console.log(" New Record creation Failure");
           }));
        
	}
})
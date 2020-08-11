({
	invoke : function(component, event, helper) {
	 var abcaction = component.find("abc").getNewRecord("Contact",
                                       null,
                                       false,
                                      $A.getCallback(function(){
                                        var asd = component.get("v.sample");
                                         var mymsg = component.get("v.error");
                                          if(asd===null || mymsg){
                                              console.log('Record not created');
                                              return;
                                          }else{
                                              console.log('Record creation passed');
                                          }
                                                         }));
	}
})
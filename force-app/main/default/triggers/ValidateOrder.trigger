trigger ValidateOrder on Class__c (After  update) {
    for(Class__C c:Trigger.new){
        Class__c cc= new  Class__c(ID=c.Id);
        cc.Students_Capacity__c = 100;
        update cc;
               }
    
}
trigger Trig2_Delete on Form_Creation2__c (before delete) {
    
    for(Form_Creation2__c fcs : Trigger.old ){
        system.debug(fcs.Reason_For_Deletion__c); 
        if((fcs.Reason_For_Deletion__c == null)){
            
           fcs.adderror('Please enter reason for deletion');
        }
    }

}
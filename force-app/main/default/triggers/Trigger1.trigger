trigger Trigger1 on Form_Creation2__c (before insert,before update) {
    if(Trigger.isinsert){
    integer size = Trigger.new.size();
    System.debug('Size of the trigger new is '+size);
    for( Form_Creation2__c fc :   trigger.new ) {
                if(fc.Gender__c == 'Male'){
                    fc.First_Name__c = 'Mr '+fc.First_Name__c;
        }
         if (fc.Gender__c == 'Female'){
            fc.First_Name__c = 'Miss '+fc.First_Name__c;
        }
    }
    }
    
   
}
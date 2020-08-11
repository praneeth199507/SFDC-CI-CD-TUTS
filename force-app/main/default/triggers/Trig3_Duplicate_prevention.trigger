trigger Trig3_Duplicate_prevention on Form_Creation2__c (before insert, before update) {
    set<String> firstnames = new set<String>();
    
    for(Form_Creation2__c fc : trigger.new){
        firstnames.add(fc.First_Name__c);
    }
      List<Form_Creation2__c> fcl =  [select id,First_Name__c from Form_Creation2__c where First_Name__c in : firstnames] ;
        
      Map<string,Form_Creation2__c> m1 = new Map<string,Form_Creation2__c>();
    
    for(Form_Creation2__c s2 : fcl){
        m1.put(s2.First_Name__c, s2);
    }
    
    for(Form_Creation2__c fcz : trigger.new){
        if(m1.get(fcz.First_Name__c) != null){
            fcz.adderror('Duplicate first name : '+fcz.First_Name__c);
        }
    }
    
}
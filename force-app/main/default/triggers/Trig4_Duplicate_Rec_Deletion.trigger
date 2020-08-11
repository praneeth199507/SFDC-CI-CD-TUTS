trigger Trig4_Duplicate_Rec_Deletion on Form_Creation2__c (before insert) {
	set<String> names = new set<String>();
    for(Form_Creation2__c newrec : Trigger.new){
        names.add(newrec.First_Name__c);       
    }
    
   List<Form_Creation2__c> qrecords =[select id,First_Name__c from Form_Creation2__c where First_Name__c in :names];
    Map<String,Form_Creation2__c> m1 = new Map<String,Form_Creation2__c> ();
    for(Form_Creation2__c f : qrecords ){
        m1.put(f.First_Name__c, f);
    }
    List<Form_Creation2__c> toberecords = new  List<Form_Creation2__c>();
    for(Form_Creation2__c nr : Trigger.new){
        if(m1.get(nr.First_Name__c) != null){
            toberecords.add(m1.get(nr.First_Name__c));
        }       
    }
    delete toberecords;
}
trigger PlasmaCompaniesDuplicateCheck on Company__c (before insert,before update) {
    set <String> s1 = new set <String>();
    for(Company__c company: trigger.new){
        s1.add(company.name);
    }  
     list<Company__C> comp =   [Select id,name from Company__c where name in :s1];
    Map<String,Company__C> m1 = new Map<String,Company__C>();
    for(Company__C c : comp){
       m1.put(c.name, c);
            }
        for(Company__c company: trigger.new){
            if(m1.get(company.name) != null){
                company.addError('Duplicate Company Name Found');
            }
    } 
}
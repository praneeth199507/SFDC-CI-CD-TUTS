trigger DelDupContacts on Account (After insert,After Update) {
    set<string> s1 = new set<string>(); 
    for(Account acc : trigger.new){
        s1.add(acc.name);
    }
   List<contact> con =  [select id,name from contact where name in : s1];
   map<String,contact> m1 = new map<string,contact>();
    for(contact c : con){
        m1.put(c.name, c);
    }
    List<Contact> tobedel= new List<Contact>(); 
    for(Account acc : trigger.new){
        if(m1.get(acc.Name) != null){
            tobedel.add(m1.get(acc.Name));
        }
    }
     delete tobedel;
}
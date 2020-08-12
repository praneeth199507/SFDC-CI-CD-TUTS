trigger Create_Conatcts_Based_On_Input on Account (After insert,After update) {
    Map<id,Decimal> mymap = new  Map<id,Decimal>();
    for(Account a : Trigger.new){ 
        mymap.put(a.id,12);
    }
    
    List<Contact> con = new List<contact>();
    
    if(trigger.isinsert && trigger.isafter){
       for(Account a : Trigger.new) {
        for(integer i=1;i<=mymap.get(a.Id);i++){
        Contact c = new Contact();
        c.AccountId = a.id;
        c.LastName = 'Default contact'+i;
        con.add(c);
        }
    }
         Insert con;
    }
    
    }
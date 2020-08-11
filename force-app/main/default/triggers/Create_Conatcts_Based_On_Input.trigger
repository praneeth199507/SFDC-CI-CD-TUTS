trigger Create_Conatcts_Based_On_Input on Account (After insert,After update) {
    Map<id,Decimal> mymap = new  Map<id,Decimal>();
    for(Account a : Trigger.new){ 
        mymap.put(a.id,a.NumberofLocations__c);
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
    if(trigger.isupdate && trigger.isAfter){
        for(id gf : mymap.keySet()) {
        if(trigger.oldmap.get(gf).NumberofLocations__c < trigger.newmap.get(gf).NumberofLocations__c){
            Decimal diff = trigger.newmap.get(gf).NumberofLocations__c - trigger.oldmap.get(gf).NumberofLocations__c;
            for(integer i=0 ; i<diff;i++){
                Contact c = new Contact();
                 c.AccountId = gf;
                 c.LastName = 'updatedcontact'+i;
                con.add(c);
            }
        Insert con;
        }
        if(trigger.oldmap.get(gf).NumberofLocations__c > trigger.newmap.get(gf).NumberofLocations__c){
            
         Decimal diff = trigger.oldmap.get(gf).NumberofLocations__c - trigger.newmap.get(gf).NumberofLocations__c;
           Integer last = diff.intValue();
            List<Contact> con1 = [select id from contact where AccountId =:gf limit :last];
            delete con1;
    }       
    }
    }
}
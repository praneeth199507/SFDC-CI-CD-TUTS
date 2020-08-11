trigger Update_Street_Con_Child on Account (After Update) {
   
    List<Contact> tobeucontacts = [select id,name,AccountId from Contact where AccountId in : trigger.newMap.keySet()] ;
    
    Map<id,Account> mymap = new  Map<id,Account>();
     
    For(Account a : trigger.new){
        mymap.put(a.id, a);    
    }
    
    for(Contact c : tobeucontacts){
        if(trigger.oldMap.get(c.AccountId).BillingStreet != mymap.get(c.AccountId).BillingStreet){
             c.otherstreet = mymap.get(c.AccountId).BillingStreet;
        Update c;
        }
       
    }
    

    
}
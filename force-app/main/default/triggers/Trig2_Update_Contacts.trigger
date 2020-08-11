trigger Trig2_Update_Contacts on Account (before update) {

    Map<Id,Account> mymap = trigger.newmap;
   List<Contact> qrecords =[select AccountId from Contact where AccountId in : mymap.keyset()];
    For(Contact c : qrecords){       
       c.description = mymap.get(c.AccountId).description;
   
    }
    Update qrecords;    
}
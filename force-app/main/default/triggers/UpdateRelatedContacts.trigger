trigger UpdateRelatedContacts on Account (after update) {
   List<Contact> con =  [select id,name,accountId from Contact where accountId in : trigger.newmap.keyset()]; 
    for(Account acc : trigger.new){
        if(trigger.oldmap.get(acc.id).billingStreet != acc.billingStreet)
        for(Contact c : con){
           c.otherstreet =  acc.billingStreet;          
        }
        }
    update con;
}
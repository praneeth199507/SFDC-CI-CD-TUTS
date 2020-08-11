trigger DynamicallyAddContacts on Account (After insert) {
    if(trigger.isafter && trigger.isinsert){
        List<contact> cont = new List<contact>();
        for(Account acc : trigger.new){
        for(integer i=1; i<=acc.NumberOfEmployees;i++){
            Contact con = new Contact();
            con.LastName='New Contact'+i;
            con.AccountId = acc.id;
            con.Phone='9498071556'+i;
            cont.add(con);
        }
    }
        insert cont;
    }  
    
}
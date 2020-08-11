trigger Create_Child_Records_Con_Opp on Account (after insert) {
    
    For(Account a : trigger.new){
        
        Contact c = new Contact();
        c.AccountId = a.id;
        c.lastname = 'Default Contact';
        insert c;
        
        Opportunity opp = new Opportunity();
        opp.AccountId = a.id;
        opp.Name = 'Default Opp';
        opp.CloseDate=System.today()+4;
        opp.StageName ='Prospecting';
        insert opp;
        
    }
        
       
    
}
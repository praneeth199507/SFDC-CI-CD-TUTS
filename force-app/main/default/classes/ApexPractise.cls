public class ApexPractise {
    public static void execute(){
        
      List<contact> con   = [select Accountid ,Name from contact where accountid in (select id from account where phone like '%949%')];
        
        for(contact c : con){
            system.debug(c);
        }

        
        /* List<aggregateresult> accid = new List<aggregateresult> ();
    accid  = [select AccountId from contact where accountid !=null group by accountid having count(ID) >2];
    set<id> acccid = new set<id>();
        acccid.addAll(accid);
        */
        
    }   
}
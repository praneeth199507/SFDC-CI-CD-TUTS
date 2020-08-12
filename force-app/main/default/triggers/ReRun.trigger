trigger ReRun on Account (After update) {
    
   List<contact> con =[select id,name from contact where contact.accountid in : trigger.new]; 
   List<contact> con1 = new List<contact>();
    integer i =0;
     integer j =0;
    for( Account acc : trigger.new) {
        if(!(trigger.oldMap.get(acc.id).Name==trigger.newMap.get(acc.id).Name)){
            for(Contact c1 : con){
                
                c1.FirstName = 'Created by trig on Acc'+i;
                 con1.add(c1);
                i++;
                j++;
            }
        }
    }
    update con1;
}
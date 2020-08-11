public class FirstWrapper {
   public List<myaccount> acclist{get;set;}
     public List<myaccount> accselected{get;set;}
    public  FirstWrapper(){
        acclist = new List<myaccount>();
        myaccount ma = new myaccount();
        ma.accountname ='Css Corp';
        ma.industryname='IT-ITES';
        ma.isselected=false;
        acclist.add(ma);
        myaccount ma1 = new myaccount();
        ma1.accountname ='Praneeth Tech';
        ma1.industryname='Cloud Computing';
        ma1.isselected=false;
        acclist.add(ma1);
        for(Account acc : [select name,industry from account where industry !=null  limit 10]){
           myaccount mac = new myaccount();
             mac.accountname =acc.Name;
        mac.industryname=acc.Industry;
        mac.isselected=false;
             acclist.add(mac);
        }
    }
    
    public class myaccount{
        public String accountname{get;set;}
        public String industryname{get;set;}
        public boolean isselected{get;set;}
    }
    
    public void filterlogic(){
            accselected = new List<myaccount>();
        for(myaccount my : acclist ){
            if(my.isselected){
                accselected.add(my);
                
            }
        }
    }

}
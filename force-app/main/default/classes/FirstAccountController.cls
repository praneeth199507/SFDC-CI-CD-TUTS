public class FirstAccountController {
    public Account acc {get; set;}
        
        public  FirstAccountController(){
            acc = new Account();
        }
 
    public PageReference save(){  
        if(acc.CustomerPriority__c == '' || acc.CustomerPriority__c == null ||
          acc.SLAExpirationDate__c == null){
            Apexpages.Message msg1 = new apexpages.Message(apexpages.Severity.ERROR,'Additional details should be entered');
              apexpages.addMessage(msg1);
              return null;
        }
        else{
            insert acc;
             return new PageReference('/'+acc.id);
        }
        
    }
    

}
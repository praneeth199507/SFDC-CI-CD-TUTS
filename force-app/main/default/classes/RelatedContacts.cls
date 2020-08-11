public class RelatedContacts {
	
  	 Integer count=0;
    public List<Contact> allcontacts{get;set;}
    public List<SelectOption> allaccounts{get;set;}
    public String selectedaccount{get;set;}
    
    public RelatedContacts(){
    allaccounts = new List<SelectOption>();
     allcontacts = new List<Contact>();  
         allaccounts.add(new SelectOption('','--None--'));
        for(Account acc : [select id,name from account] ){
            allaccounts.add(new SelectOption(acc.id,acc.name));
        }     
    }    
    public Pagereference getRelatedContacts(){
        if(selectedaccount != null){
            allcontacts = [select id,name,email from contact where accountId=:selectedaccount];
        }
        return null;
    }
    
    public Pagereference incrementcounter(){
        count++;
        return null;
    }
    
    public Integer getcount(){
        return count;
    }
        
        }
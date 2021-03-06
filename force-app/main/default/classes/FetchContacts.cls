public class FetchContacts {
    @auraEnabled
    public static List<Contact> getContactList(List<id> accountIds){      
        List<Contact> con = [Select Id,Name,Email,Phone,AccountId  from Contact where AccountId in :accountIds];   
       return con;
    }
    
    @auraEnabled
    public static Map<String,String> saveContactList(List<Contact> contactList){
           Map<String,String> resultMap = new Map<String,String>();
        try {
             update contactList;
           resultMap.put('status', 'success');
                resultMap.put('message', 'Contacts Updated Successfully');        
        }
        catch(Exception e) {
            resultMap.put('status', 'error');
                        resultMap.put('message',e.getMessage());
        }
         return resultMap;

    }
    
     @AuraEnabled
    public static Map<String,String> deleteContactList(List<Id> contactIds) {
        List<Contact> contactsToDelete = [SELECT Id FROM Contact WHERE Id in :contactIds];
        Map<String,String> resultMap = new Map<String,String>();
       try {
                delete contactsToDelete;
            resultMap.put('status', 'success');
                resultMap.put('message', 'Contacts Deleted Successfully');        
        }
        catch(Exception e) {
          resultMap.put('status', 'error');
                        resultMap.put('message',e.getMessage());
        }
       return resultMap;                
    }
}
@RestResource(urlMapping='/Account/*')
global with sharing class RestServices {
 @HTTPGet
    global static Account getaccountdetails(){
        RestRequest request = RestContext.request;
        String uri = request.requestURI;
        Id accid = uri.substring(uri.lastIndexOf('/')+1);
        Account acc = [select name,id,phone,industry from Account where id =:accid];
        system.debug(acc);
        return acc;        
    }
    
   @HttpPost
    global static Account createaccount(){
       RestRequest request = RestContext.request;
       Account acc = (Account) json.deserialize(request.requestBody.toString(), Account.class);
        Insert acc;
        return acc;        
    }
    
    @HttpDelete
    global static void deleteaccount(){
        RestRequest request = RestContext.request;
        String uri = request.requestURI;
        Id accid = uri.substring(uri.lastIndexOf('/')+1);
        Account acc = [select name,id from account where id=:accid];
        delete acc;
    }
    
    @HttpPut
    global Static id upsertaccount(String id , String name,string industry){
        Account acc = new Account(Id=id,Name=name,Industry=industry);
        upsert acc;
        return acc.Id;        
    }
    
    @HttpPatch
    global static id patchaccount(){
        RestRequest request = RestContext.request;
        String uri =request.requestURI;
        Id accid = uri.substring(uri.lastIndexOf('/')+1);
        Account acct = [select id,name from account where id =:accid];
        Map<String,Object> m1 = (Map<String,Object>)json.deserializeUntyped(request.requestBody.toString());
        for( String m : m1.keySet()){
            acct.put(m,m1.get(m));
        }
        update acct;
        return acct.Id;
        
    
    }
}
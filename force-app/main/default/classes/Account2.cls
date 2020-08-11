@RestResource(urlMapping='/AccountAPI/*')
global with sharing class Account2 {
    global class ResponseWrapper {
         String success;
        String message;
    }
   @HttpPost
    global static List<ResponseWrapper> createCase() {
       RestRequest request = RestContext.request;
       List<Account> acc = ( List<Account>) json.deserialize(request.requestBody.toString(), List<Account>.class);
         List<ResponseWrapper> responseWrapperList = new List<ResponseWrapper>();
       Database.SaveResult[] sr = Database.insert(acc,false);    
        for(Database.SaveResult updateResult : sr) {
             ResponseWrapper wrapper = new ResponseWrapper();
        if(updateResult.isSuccess()){
            wrapper.success = '1';
            wrapper.message = 'Successfully updated contact with Id: ' + updateResult.getId(); 
        }
        else{
            wrapper.success = '0';
            for(Database.Error er : updateResult.getErrors()){
               wrapper.message = 'The following error has occurred for contact with Id: ' + updateResult.getId() + '. ';
                   
            }
        }
            responseWrapperList.add(wrapper);
         }
        return responseWrapperList;
}
}
@IsTest
public class RestservicesTest {   
     
    @isTest static void testgetaccountdetails(){        
  
        RestRequest request = new RestRequest();
        request.requestURI = 'https://myfirstwebpage-dev-ed.my.salesforce.com/services/apexrest/Account/';
        request.httpMethod  = 'POST';
        String body = '{ "Name" : "Global Flights2",  "Industry" : "Energy"}';
         request.addHeader('Content-Type', 'application/json');
        request.requestBody = Blob.valueOf(body);
        RestContext.request = request;
        Account acc = RestServices.createaccount();
        System.assert(acc != null);
        system.assertEquals('Global Flights2', acc.Name);
    }  
}
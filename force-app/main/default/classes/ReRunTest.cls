@isTest
 class ReRunTest {
    @isTest 
      static void testAccount(){
        Account acc = new account();
          acc.name = 'Test Accnt triger';
          insert acc;
         Contact con = new contact();
          con.accountId = acc.id;
          con.LastName = 'Something';
          insert con;
          actualTest(acc.Id,con.id);
          system.debug('Account ID' +acc.Id);
          system.debug('Contact ID' +con.Id);
    }
     static void actualTest (Id accid,Id conid){
         Account acc = new Account (Id = accid);
         acc.Name ='Changed';
         update acc;
         Contact con1= new Contact(Id=conid);
         String name = con1.FirstName;
         system.debug('Account ID in second method' +acc.Id);
         system.debug('Contact ID in second method' +con1.Id);
         system.debug('Returned Contact name is '+name);         
     }
}
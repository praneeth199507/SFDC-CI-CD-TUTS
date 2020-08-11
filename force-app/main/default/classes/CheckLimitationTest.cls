@isTest
public class CheckLimitationTest {
 /*@testSetup
    static void setup(){
        List<Account> acc = new List<Account>();
        List<Contact> con = new List<Contact>();
        
        for(Integer i=0; i<20 ; i++){
            Account ac = new Account (Name='Test Account'+i,billingcity='New York', billingcountry='USA');
            acc.add(ac);
        }
        insert acc;
         for (Account account : [select id from account where billingcity='New York']) {
            con.add(new Contact(firstname='first', 
                lastname='last', accountId=account.id));
        }
        insert con;
           }*/
 @isTest
    static void test(){
        List<Account> acc = new List<Account>();
        List<Contact> con = new List<Contact>();
        
        for(Integer i=0; i<20 ; i++){
            Account ac = new Account (Name='Test Account'+i,billingcity='New York', billingcountry='USA');
            acc.add(ac);
        }
        insert acc;
         for (Account account : [select id from account where billingcity='New York']) {
            con.add(new Contact(firstname='first', 
                lastname='last', accountId=account.id));
        }
        insert con;
        Test.startTest();
        CheckLimitation cli = new CheckLimitation();
        Id jobid = Database.executeBatch(cli);
        Test.stopTest();
        System.assertEquals(20, [select count() from contact]);
    }
    
}
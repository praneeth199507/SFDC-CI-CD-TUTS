@isTest
public class FillPlasmaDetailsTest {
    @isTest static void mytest(){
        Deal_Details__c c = new Deal_Details__c();
        c.Name= 'FLipkart Sale';
        c.Price__c =2000;
        c.Product_Type__c='LED';
        Decimal abc = 948907;
        insert c;
           system.debug([select LED_Service_Vendor_Phone__c from Deal_Details__c where Name='FLipkart Sale']);
    }
}
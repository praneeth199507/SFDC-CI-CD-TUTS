public class DML_UPDATE {
    public static void updateRecord(){
        
        Form_Creation2__c formls = [Select First_Name__c,Country__c,Experience__c from Form_Creation2__c where first_name__c like '%pulihora gadu%'];
        formls.First_Name__c = 'Suri';
        Update formls;
       
            } 
    
    public static void bulkUpdate() {
         
        Form_Creation2__c[] formlist = [Select First_Name__c,Country__c,Experience__c from Form_Creation2__c where first_name__c like '%anvesh%' and Experience__c = '7'];
        List<Form_Creation2__c> tobeupdated = new List<Form_Creation2__c>();
        for( Form_Creation2__c formit : formlist ){
            formit.Country__c = 'US';
            tobeupdated.add(formit);
        }
        Update tobeupdated;
    } 
    
    public static void deleteRecords(){
        Form_Creation2__c[] formlist = [Select First_Name__c,Country__c,Experience__c from Form_Creation2__c where first_name__c like '%anvesh%' and Experience__c = '7'];
        Delete formlist;
    }
    
     public static void upsertRecords(){
         List<Form_Creation2__c> uprec = new List<Form_Creation2__c>{
            new Form_Creation2__c (First_Name__c='Anvesh',Country__c='INDIA',Experience__c='7',Languages_Known__c='RPA',Salary_Expected__c=50),
                 new Form_Creation2__c (First_Name__c='Anvesh',Country__c='UK',Experience__c='2',Languages_Known__c='AWS',Salary_Expected__c=700000)
                };
          Database.upsert(uprec,Form_Creation2__c.fields.Salary_Expected__c ,false) ;
             }
    
    Public static void relationshipStatus(){
       
      Sobject student =  [Select Name,Referred_Teacher__R.name from Student__c where name in ('Robert')];
       Sobject teacher = student.getSobject('Referred_Teacher__R.name');
       system.debug(teacher);
       
        
    }
}
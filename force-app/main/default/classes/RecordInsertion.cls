public class RecordInsertion {
    Public void RecordCreation(){
    Form_Creation2__c  formcreation = new Form_Creation2__C (First_Name__C='Dhoni',Country__C='INDIA');
    Insert formcreation;
    }
    
    Public Void UpdateRecord(){
      Form_Creation2__C id  =  [select Id,Country__C from Form_Creation2__C where First_Name__C='Dhoni'];
      System.debug(id);
        id.Experience__c= '2';
        id.Languages_Known__c = 'C';
        id.Last_Name__c ='MS';
        id.Salary_Expected__c = 660000;
        Update id;   
            }
    
    Public Void BulkInsert(){
        List<Form_Creation2__c>  fc = new List<Form_Creation2__c>{new Form_Creation2__C (First_Name__C='Jagan',Country__C='INDIA'),
            						  new Form_Creation2__C (First_Name__C='Andrew',Country__C='Australia'),
            						  new Form_Creation2__C (First_Name__C='williamson',Country__C='NewZealand'),
            						  new Form_Creation2__C (First_Name__C='Jhon Snow',Country__C='Germany'),
                                      new Form_Creation2__C (First_Name__C='Tiger',Country__C='INDIA')};
        Database.saveResult[] srList = Database.insert(fc,false);
        for(Database.SaveResult sr : srList){
            if(sr.issuccess()){
                system.debug('Succesfully inserted record RecordID:'+sr.id);
            }            
            else{
               for( Database.Error er : sr.getErrors() )
               {
                   system.debug('Status Code is'+er.getStatusCode()+'And message is'+er.getMessage());
               }
            }
        }
                
    }
    
    
    Public Void BulkUpdate()
    {
        Form_Creation2__C[] fc1 = [select Id,First_Name__c from Form_Creation2__C where SALARY_EXPECTED__C = null];
        Map <String,Integer> m1 = new map<String,integer>();
        List<String> Exp = new List<String>();
        Exp.add('2');
        Exp.add('3');
        Exp.add('4');
        List<String> LK = new List<String>();
        LK.add('RPA');
        LK.add('AWS');
        Lk.add('ANSI');
        List<String> LN = new List<String>();
        LN.add('RA');
        LN.add('AS');
        LN.add('AI');
        List<Integer> SE = new List<Integer>();
        SE.add(700000);
        SE.add(900000);
        SE.add(1000000);
        for(Form_Creation2__C f2 : fc1) {
            Integer i = 1;
            f2.Experience__c= Exp[i];
         	f2.Languages_Known__c = LK[i];
        	f2.Last_Name__c = LN[i];
        	f2.Salary_Expected__c = SE[i];
        	Update f2;
            i++;
        }        
    }
}
public class FirstClassOnDML {

    public static Void insertRecord() {      
        Form_Creation2__c fc = new Form_Creation2__c(
        First_Name__c='Anvesh',Country__c='UK',Experience__c='2',Languages_Known__c='AWS',Salary_Expected__c=700000);
        Insert fc;
        ID fcid = fc.Id;
        System.debug(fcid);     
    }
    
    public static void BulkInsert(){
        
        List<Form_Creation2__c> fc = new List<Form_Creation2__c>{
		new Form_Creation2__c(First_Name__c='anvesh',Country__c='UK',Experience__c='7',Languages_Known__c='AWS',Salary_Expected__c=700000),
        new Form_Creation2__c(First_Name__c='vempi',Country__c='Africa',Experience__c='5',Languages_Known__c='ANSI',Salary_Expected__c=800000),
        new Form_Creation2__c(First_Name__c='pogula',Country__c='Germany',Experience__c='4',Languages_Known__c='RPA',Salary_Expected__c=900000),
		new Form_Creation2__c(First_Name__c='reddy',Country__c='INDIA',Experience__c='4',Languages_Known__c='PYTHON',Salary_Expected__c=1000000)            
        };
            List<id> obid = new List<id>();
        for(Form_Creation2__c fnew : fc){
            if(fnew.Id !=  null){
            obid.add(fnew.Id+'  '+fnew.Country__c);
            }
                }
        for(id qa : obid){
            system.debug(qa);
        }
      Database.SaveResult[] res =Database.insert(fc,false);
        
        for(Database.SaveResult sr : res){
            if( sr.isSuccess()){
                system.debug('Record created successfully with id = '+sr.id);
            }
            else{
                for(Database.Error er :  sr.getErrors()){
							                 
                    system.debug('Error Message is = '+er.getMessage()+'And Error code is ='+er.getStatusCode());
                     System.debug('fields that affected this error: ' + er.getFields());
                }
                
            } 
        }
    }
}
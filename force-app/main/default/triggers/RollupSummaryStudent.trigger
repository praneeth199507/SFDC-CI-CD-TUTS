trigger RollupSummaryStudent on Student__c (after Insert,after update,after delete,after undelete) {
    Set<id> studentids = new Set<id>();
    List<Teacher__c> teacher = new List<Teacher__c>();
    
    if(Trigger.isInsert){
         for(Student__c stud : trigger.new){
        studentids.add(stud.Referred_Teacher__c);
              }
    }
    
     
    if(Trigger.isUpdate){
         for(Student__c stud : trigger.new){
             studentids.add(stud.Referred_Teacher__c);
           }
        for(Student__c stud : trigger.old){
             studentids.add(stud.Referred_Teacher__c);
           }
       }
	if(Trigger.isDelete) {
            for(Student__c stud : trigger.old){
        studentids.add(stud.Referred_Teacher__c);
              }
        }
    
    	else if(trigger.isUnDelete){
      for(Student__c stud : trigger.new){
     studentids.add(stud.Referred_Teacher__c);
      }
}
    
   
   List<AggregateResult> st = [select count_distinct(id),Referred_Teacher__c  from Student__c where Referred_Teacher__c  in :studentids group by Referred_Teacher__c];
    System.debug('Data in List is  :'+st);
    for(AggregateResult ar : st){
        Id teach = (ID)ar.get('Referred_Teacher__c');
        system.debug('ID in step2 is : ' + teach);
		Teacher__c t = new Teacher__C(Id=teach);
        t.No_of_Child_linked__c = (INTEGER)ar.get('expr0');
        teacher.add(t);
    }
    update teacher;
    }
trigger Undelete_Teacher on Teacher__c (After Undelete) {

  List<Student__C> stu =  [select id,Name,Referred_Teacher__c From Student__C where Referred_Teacher__c in : trigger.newMap.keySet() all rows];
    
   Undelete stu;
}
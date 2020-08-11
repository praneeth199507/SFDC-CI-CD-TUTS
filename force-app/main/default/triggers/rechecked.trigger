trigger rechecked on Student__c (before insert) {
    for(Student__c stud : trigger.new){
        String s1 = stud.name;
        if(s1.contains('Pra')){
            stud.Referred_Teacher__c ='a032w000000xrtrAAA';
        }
    }
   
}
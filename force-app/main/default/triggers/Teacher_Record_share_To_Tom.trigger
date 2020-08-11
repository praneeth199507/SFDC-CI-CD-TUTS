trigger Teacher_Record_share_To_Tom on Teacher__c (after update) {
    user u = [select id from user where alias ='tlath'];
    for(Teacher__c t : trigger.old) {
       
        Teacher__share s = new Teacher__share();
        s.ParentId = t.Id;
        s.UserOrGroupId = u.Id ;
        s.AccessLevel = 'Read';
        s.RowCause = 'Manual';
            Insert s;
        
    }
}
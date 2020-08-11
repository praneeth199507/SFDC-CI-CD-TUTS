global class BatchApex_Example1 implements Database.Batchable<sobject>, Database.stateful{
        global integer aval = 0;
        global static integer bval = 0;
    global Database.QueryLocator start(Database.BatchableContext bc){
        String Query = 'select id,name from Account';
        return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext bc,List<Account> acc){
        for(Account a : acc){           
            a.industry='Energy';
            aval = aval+1;
            bval = bval+1;
        }
        update acc;
    }
    global Void finish(Database.BatchableContext bc){
        AsyncApexjob job = [select id,status from AsyncApexjob where id = :bc.getJobId()];
        system.debug('Parent Job Status = '+job.status);
        system.debug('A value ='+aval);
        system.debug('B value ='+bval);        
    }
}
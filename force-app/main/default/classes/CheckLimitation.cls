global class CheckLimitation implements Database.Batchable<sObject>, Database.Stateful {
   global Integer conrecordsProcessed = 0;
    global Integer accrecordsProcessed = 0;
    global Database.QueryLocator start (Database.BatchableContext bc){
       return Database.getQueryLocator(
        'SELECT ID, BillingStreet, BillingCity, BillingState, ' +
            'BillingPostalCode, (SELECT ID, MailingStreet, MailingCity, ' +
            'MailingState, MailingPostalCode FROM Contacts) FROM Account ' + 
            'Where BillingCountry = \'USA\'');
    }
    global void execute (Database.BatchableContext bc,List<Account> scope){
         List<Contact> contacts = new List<Contact>();
        for (Account account : scope) {
            for (Contact contact : account.contacts) {
                contact.MailingStreet = account.BillingStreet;
                contact.MailingCity = account.BillingCity;
                contact.MailingState = account.BillingState;
                contact.MailingPostalCode = account.BillingPostalCode;
                // add contact to list to be updated
                contacts.add(contact);
                // increment the instance member counter
                conrecordsProcessed = conrecordsProcessed + 1;
                system.debug('Contact Record : ' + conrecordsProcessed);
            }
            accrecordsProcessed = accrecordsProcessed + 1;
                system.debug('Account Record : ' + accrecordsProcessed);
        }
        update contacts;
        
    }
    global void finish (Database.BatchableContext bc){
            AsyncApexJob job = [SELECT Id, Status, NumberOfErrors,JobItemsProcessed,TotalJobItems,CreatedBy.Email
            FROM AsyncApexJob
            WHERE Id = :bc.getJobId()];
    }
}
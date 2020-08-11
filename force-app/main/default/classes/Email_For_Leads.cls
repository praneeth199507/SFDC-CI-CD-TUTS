public class Email_For_Leads {
    public static void autoEmail(List<Lead> leadlist){
        List<String> emailid = new List<String>();
        List<String> ccid = new List<String>{'praneethkrishna95@gmail.com'};
        for(Lead ld : leadlist){
            emailid.add(ld.Email);
        }
        messaging.SingleEmailMessage em = new messaging.SingleEmailMessage();
        em.setToAddresses(emailid);
        em.setCcAddresses(ccid);
        em.setSubject('Confirmation Alert !!');
        em.setPlainTextBody('We have recieved your enquiry and will respond within 48 hrs.Thanks for regestering your request with us.Have a good day');
        em.setSenderDisplayName('Praneeth Inc');
        messaging.Email[] mail = new  messaging.Email[]{em};
        messaging.sendEmail(mail);
    }
}
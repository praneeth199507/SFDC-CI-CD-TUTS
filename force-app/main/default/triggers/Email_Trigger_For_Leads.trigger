trigger Email_Trigger_For_Leads on Lead (After insert) {
		Email_For_Leads.autoEmail(Trigger.new);
}
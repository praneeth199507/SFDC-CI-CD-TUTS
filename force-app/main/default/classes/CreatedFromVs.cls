public with sharing class CreatedFromVs {
    public CreatedFromVs() {
       Account acc = [select id,Name from Account];
    }
}

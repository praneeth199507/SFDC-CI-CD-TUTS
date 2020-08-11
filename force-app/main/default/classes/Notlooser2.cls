public class Notlooser2 {
  @AuraEnabled
    public static List<opportunity> myData( String sn){
        List<opportunity> opt = [select Name,stageName from opportunity where stageName=:sn limit 5];
        return opt;
    } 
}
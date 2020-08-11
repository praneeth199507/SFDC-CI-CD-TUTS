public class FirstAccountExtension {
    public List<account> ac{set;get;}
       public FirstAccountExtension(){
           ac = new List<account>();
           ac =[select id,name,type,rating from account limit 10];
       }
}
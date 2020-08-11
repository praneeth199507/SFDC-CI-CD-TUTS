public class JsonParser {
    public String jsonstring {set;get;}
    
    public JsonParser(){
        jsonstring = '{"Name":"Praneeth","Age":"25","Account":{"Name":"Wipro","Industry":"Energy"}}';
        Map<String,Object> m1 = (Map<String,Object>)json.deserializeUntyped(jsonstring);
         system.debug(m1);   
    }
}
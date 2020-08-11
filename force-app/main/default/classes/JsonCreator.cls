public class JsonCreator {
    Public String jsonString {set;get;}
    public jsonCreator(){
    system.JSONGenerator jg = json.createGenerator(true);
    jg.writeStartObject();
        jg.writeFieldName('Name');
        jg.writeString('Praneeth');
        jg.writeNumberField('Age',25);
        Blob b = Blob.valueOf('Krishna');
        jg.writeBlobField('Password', b);
        
    jg.writeEndObject();
    jsonString = jg.getAsString();
        system.debug(jsonString);
    }
    
}
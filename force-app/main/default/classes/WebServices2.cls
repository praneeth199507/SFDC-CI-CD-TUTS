public class WebServices2 {

    public static void makeGetCallout(){
    Http p = new Http();
    HttpRequest request = new HttpRequest();
    request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
    request.setMethod('GET');
    HttpResponse resp = p.send(request);
        system.debug('Response : '+resp.getStatusCode());
        if (resp.getStatusCode() == 200) {
    String body = resp.getBody();
    Map<String,Object> m1= (Map<String,Object>) json.deserializeUntyped(body);
    for(String s : m1.keySet()){
        system.debug(s+' : '+m1.get(s));
    
        }
    }
}
}
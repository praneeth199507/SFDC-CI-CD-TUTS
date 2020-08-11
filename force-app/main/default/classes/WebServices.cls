public class WebServices {
    public String result;
     public List<String> header;
     public Map<String,Object> resMap = new Map<String,Object>();
     public Map<String,Object> xmlMap = new Map<String,Object>();
    
    public void trace(){
        Http p = new Http();
        HttpRequest hr = new HttpRequest();
        hr.setEndpoint('');
        hr.setMethod('GET');
        HttpResponse resp = p.send(hr);
        header = resp.getHeaderKeys();
        for (String key : header){
            resMap.put(key,resp.getHeader(key));
        }
        result = resp.getBody();
        Dom.Document doc = new Dom.Document();
        doc.load(result);
        Dom.XmlNode root =  doc.getRootElement();
        List<Dom.XmlNode> childs =  root.getChildElements();
        List<Dom.XmlNode> subchilds = childs[0].getChildElements();
        for(Dom.XmlNode xn : subchilds){
            xmlmap.put(xn.getName(),xn.getText());
        }
    }   
}
public class XmlExample {
    public String xmlstring {set;get;}
    public String result {set;get;}
    public XmlExample() {
        Dom.Document d = new Dom.Document();
        Dom.XmlNode student = d.createRootElement('Student',null,null);
        Dom.XmlNode name = student.addChildElement('Name',null,null);
        name.addTextNode('Praneeth');
        Dom.XmlNode age = student.addChildElement('Age',null,null);
        age.addTextNode('25');
        Dom.Xmlnode salary = student.addChildElement('Same',null,null);
        salary.addTextNode('41000');
        xmlstring = d.toXmlString();
        system.debug(xmlstring);
    }
    
    public void getXmlValueintoString(){
        Dom.Document doc = new Dom.Document();
        doc.load(xmlstring);
        Dom.XmlNode root = doc.getRootElement();
        result = result + root.getName();
        List<Dom.XmlNode> l1 = root.getChildElements();
        if(l1.size() > 0 ){
           for(Dom.XmlNode xn :l1){
            result=result +'\n'+ xn.getName()+' : '+xn.getText();
        } 
        }
        
        System.debug(result);
    }
}
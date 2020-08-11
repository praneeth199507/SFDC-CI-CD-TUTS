public class CaluculatorCTRL {

    public Decimal firstnum {get;set;}
    public Decimal secondnum {get;set;}
    public Decimal resultnum {get;set;}
    
    public void add(){
        resultnum = firstnum+secondnum;      
    }
     public void mul(){
        resultnum = firstnum*secondnum;      
    }
     public void sub(){
        resultnum = firstnum-secondnum;      
     }
}
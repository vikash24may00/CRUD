public class Rectangle {

    public void area()
    {
        Decimal length=9.8,breadth=8.7;
        
        Decimal a= length*breadth;
        
        System.debug('Area is : '+ a);
    }
    
     public void perimeter()
    {
        Decimal length=9.8,breadth=8.7;
        
        Decimal p= 2*(length+breadth);
        
        System.debug('Perimeter is : '+ p);
    }
}
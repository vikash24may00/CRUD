public class RectangleWithConstructor {
    
    Decimal length,breadth;

    // constructor
     public RectangleWithConstructor(decimal l,decimal b)
    {
       length = l;
       breadth = b;
        
    }
    
     public void area()
    {
        Decimal a= length*breadth;        
        System.debug('Area is : '+ a);
    }
    
     public void perimeter()
    {
        Decimal p= 2*(length+breadth);
        System.debug('Perimeter is : '+ p);
    }

}
public class RectangleStaticDemo 
{

     public static void area()
    {
        Decimal length=9.8,breadth=8.1;
        
        Decimal a= length*breadth;
        
        System.debug('Area is : '+ a);
    }
    
     public static void perimeter()
    {
        Decimal length=9.8,breadth=8.4;
        
        Decimal p= 2*(length+breadth);
        
        System.debug('Perimeter is : '+ p);
    }
    
}
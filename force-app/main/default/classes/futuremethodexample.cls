public class futuremethodexample 
{
    public futuremethodexample ()
    {
        list<string> namelist = new list<string> ();
        namelist.add('akash');
        namelist.add('ravi');
        
        system.debug('futuremethodexample constructor method');   
        method1();
        method2();
        method3(namelist);
        // method4();
        method5();

    }
    
    public void method1()
    {
        system.debug('i am in method1 method'); 
        
    }
    
    public static void method2()
    {
        system.debug('i am in method2 method');   
        method4 (5,'vikash');
        
    }
    
    @future (callout=true)
    public static void method3(list<string> slist)
    {
        system.debug('i am in static method3 method'); 
        system.debug('namelist = ' + slist);
        
    }
    
    @future
    public static void method4(integer i,string s)
    {
        system.debug('i am in static method4 method'); 
        system.debug('i == ' + i);
        system.debug('s == ' + s);
        
    }
    
    public static void method5()
    {
        system.debug('i am in static method5 method');   
        
    }
}
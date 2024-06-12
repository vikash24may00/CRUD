@istest
public class testclass 
{
    @istest
    static void testwarmtemp()
    {
        decimal celsius = apextestclass.farenhitetocelsius(70);
        system.assertequals(21.11,celsius);
    }
    
}
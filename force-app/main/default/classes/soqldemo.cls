public class soqldemo 
{
        
    
    public static void querydemo()
    {
        list<account> acclist = new list<account>();
        acclist = [select id,name,industry from account limit 5];
        for(account acc:acclist)
        {
            system.debug(acc);
        }
    }
    
}
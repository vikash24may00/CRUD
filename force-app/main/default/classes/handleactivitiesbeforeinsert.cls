public class handleactivitiesbeforeinsert 
{
    public static void handleactivitiesbeforeinsert1(list<contact> newrecords)
    {
        for(contact c:newrecords)
        {
            if(c.AccountId == null)
            {
                c.adderror('cant create without account name');
            }
        }
    }
    
}
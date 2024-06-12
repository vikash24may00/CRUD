public class usecasehandler5 
{
    public static void handleusecasehandler5activity(list<opportunity> newrecords)
    {
        for(opportunity opp:newrecords)
        {
            if(opp.Amount != null && opp.Amount > 100000)
            {
                opp.Description = 'hot opportunity';
            }
        }
    }
}
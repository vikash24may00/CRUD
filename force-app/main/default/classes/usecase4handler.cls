public class usecase4handler 
{
    public static void handleusecase4activity(list<account> newrecords)
    {
        for(account acc:newrecords)
        {
            if(acc.industry != null && acc.industry == 'insurance')
            {
                acc.rating = 'hot';
            }
        }
    }
}
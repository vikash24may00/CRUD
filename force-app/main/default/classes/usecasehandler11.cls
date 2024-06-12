public class usecasehandler11 
{
    public static void handleusecasehandler11(list<opportunity> newrecords)
    {
        list<account> acclist = new list<account>();
        for(opportunity opp : newrecords)
        {
            if(opp.Amount != null && opp.AccountId != null)
            {
                account acc = new account();
                acc.recent_opportunity_amount__c = opp.Amount;
                acc.Id = opp.AccountId;
                
                acclist.add(acc); 
            }
            
        }
        
        if(acclist.size() > 0)
        {
            update acclist;
        }
    }
}
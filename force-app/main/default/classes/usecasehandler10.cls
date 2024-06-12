public class usecasehandler10 
{
    public static void handleusecasehandler10(list<case> newrecords)
    {
        list<account> acclist = new list<account>();
        for(case c : newrecords)
        {
            if(c.AccountId != null)
            {
                account acc = new account();
                acc.latest_case_number__c = c.CaseNumber;
                acc.Id = c.AccountId;
                
                acclist.add(acc);
            }
        }
        
        if(acclist.size() > 0)
        {
            update acclist;
        }
    }
}
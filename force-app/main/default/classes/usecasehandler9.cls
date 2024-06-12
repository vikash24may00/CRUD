public class usecasehandler9 
{
    public static void handleusecasehandler9(list<account> newrecords)
    {
        list<opportunity> opplist = new list<opportunity>();
        for(account acc:newrecords)
        {
            opportunity opp = new opportunity();
            opp.Name = acc.name;
            opp.CloseDate = system.today();
            opp.StageName = 'closed won';
            opp.AccountId = acc.Id;
            opplist.add(opp);
        }
        
        if(opplist.size() > 0)
        {
            insert opplist;
        }
    }
}
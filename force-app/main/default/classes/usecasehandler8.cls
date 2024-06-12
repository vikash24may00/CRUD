public class usecasehandler8 
{
    public static void handleusecasehandler8(list<account> newrecords)
    {
        list<contact> conlist = new list<contact>();
        for(account acc:newrecords)
        {
            contact con = new contact();
            con.LastName = acc.Name;
            con.AccountId = acc.Id;
            conlist.add(con);
        }
        if(conlist.size() > 0)
        {
            insert conlist;
        }
    }
}
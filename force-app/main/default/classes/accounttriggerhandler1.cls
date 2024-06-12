public class accounttriggerhandler1 
{
    public static void handleafterinsertactivities(list<account> newrecords)
    {
        list<contact> conlist = new list<contact>();
        for(account acc:newrecords)
        {
            if(acc.create_n_contact__c != null)
            {
                for(integer i=0;i<acc.create_n_contact__c;i++)
                {
                    contact con = new contact();
                    con.LastName = acc.Name + i;
                    con.AccountId = acc.Id;
                    conlist.add(con);
                }
            }
        }
        
        if(conlist.size() > 0)
        {
            insert conlist;
        }
    }
    
    
    
/*    public static void handlebeforeactivities(list<account> newrecords , map<id,account> oldrecords)
    {
        for(account acc:newrecords)
        {
            if(acc.Industry == 'agriculture' && acc.Type=='Customer - Direct')
            {
                if(oldrecords.get(acc.Id).Ownership != acc.Ownership && acc.Ownership=='private')
                {
                    acc.adderror('Ownership cannot be modified');
                }
            }
        }
    } */
}
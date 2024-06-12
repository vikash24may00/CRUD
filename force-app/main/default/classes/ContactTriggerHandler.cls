public class ContactTriggerHandler 
{
    
    public static void totalcontactcount(list<contact> conlist)
    {
        list<account> acclist = new list<account> ();
        set<id> accids = new set<id> ();
        
        for(contact con : conlist)
        {
            if(con.accountid != null)
            {
                accids.add(con.accountid);
            }
        }
        
        for(account acc : [select id,(select id from contacts) from account where id in : accids])
        {
            acc.Total_Contacts__c = acc.contacts.size();
            acclist.add(acc);
        }
        
        if(acclist.size() > 0)
        {
            update acclist;
        }
        
    }
    
}
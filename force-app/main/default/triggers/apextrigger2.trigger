trigger apextrigger2 on Contact (after insert) 
{
    if((trigger.isafter) && (trigger.isinsert))
    {
        list<account> acclist = new list<account> ();
        for(contact con : trigger.new)
        {
            if(con.AccountId == null)
            {
                account acc = new account();
                acc.Name = con.LastName;
                acc.Phone = con.Phone;
                acc.Active__c = 'yes';
                acclist.add(acc);
            }
        }
        if(acclist.size() > 0)
        {
            insert acclist; 
        }
    }
}
trigger ContactCount on Contact (after insert,after update,after delete,after undelete)
{
    set<Id> accIds = new set<Id>();
    
    if(trigger.isafter && (trigger.isinsert || trigger.isundelete))
    {
        if(trigger.new.size() > 0)
        {
            for(contact con : trigger.new)
            {
                if(con.AccountId != null)
                {
                    accIds.add(con.AccountId);
                }
            }
        }
    }
    
    if(trigger.isafter && trigger.isupdate)
    {
        if(trigger.new.size() > 0)
        {
            for(contact con : trigger.new)
            {
                if(con.AccountId != trigger.oldMap.get(con.Id).AccountId)
                {
                    if(trigger.oldMap.get(con.Id).AccountId != null)
                    {
                        accIds.add(trigger.oldMap.get(con.Id).AccountId);
                    }
                    if(con.AccountId != null)
                    {
                        accIds.add(con.AccountId);
                    }
                }
            }
        }
    }
    
    if(trigger.isafter && trigger.isdelete)
    {
        if(trigger.old.size() > 0)
        {
            for(contact con : trigger.old)
            {
                if(con.AccountId != null)
                {
                    accIds.add(con.AccountId);
                }
            }
        }
    }
    
    
    if(accIds.size() > 0)
    {
        list<account> acclist = [select id,Total_Contacts__c,(select id from contacts) from account where Id IN : accIds];
        list<account> accountstobeupdated = new list<account>();
        
        if(acclist.size() > 0)
        {
            for(account acc : acclist)
            {
                acc.Total_Contacts__c = acc.contacts.size();
                accountstobeupdated.add(acc);
            }
        }
        
        if(accountstobeupdated.size() > 0)
        {
            update accountstobeupdated;
        }
    }
}
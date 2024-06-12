trigger conTrigger on Contact (after update) 
{
    set<Id> accIds = new set<Id>();
    
    if(trigger.isafter && trigger.isupdate)
    {
        if(trigger.new.size() > 0)
        {
            for(Contact con : trigger.new)
            {
                if(con.AccountId != null && trigger.oldmap.get(con.Id).Description != con.Description)
                {
                    accIds.add(con.AccountId);
                }     
            }
        }
    }
    
    map<Id,Account> accmap = new map<Id,Account> ([select Id,Description from Account where Id IN : accIds]);
    list<Account> listTobeUpdated = new list<Account> ();
    
    if(trigger.new.size() > 0)
    {
        for(Contact con : trigger.new)
        {
            Account acc = accmap.get(con.AccountId);
            acc.Description = con.Description;
            listTobeUpdated.add(acc);
        }
    }    
    
    if(listTobeUpdated.size() > 0)
    {
        update listTobeUpdated;
    }
}
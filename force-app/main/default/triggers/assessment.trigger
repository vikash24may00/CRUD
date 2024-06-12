trigger assessment on Account (before update) 
{
set<id> accid = new set<id>();
    
    for(account acc:trigger.new)
    {
        if(acc.assessmentstatus__c != trigger.oldmap.get(acc.id).assessmentstatus__c)
        {
            accid.add(acc.id);
        }
    }
    
    
    list<account> acclist = [select id,(select id from contacts) from account where id =: accid];
    
    if(acclist.size() > 0)
    {
        for(account a:acclist)
        {
            if(a.contacts.size() > 0)
            {
                trigger.new[0].adderror('error related contact is more than zero in this account');
            }
        }
    }
}
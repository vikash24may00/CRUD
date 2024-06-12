trigger apextrigger on Account (before insert) {
    if(trigger.isinsert)
    {
        if(trigger.isbefore)
        {
            for(account acc: trigger.new)
            {
                acc.description = 'account is created';
            }
        }
        
    }
}
trigger testusecase12 on Account (before update) 
{
    if(trigger.isbefore && trigger.isupdate)
    {
        for(account acc:trigger.new)
        {
            if(acc.Phone != trigger.oldmap.get(acc.id).Phone)
            {
                acc.description = 'old phone value : '+trigger.oldmap.get(acc.id).Phone + ' ' + 'new phone value : '+acc.Phone;               
            }   
        }
    }
}
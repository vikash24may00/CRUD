trigger apextrigger1 on Account (before insert,before update) 
{
    if( (trigger.isbefore) && ((trigger.isinsert) || (trigger.isupdate)) )
    {
        for(account acc:trigger.new)
        {
            if(acc.Industry == 'healthcare' || acc.industry=='banking')
            {
                acc.rating='hot';
            }            
        }
    }
}
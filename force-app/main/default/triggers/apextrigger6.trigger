trigger apextrigger6 on Account (before delete) 
{
    
    if(trigger.isbefore && trigger.isdelete)
    {
        for(Account acc:trigger.old)
        {
            if(acc.Active__c == 'yes')
            {
                acc.adderror('cant delete active account');
            }
        }
    }  
}
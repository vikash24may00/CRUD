trigger apextrigger4 on Account (before insert,before update) 
{
    if((trigger.isbefore) && (trigger.isinsert || trigger.isupdate))
    {
        for(account acc:trigger.new)
        {
            if(acc.Industry == 'banking')
            {
                acc.AnnualRevenue = 50000;
            }
            else if(acc.Industry == 'chemicals')
            {
                acc.AnnualRevenue = 60000;
            }
           else
            {
                acc.AnnualRevenue = 70000;
            }
        }
        
    }
    
}
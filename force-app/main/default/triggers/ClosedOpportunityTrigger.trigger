trigger ClosedOpportunityTrigger on Opportunity (after insert,after update) 
{
    List<task> tasklist = new List<task> ();
    
    for(opportunity opp : trigger.new)
    {
        if(opp.StageName == 'closed won')
        {
            task t = new task();
            t.Subject = 'Follow Up Test Task';
            t.WhatId = opp.Id;
            tasklist.add(t);
            
        }
    }
    
    
    
    if(tasklist.size() > 0)
    {
        insert tasklist;
    } 
    
}
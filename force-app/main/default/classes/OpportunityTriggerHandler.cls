public class OpportunityTriggerHandler 
{
    
    public static void handleactivitiesafterinsert()
    {
        
    }
    
    public static void handleactivitiesafterupdate(list<opportunity> newrecords)        
    {
        list<task> tasklisttoinsert = new list<task> (); 
        for(opportunity opp : newrecords)
        {
            if(opp.stagename == 'closed won')
            {
                task taskrecord = new task();
                taskrecord.priority = 'high';
                taskrecord.OwnerId = opp.OwnerId;
                taskrecord.Description = 'please split the revenue amongst the team members';
                taskrecord.status = 'not started';
                taskrecord.subject = 'split revenue';
                taskrecord.WhatId = opp.Id;
                tasklisttoinsert.add(taskrecord);                
            }
        }
        
        if(tasklisttoinsert.size() > 0)
        {
            insert tasklisttoinsert;
        }
        
    }
    
}
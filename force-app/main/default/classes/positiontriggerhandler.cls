public class positiontriggerhandler 
{
    
    public static void createtask(list<position__c> poslist)
    {
        list<task> tasklist = new list<task> ();
        
        for(position__c pos : poslist)
        {
            task t = new task();
            t.Subject = 'follow up';
            t.ActivityDate = system.today() + 7;
            t.WhatId = pos.Id;
            t.OwnerId =  UserInfo.getUserId();
            t.Status = 'not started';
            
            tasklist.add(t);
        }
        
        if(tasklist.size() > 0)
        {
            insert tasklist;
        }
    }
    
    public static void populatedata(list<position__c> poslist)
    {
        for(position__c pos : poslist)
        {
            if(pos.status__c == 'new position')
            {
                if(pos.open_date__c == null)
                {
                    pos.Open_Date__c = system.today();
                }
                if(pos.Min_Pay__c == null)
                {
                    pos.Min_Pay__c = 10000;
                }
                if(pos.Max_Pay__c == null)
                {
                    pos.Max_Pay__c = 15000;
                }
            }
        }
    }
    
}
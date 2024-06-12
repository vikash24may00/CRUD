trigger TaskTrigger on Task (before insert) 
{
    
    if(trigger.isInsert && trigger.isBefore)
    {
        for(Task taskrecord: Trigger.New)
        {
            system.debug('found task recorded');
            taskrecord.priority = 'High';
        }
    }
    
}
trigger ContactTrigger on Contact (after insert,after delete,after undelete) 
{
    
    if(trigger.isInsert)
    {
        if(trigger.isAfter)
        {
            ContactTriggerHandler.totalcontactcount(trigger.new);   
        }
    }
    
    if(trigger.isdelete)
    {
        if(trigger.isAfter)
        {
            ContactTriggerHandler.totalcontactcount(trigger.old);   
            
        }
    }
    
    if(trigger.isUndelete)
    {
        if(trigger.isAfter)
        {
            ContactTriggerHandler.totalcontactcount(trigger.new);   
            
        }
    }
    
}
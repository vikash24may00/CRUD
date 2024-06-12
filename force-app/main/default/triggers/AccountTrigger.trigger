trigger AccountTrigger on Account (before insert,after insert,before update,after update,before delete) 
{
    
    /*  if(trigger.isInsert)
{
if(trigger.isBefore)
{
AccountTriggerHandler.updatedesc(trigger.new);
AccountTriggerHandler.populaterating(trigger.new);          
}
} */
    
  /*  if(trigger.isInsert && trigger.isBefore)
    {
        AccountTriggerHandler.updatedesc(trigger.new);
        AccountTriggerHandler.populaterating(trigger.new,null);          
        
    }
    
    else if (trigger.isAfter)
    {
        AccountTriggerHandler.createopportunity(trigger.new);
    }
    
    if(trigger.isUpdate)
    {
        if(trigger.isBefore)
        {
            AccountTriggerHandler.updatephone(trigger.new,trigger.oldmap);
            AccountTriggerHandler.populaterating(trigger.new,trigger.oldmap);          
            
        }
        else if(trigger.isAfter)
        {
            AccountTriggerHandler.updaterelatedcontact(trigger.new,trigger.oldmap); 
            if(!preventRecursion.firstcall)
            {
                preventRecursion.firstcall = true;
                AccountTriggerHandler.updateaccount(trigger.new,trigger.oldmap);
            }
        }
    }
    
    if(trigger.isDelete)
    {
        if(trigger.isBefore)
        {
            AccountTriggerHandler.preventdeletion(trigger.old);
        }
        else if(trigger.isAfter)
        {
            
        }
    } */
}
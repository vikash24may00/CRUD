trigger OpportunityTrigger on Opportunity (after update) 
{
    
    if(trigger.isAfter && trigger.isUpdate)
    {
        OpportunityTriggerHandler.handleactivitiesafterupdate(Trigger.new);
    }
    
}
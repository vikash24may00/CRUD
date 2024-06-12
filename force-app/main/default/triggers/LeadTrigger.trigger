trigger LeadTrigger on Lead (before Update) 
{
    
    if(trigger.isInsert && trigger.isAfter)
    {
        LeadTriggerHandler.handleactivitiesafterinsert(trigger.new);
    }
    
    
    if(trigger.isUpdate && trigger.isBefore)
    {
        for(Lead leadrecord: Trigger.New)
        {
            // system.debug('found lead recorded');
            leadrecord.status = 'Working Contacted';
            if(leadrecord.industry == 'healthcare')
            {
                leadrecord.LeadSource = 'purchased list';
                leadrecord.SICCode__c = '1100';
                leadrecord.Primary__c = 'yes';
            }
        }
    }
    
}
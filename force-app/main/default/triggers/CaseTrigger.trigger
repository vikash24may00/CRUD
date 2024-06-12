trigger CaseTrigger on Case (before insert) 
{
    
    if(trigger.isInsert && trigger.isBefore )
    {
        for(Case CaseRecord : Trigger.new)
        {
            if(CaseRecord.origin == 'phone')
            {
                CaseRecord.priority = 'high';
            }
            else
            {
                CaseRecord.priority = 'low';
            }
        }
    }
    
}
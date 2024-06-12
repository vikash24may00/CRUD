trigger usecase5 on Opportunity (before insert) 
{
    if(trigger.isbefore && trigger.isinsert)
    {
        usecasehandler5.handleusecasehandler5activity(trigger.new);
    }
}
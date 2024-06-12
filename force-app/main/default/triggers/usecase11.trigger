trigger usecase11 on Opportunity (after insert) 
{
    if(trigger.isafter && trigger.isinsert)
    {
        usecasehandler11.handleusecasehandler11(trigger.new);
    }
}
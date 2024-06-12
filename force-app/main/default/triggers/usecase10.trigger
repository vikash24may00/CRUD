trigger usecase10 on Case (after insert) 
{
    if(trigger.isafter && trigger.isinsert)
    {
        usecasehandler10.handleusecasehandler10(trigger.new);
    }
}
trigger usecase9 on Account (after insert) 
{
    if(trigger.isafter && trigger.isinsert)
    {
        usecasehandler9.handleusecasehandler9(trigger.new);
    }
}
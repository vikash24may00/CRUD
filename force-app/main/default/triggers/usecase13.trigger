trigger usecase13 on Account (after update) 
{
    if(trigger.isafter && trigger.isupdate)
    {
        usecasehandler13.handleusecasehandler13(trigger.new);
    }
}
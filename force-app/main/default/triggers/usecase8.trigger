trigger usecase8 on Account (after insert) 
{
if(trigger.isafter && trigger.isinsert)
{
    usecasehandler8.handleusecasehandler8(trigger.new);
}
}
trigger usecase6 on Account (before insert) 
{
if(trigger.isbefore && trigger.isinsert)
{
    usecasehandler6.handleusecasehandler6(trigger.new);
}
}
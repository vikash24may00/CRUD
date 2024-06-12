trigger usecase4 on Account (before insert) 
{
    if(trigger.isbefore && trigger.isinsert)
    {
        usecase4handler.handleusecase4activity(trigger.new);
    }
}
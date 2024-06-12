trigger usecase1 on Account (before update) 
{
    
    if(trigger.isafter && trigger.isinsert)
    {
        accounttriggerhandler1.handleafterinsertactivities(trigger.new);
    }
    
  /*  if(trigger.isbefore && trigger.isupdate)
    {
        accounttriggerhandler1.handlebeforeactivities(trigger.new,trigger.oldmap);
    } */
}
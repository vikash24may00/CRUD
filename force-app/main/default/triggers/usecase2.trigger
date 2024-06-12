trigger usecase2 on Lead (before delete) 
{
    if(trigger.isbefore && trigger.isdelete)
    {
        leadhandler.handlebeforedeletion(trigger.old);        
    }
}
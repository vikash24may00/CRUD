trigger usecase3 on Contact (before insert) 
{
if(trigger.isbefore && trigger.isinsert)
{
    contacthandler1.handlecontactbeforeinsert(trigger.new);
}
}
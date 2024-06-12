trigger usecase on Contact (before insert) 
{
    if(trigger.isbefore && trigger.isinsert)
    {
        handleactivitiesbeforeinsert.handleactivitiesbeforeinsert1(trigger.new);
    }
}
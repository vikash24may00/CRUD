trigger usecase7 on Position__c (before insert) 
{
    if(trigger.isbefore && trigger.isinsert)
    {
        usecasehandler7.handleusecasehandler7(trigger.new);
    }
}
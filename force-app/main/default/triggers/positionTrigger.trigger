trigger positionTrigger on Position__c (before insert,after insert) 
{
   if(trigger.isInsert)
   {
       if(trigger.isBefore)
       {
           positiontriggerhandler.populatedata(trigger.new);
       }
       else if(trigger.isAfter)
       {
           positiontriggerhandler.createtask(trigger.new);
       }
   }
    
}
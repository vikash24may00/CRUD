trigger leadtriggerudemy on Lead (before insert,before update,after update,after insert) 
{
    /* system.debug('trigger size ' + trigger.size);
system.debug('is executing ' + trigger.isexecuting);
system.debug('operation type ' + trigger.operationtype); */
    
    switch on trigger.operationtype
    {
        
        when before_insert
        {
            leadtriggerhandlerudemy.beforeinserthandler(trigger.new);
        }
        
        
        when after_insert
        {
            leadtriggerhandlerudemy.afterinserthandler(trigger.new);
        }
        
        
        when before_update
        {
            leadtriggerhandlerudemy.beforeupdatehandler(trigger.new,trigger.oldmap);
        }
               
    }
    
}
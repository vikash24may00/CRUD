public class queuableinterfaceexample implements queueable , database.allowscallouts
{
    
    public void execute(QueueableContext qx)
    {
        system.debug('i am method of queuableinterfaceexample class ');
        
        account acc = new account();
        acc.name = 'vikash teqfocus';
        acc.Active__c = 'yes';
        insert acc;
        
        system.debug('account inserted is == ' + acc.name);
        
        id jobid = system.enqueuejob(new queuableinterfaceexample1());
        
        system.debug('job id of queuableinterfaceexample1 is = '+jobid);
        
    }
    
}
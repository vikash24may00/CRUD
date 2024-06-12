public class leadtriggerhandlerudemy 
{
    public static boolean alreadyexecuted = false;
    public static void beforeinserthandler(list<lead> newrecords)
    {
        for(lead l : newrecords)
        {
            if( string.isblank(l.LeadSource))
            {
                l.LeadSource = 'other';            
            }
            
            if(string.isblank(l.Industry))
            {
                l.adderror('industry cant be blank');
            }
        }
    }
    
    
    public static void afterinserthandler(list<lead> newrecords)
    {
        list<task> leadtask = new list<task>();
        for(lead l : newrecords)
        {
            // create a task related to the lead
            task t = new task(subject='follow up on lead status',status='in progress',priority='normal',whoid = l.Id);
            leadtask.add(t);
            
            
            
        }
        insert leadtask;
        
        if(leadtriggerhandlerudemy.alreadyexecuted == false)
        {
           // leadtriggerhandlerudemy.alreadyexecuted == true;
            
            lead anotherlead = new lead(lastname='test lead single',status='open - not contacted',company='salesforce',industry='finance') ;
            insert anotherlead; 
        }
        
    }
    
    
    public static void beforeupdatehandler(list<lead> newrecords,map<id,lead> oldrecordsmap)
    {
        for(lead l : newrecords)
        {
            if(trigger.isbefore && string.isblank(l.LeadSource))
            {
                l.LeadSource = 'other';            
            }
            
            if((l.Status == 'closed-converted' || l.Status == 'closed - not converted') && oldrecordsmap.get(l.id).Status =='open - not contacted')
            {
                l.status.adderror('u cannot directly close an open lead record');
            }
            
        }   
    }
    
}
public class LeadTriggerHandler 
{
    
    public static void handleactivitiesafterinsert(list<lead> leadrecords)
    {
        list<task> tasklisttoinsert = new list<task> ();
        for(lead leadrec: leadrecords)
        {
            task taskrecord = new task();
            taskrecord.priority = 'high';
            taskrecord.OwnerId = leadrec.OwnerId;
            taskrecord.Description = 'follow up with the new lead';
            taskrecord.status = 'not started';
            taskrecord.subject = 'follow up';
            taskrecord.WhoId = leadrec.Id;
            tasklisttoinsert.add(taskrecord);      
        }
        
        if(tasklisttoinsert.size() > 0)
        {
            insert tasklisttoinsert;
        }
    }
    
}
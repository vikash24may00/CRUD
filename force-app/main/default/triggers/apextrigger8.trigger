trigger apextrigger8 on Account (before delete) 
{
    if(trigger.isbefore && trigger.isdelete)
    {
        list<contact> conlist = [select id,accountid from contact where accountid in:trigger.oldmap.keyset()];
        
        if(!conlist.isempty())
        {
            for(contact con : conlist)
            {
                con.accountid = null;
            }
        }
        update conlist;
    } 
}
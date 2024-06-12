trigger testusecase13 on Account (after update)
{
    if(trigger.isafter && trigger.isupdate)
    {
        map<id,account> accmap = new map<id,account>();
        list<contact> conlist = new list<contact>();
        
        for(account acc : trigger.new)
        {
            if(acc.phone != null && acc.phone != trigger.oldmap.get(acc.id).phone && trigger.oldmap != null)
            {
                accmap.put(acc.id,acc);
            }
        }
        
        for(contact con:[select id,homephone,accountid from contact where accountid in:accmap.keyset()])
        {
            if(accmap.containskey(con.accountid))
            {
                con.homephone=accmap.get(con.accountid).phone;
                conlist.add(con);
            }
        }
        
        if(conlist.size() > 0)
        {
            update conlist;
        }
        
    }
}
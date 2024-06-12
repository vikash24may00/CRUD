public class loopdemo 
{
    
    public static void showlist()
    {
        list<account> acclist = new list<account>();
        map<id,account> accmap = new map<id,account>();
        set<id> accids = new set<id>();
        
        acclist = [select id,name from account limit 5];
        
        if(acclist.size() > 0)
        {
            for(account acc:acclist)
            {
                system.debug(acc.id + '-' + acc.name);
                accids.add(acc.id);
                accmap.put(acc.id,acc);
            }
        }
        
        if(accids.size() > 0)
        {
            for(id accid:accids)
            {
                system.debug(accid);
            }
        }
        
        if(accmap.size() > 0)
        {
            for(id accid:accmap.keyset())
            {
                system.debug(accid);
            }
        }
        
        if(accmap.size() > 0)
        {
            for(account acc:accmap.values())
            {
                system.debug(acc);
            }
        }
    }    
    
}
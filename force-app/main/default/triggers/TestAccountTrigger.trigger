trigger TestAccountTrigger on Account (before insert,after insert,after update) 
{
    list <account> acclist = new list<account> ();
    map<id,account> accmap = new map<id,account> ();
    
    Date d = system.today()-10; 
    
    for(account acc : trigger.new)
    {
        accmap.put(acc.id,acc);
    }
    
    list<opportunity> opplist = new list<opportunity>();
    list<opportunity> giveopp = [select id,name,accountid,CloseDate,stagename,Created_Date__c from opportunity where accountid in:accmap.keyset()];
    
    for(opportunity fetchopp : giveopp)
    {
        if(fetchopp.Created_Date__c < d && fetchopp.stagename!= 'closed won')
        {
            fetchopp.stagename = 'closed lost';
            opplist.add(fetchopp);
        }
    }
    
   /* if(opplist.size() > 0)
    {
        update opplist;
    } */
    
    if(!opplist.isEmpty())
    {
        update opplist;
    }
}
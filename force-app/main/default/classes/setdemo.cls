public class setdemo 
{
    public static void sobjectdemowithset()
    {
        set<id> accids = new set<id>();
        list<Account> acclist = new list<Account>();
        
        acclist = [select Id from Account limit 5];
        
        for(Account acc : acclist)
        {
            accids.add(acc.id);
        }
        
        system.debug(accids);
    }
    
    
    public static void sobjectdemowithsetposition()
    {
        set<id> posids = new set<id>();
        list<Position__c> poslist = new list<Position__c>();
        
        poslist = [select Id from Position__c limit 5];
        
        for(Position__c pos : poslist)
        {
            posids.add(pos.id);
        }
        
        system.debug(posids);
    }
    
    public static void demo()
    {
        set<integer> intset = new set<integer>();
        intset.add(10);
        intset.add(20);
        intset.add(30);
        intset.add(10);
        
        list<integer> intlist = new list<integer>();
        intlist.add(90);
        intlist.add(100);
        
        intset.addall(intlist);
        
        system.debug(intset);
    }
}
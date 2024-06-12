public class AccountTriggerHandler 
{
   /* 
    public static void updateaccount(list<account> acclist , map<id,account> accoldmap)
    {
        list<account> acctobeupdated = new list<account>();
        from(account acc : acclist)
        {
            account a = new account();
            a.id = acc.id;
            a.Description = 'test recursion';
            acctobeupdated.add(a);
        }
        
        if(acctobeupdate > 0)
        {
            update acctobeupdated;
        }
    }
    
    public static void preventdeletion(list<account> acclist)
    {
        profile p = [select id from profile where name = 'system administrator'];
        
        for(account acc:acclist)
        {
            if(Userinfo.getprofileid() != p.id && acc.Active__c == 'yes')
            {
                acc.adderror(label.Prevent_Account_Deletion);
            }
        }
    }
    
    public static void updaterelatedcontact(list<account> acclist,map<id,account> accoldmap)
    {
        list<contact> contactlist = new list<contact> ();
        // map<id,account> = new map<id,contact> ();
        set<id> accids = new set<id> (); 
        
        for(account acc: acclist)
        {
            if(acc.phone != accoldmap.get(acc.id).phone)
            {
                accoldmap.put(acc.id,acc);
            }
        }
        
        /* for(contact con : [select id,homephone,accountid from contact where accountid in: ccmap.keyset()])
{
if(accmap.containkey(con.accountid))
{
con.homephone = accmap.get(con.accountid).phone;
conlist.add(con);
}
} */
        
     /*   for(account acc : [select id,phone,(select homephone from contacts) from account where id in : accids])
        {
            if(acc.contacts != null)
            {
                for(contact con : acc.contacts)
                {
                    con.HomePhone = acc.phone;
                    contactlist.add(con);
                }
            }
        }
        
        if(contactlist.size() > 0)
        {
            update contactlist;
        }
    }
    
    public static void updatephone(list<account> acclist,map<id,account> accoldmap)
    {
        for(account acc:acclist)
        {
            if(acc.phone != accoldmap.get(acc.id).phone)
            {
                acc.Description = 'phone is updated  || old value = ' + accoldmap.get(acc.id).phone + ' ' + 'new value = ' + acc.phone;
                
            }
        }
    }
    
    public static void createopportunity(list<account> acclist)
    {
        list<opportunity> opplist = new list<opportunity> ();
        
        for(account acc : acclist)
        {
            opportunity opp =new opportunity();
            opp.name = acc.Name;
            opp.CloseDate = system.today();
            opp.StageName = 'prospecting';
            opp.AccountId = acc.Id;
            
            opplist.add(opp);
        }
        
        if(opplist.size() > 0)
        {
            insert opplist;
        }
    }
    
    public static void updatedesc(list<account> acclist)
    {
        for(account acc : acclist)
        {
            acc.description = 'account is created';
        }
    }
    
    public static void populaterating(list<account> acclist,map<id,account> accoldmap)
    {
        for(account acc : acclist)
        {
            if((accoldmap == null && acc.industry != null && acc.industry == 'media') || (acc.Industry != accoldmap.get(acc.id).industry && acc.Industry=='media'))
            {
                acc.rating = 'hot';
            }
        }
    } */
    
}
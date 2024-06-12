public class DMLdemo 
{
    
    public static void undeletedemo()
    {
        list<account> acclist = new list<account>();
        
        acclist = [select id,name,rating from account where name like 'test demo hai %' all rows];
        
        if(acclist.size() > 0)
        {
            undelete acclist;
        }
        
    }
    
    public static void updatedemo()
    {
        list<account> acclist = new list<account>();
        
        acclist = [select id,name,rating from account where rating='hot'];
        
        if(acclist.size() > 0)
        {
            for(account acc:acclist)
            {
                acc.industry = 'energy';
                acc.Active__c = 'yes';
            }
        }
        
        for(integer i=1;i<=5;i++)
        {
            account acc = new account();
            acc.name = 'test demo hai ' + ' ' + i;
            acc.active__c = 'yes';
            acclist.add(acc);
        }
        
        if(acclist.size() > 0)
        {
            upsert acclist;
        }
    }
    
    
    public static void insertdemo()
    {
        list<account> acclist = new list<account>();
        // list<contact> conlist = new list<contact>();
        
        for(integer i=1;i<=10;i++)
        {
            account acc = new account();
            acc.name = 'DML demo Demo' + i ;
            acc.Active__c = 'yes';
            acclist.add(acc);  
        }
        
        insert acclist;
        
        /* account acc1 = new account();
acc1.name = 'DML demo 2';
acc1.Active__c = 'yes';
acclist.add(acc1);

insert acclist;


contact con = new contact();
con.FirstName = 'contact 1';
con.LastName = 'contact 1';
con.AccountId = acclist[0].Id;
conlist.add(con);



contact con1 = new contact();
con1.FirstName = 'contact 2';
con1.LastName = 'contact 2';
con1.AccountId = acclist[1].Id;
conlist.add(con1);


insert conlist; */
        
    }
    
}
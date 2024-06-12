@RestResource(urlMapping = '/accountmgmt/')
global class accountmgmt 
{ 
    @httpGet
    global static AccountWrapper gettopaccounts()
    {
        map<string,string> paramsMap  = RestContext.request.params;
        set<id> accountidset = new set<id> (); 
        string accIndustry = paramsMap.get('industry');
        list<account> acclist = [select id,industry,rating,annualrevenue from account where annualrevenue != null and industry =: accIndustry order by annualrevenue desc limit 10];
        
        for(account acc : acclist)
        {
            accountidset.add(acc.id);
        }
        
        list <contact> conlist = [select id,lastname,firstname,email from contact where accountid =: accountidset];
        list <case> caselist = [select id,priority,subject from case where accountid =:accountidset ];
        
        AccountWrapper accwrapper = new AccountWrapper();
        accwrapper.acclist = acclist;
        accwrapper.conlist = conlist;
        accwrapper.caselist = caselist;
        
        return accwrapper;
    }
    
    
    @httpPost
    /* global static string createAccount(string accName,string accRating,string accIndustry)
{
account acc = new account();
acc.Name = accName;
acc.Rating = accRating;
acc.Industry = accIndustry;

try
{
insert acc;
return 'Account Created Successfully';
}
catch(exception e)
{
return e.getMessage(); 
}

} */
    
    global static string createAccountAndContact(AccountInformation information)
    {
        account accrecord = information.accountRecord;
        contact conrecord = information.contactRecord;
        
        try
        {
            insert accrecord;
            conrecord.AccountId = accrecord.Id;
            insert conrecord;
            return 'account and contact created successfully';
        }
        
        catch(exception e)
        {
            return e.getMessage();
        }
    }
    
    global class AccountWrapper
    {
        global list<account> acclist;
        global list<contact> conlist;
        global list<case> caselist;
        
    }
    
    @httpDelete
    global static string deleteaccount()
    {
        map<string,string> paramsmap = RestContext.request.params;
        string accountid = paramsmap.get('accid');
        list<account> acclist = [select id from account where id =: accountid];
        
        if(acclist.size() > 0)
        {
            try
            {
                delete acclist;
                return 'record deleted successfully';
            }
            catch(exception e)
            {
                return e.getMessage();
            }
        }
        
        else
        {
            return 'record not found';
        }
    }
    
    global class Accountinformation
    {
        global account accountRecord {get;set;}
        global contact contactRecord {get;set;}
        
    }
}
public class AccounRecord {
    
    public static ID insertAccount(string name,string rating,string active)
    {
        Account acc1 = new Account();
        acc1.Name = name;
        acc1.Rating = rating;
        acc1.Active__c = active;
        
        insert acc1;
        
        return acc1.ID;
    }
    
    public static void insertContact()
    {
        Id acc1ID;
        acc1ID = insertAccount('redmi','hot','yes');
        Contact con = new Contact(FirstName = 'contact 101',LastName = 'con 201');
        con.accountID = acc1ID;
        insert con;
    }
    
    
    public static void insertAccountWithConAndOpp(string name,string rating,string active)
    {
        Account acc1 = new Account();
        acc1.Name = name;
        acc1.Rating = rating;
        acc1.Active__c = active;
        
        insert acc1;
        
        Contact con = new Contact(FirstName = 'contact 101',LastName = 'con 201');
        con.accountID = acc1.ID;
        insert con;        
        
        Opportunity opp = new Opportunity();
        opp.Name='Opp 101';
        opp.CloseDate = System.Today();
        opp.StageName = 'Proscpecting';
        opp.AccountID = acc1.ID;
        
        insert opp;
    }
}
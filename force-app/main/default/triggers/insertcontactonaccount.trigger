trigger insertcontactonaccount on account(after insert){
    
   List<Contact> conlist = new List<contact>();
    list<account> acclist = new list<account>();
    
    For(Account acc:trigger.New){
        contact con = New Contact();
        con.lastname = acc.name;
        con.accountid=acc.id;
        conlist.add(con);
    }
    insert conlist;
    
    for (contact con:conlist)
    {
        account acc = new account();
        acc.id = con.accountid;
        acc.client_contact__c = con.id;
        acclist.add(acc);
    }
    
    update acclist; 
}
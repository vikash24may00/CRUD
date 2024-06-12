public class accountcalculator 
{
    @future
    public static void countcontacts(list<id> accids)
    {
        list<account> acclist = [select id , (select id from contacts) from account where id in: accids ];
        
        for(account acc:acclist)
        {
            // acc.count_number_of_contacts__c = acc.contacts.size();
        }
    }
}
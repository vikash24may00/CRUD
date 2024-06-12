public class batchapexexample implements database.batchable<sobject>
{
    public database.querylocator start(database.batchablecontext bx)
    {
        system.debug('i am in start method');
        return Database.getquerylocator([select id,Department from contact]);
    }
    
    public void execute(database.batchablecontext bxc,list<contact> scope)
    {
        system.debug('current scope is == ' + scope.size());
        list<contact> updatecontactlist = new list<contact>();
        for(contact c: scope)
        {
            if(c.Department == 'salesforce')
            {
                system.debug('i am in if');
                c.department = 'AWS'; 
            }
            else
            {
                system.debug('i am in else');
            }
            updatecontactlist.add(c);
        }
        update updatecontactlist;
    }
    
    public void finish(database.batchablecontext bxc)
    {
        system.debug('iam in finish method');
        
        list<string> mailtolist = new list<string> ();
        mailtolist.add('vikashmundari568@gmail.com');
        
        list<string> ccmailtolist = new list<string> ();
        ccmailtolist.add('vikashmundari568@gmail.com');
        
        messaging.singleemailmessage myemail = new messaging.singleemailmessage();
        myemail.settoaddresses(mailtolist);
        myemail.setccaddresses(ccmailtolist);
        
        myemail.setsubject('batch processing email');
        myemail.setplaintextbody('your records has been updated');
        
        messaging.sendemail(new messaging.singleemailmessage[] {myemail});
    }
}
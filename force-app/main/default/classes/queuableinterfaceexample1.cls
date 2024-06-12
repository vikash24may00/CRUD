public class queuableinterfaceexample1  implements queueable
{
    
    public void execute(QueueableContext qx)
    {
        system.debug('i am method of queuableinterfaceexample class ');
        
        contact con = new contact();
        con.lastname = 'vikash teqfocus contact';
        insert con;
        
        system.debug('contact inserted is == ' + con.lastname);
    }
    
    
}
public class mixedDMLexceptionHandling 
{
    
    public static void dmlonSetupANDNonSetup()
    {
        account a = new account();
        a.name = 'teqfocus gyaan';
        insert a;
        
        createuserrecord();
    }
    
    @future
    public static void createuserrecord()
    {
        try
        {
            system.debug('record inserted');
            profile p =[select id from profile where name='standard user'];
            userrole r = [select id from userrole where name='civil'];
            
            user createuser = new user();
            createuser.Alias = 'u11';
            createuser.Email = 'test@gmail.com';
            createuser.EmailEncodingKey = 'UTF-8';
            createuser.LastName = 'myuser';
            createuser.LanguageLocaleKey = 'en_us';
            createuser.LocaleSidKey = 'en_us';
            createuser.ProfileId = p.id;
            createuser.UserRoleId = r.id;
            createuser.TimeZoneSidKey = 'america/los_angeles';
            createuser.Username = 'username@gamil.com';
            
            insert createuser;
            
            system.debug('record created for user');
            
        }
        
        catch(exception e)
        {
          //  system.debug('exception is == ' +e.getstacktracestring());
            system.debug('exception is == '+e.getmessage());
            
        }
    }
    
}
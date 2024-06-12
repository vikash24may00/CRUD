public class contacthandler1 
{
    public static void handlecontactbeforeinsert(list<contact> newrecords)
    {
        list<contact> existingcontact = [select id,lastname,phone,email from Contact limit 50000];
        for(contact con:newrecords)
        {
            for(contact existingcon:existingcontact)
            {
                if(con.lastname == existingcon.lastname && con.phone == existingcon.phone && con.email == existingcon.email)
                {
                    con.adderror('duplictae exists');
                }
            }
        }
    }
}
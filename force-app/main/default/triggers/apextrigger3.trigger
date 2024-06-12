trigger apextrigger3 on Contact (before insert,before update) 
{
    if((trigger.isbefore) && ( (trigger.isinsert || trigger.isupdate) ))
    {
        for(contact con:trigger.new)
        {
            if(con.email == null)
            {
                con.email.adderror('email is compulsory');
            }
            
            if(con.phone == null)
            {
                con.phone.adderror('phone is compulsory');
            }
        }
    }
}
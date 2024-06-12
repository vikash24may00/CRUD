trigger apextrigger5 on Contact (before insert,before update) 
{
    if((trigger.isbefore) && (trigger.isinsert || trigger.isupdate))
    {
        for(contact con:trigger.new)
        {
            if(con.AccountId == null)
            {
                con.adderror('cannot create contact without account');
            }
        } 
    }
    
}
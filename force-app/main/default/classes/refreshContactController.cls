public class refreshContactController 
{
    @Auraenabled(cacheable=true)
    public static List<contact> getContactList()
    {
        return [SELECT Id,FirstName,LastName,Email from Contact Limit 5];
    }
}
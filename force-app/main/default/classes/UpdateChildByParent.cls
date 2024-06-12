public class UpdateChildByParent {
    
    public static void Function(Map<Id, Account> newMap, Map<Id, Account> oldMap) 
    {
        // Create a list to hold the contacts that need to be updated
        List<Contact> contactsToUpdate = new List<Contact>();
        
        // Loop through each Account ID in the newMap
        for (Id accountId : newMap.keySet()) 
        {
            Account newAccount = newMap.get(accountId); // Get the updated Account
            Account oldAccount = oldMap.get(accountId); // Get the old Account before the update
            
            // Check if the phone number has changed
            if (newAccount.Phone != oldAccount.Phone) 
            {
                // If the phone number has changed, find related Contacts
                List<Contact> relatedContacts = [SELECT Id, AccountId, Phone FROM Contact WHERE AccountId = :accountId];
                
                // Update each Contact's phone number to match the new Account phone number
                for (Contact contact : relatedContacts) 
                {
                    contact.Phone = newAccount.Phone;
                    contactsToUpdate.add(contact); 
                }
            }
        }
        
        if (contactsToUpdate.size() > 0) 
        {
            update contactsToUpdate;
        }
    }
}
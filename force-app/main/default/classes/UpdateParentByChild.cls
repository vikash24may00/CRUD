public class UpdateParentByChild {

    public static void Function1 (List<Contact> newContacts, Map<Id, Contact> oldContactMap) {
        // Map to hold the accounts that need to be updated
        Map<Id, Account> accountsToUpdate = new Map<Id, Account>();

        // Loop through each contact in the new list
        for (Contact newContact : newContacts) {
            // Get the old version of the contact
            Contact oldContact = oldContactMap.get(newContact.Id);

            // Check if the AccountId is not null and if the description has changed
            if (newContact.AccountId != null && newContact.Description != oldContact.Description) {
                // Check if the account is already in the map
                if (accountsToUpdate.containsKey(newContact.AccountId)) {
                    // Update the description to the latest contact's description
                    accountsToUpdate.get(newContact.AccountId).Description = newContact.Description;
                } else {
                    // Create a new account record with the updated description
                    Account accountToUpdate = new Account(
                        Id = newContact.AccountId,
                        Description = newContact.Description
                    );
                    // Add the account to the map of accounts to update
                    accountsToUpdate.put(newContact.AccountId, accountToUpdate);
                }
            }
        }

        // If there are any accounts to update, perform the update
        if (!accountsToUpdate.isEmpty()) {
            update accountsToUpdate.values();
        }
    }
}
public with sharing class ContactController {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts() {
        return [SELECT Id, FirstName, LastName, Email, Phone FROM Contact LIMIT 10];
    }

    @AuraEnabled
    public static void createContact(Contact newContact) {
        insert newContact;
    }

    @AuraEnabled
    public static void updateContact(Contact updatedContact) {
        update updatedContact;
    }

    @AuraEnabled
    public static void deleteContact(Id contactId) {
        delete [SELECT Id FROM Contact WHERE Id = :contactId];
    }
}
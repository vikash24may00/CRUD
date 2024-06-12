/* public with sharing class CreateUpdateRecordsController {
    @AuraEnabled(cacheable=true)
    public static String saveRecords(String firstName, String lastName, String email, String phone, String status, String recordId) {
        try {
            if (String.isBlank(recordId)) {
                // Create new contact
                Contact con = new Contact(
                    FirstName = firstName,
                    LastName = lastName,
                    Email = email,
                    Phone = phone
                    // Status__c = status
                );
                insert con;
                return con.Id;
            } else {
                // Update existing contact
                Contact con = new Contact(
                    Id = recordId,
                    FirstName = firstName,
                    LastName = lastName,
                    Email = email,
                    Phone = phone
                    // Status__c = status
                );
                update con;
                return con.Id;
            }
        } catch (Exception e) {
            System.debug('Error saving record: ' + e.getMessage());
            throw new AuraHandledException('Error saving record: ' + e.getMessage());
        }
    }
} */

public with sharing class CreateUpdateRecordsController {
    @AuraEnabled
    public static String saveRecords(String firstName, String lastName, String email, String phone, String status, String recordId) {
        try {
            if (String.isBlank(recordId)) {
                // Create new contact
                Contact con = new Contact(
                    FirstName = firstName,
                    LastName = lastName,
                    Email = email,
                    Phone = phone
                   // Status__c = status
                );
                insert con;
                return con.Id;
            } else {
                // Update existing contact
                Contact con = new Contact(
                    Id = recordId,
                    FirstName = firstName,
                    LastName = lastName,
                    Email = email,
                    Phone = phone
                   // Status__c = status
                );
                update con;
                return con.Id;
            }
        } catch (Exception e) {
            System.debug('Error saving record: ' + e.getMessage());
            throw new AuraHandledException('Error saving record: ' + e.getMessage());
        }
    }
}
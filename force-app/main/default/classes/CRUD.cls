public with sharing class CRUD {
    @AuraEnabled(cacheable=true)
    public static String saveRecords(String accountName, String email, String phone, String recordId) {
        try {
            if (String.isBlank(recordId)) {
                // Create new Account
                Account acc = new Account(
                    Name = accountName,
                   // Email__c = email,
                    Phone = phone
                );
                insert acc;
                return acc.Id;
            } else {
                // Update existing Account
                Account acc = new Account(
                    Id = recordId,
                    Name = accountName,
                   // Email__c = email,
                    Phone = phone
                );
                update acc;
                return acc.Id;
            }
        } catch (Exception e) {
            System.debug('Error saving record: ' + e.getMessage());
            throw new AuraHandledException('Error saving record: ' + e.getMessage());
        }
    }
}
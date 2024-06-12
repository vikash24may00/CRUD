public with sharing class WireAsPropertyAccountController {
    // Apex method to search for accounts based on the search key
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts(String searchKey) {
        // If the search key is blank, return an empty list
        if (String.isBlank(searchKey)) {
            return new List<Account>();
        }
        // Construct the search pattern for the SOQL query
        String searchPattern = '%' + searchKey + '%';
        // Query accounts with names matching the search pattern
        return [SELECT Id, Name FROM Account WHERE Name LIKE :searchPattern];
    }
}
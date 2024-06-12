public with sharing class FoodController {
    
    @AuraEnabled(cacheable=true)
    public static List<FoodMenu__c> getFoodItems() {
        try {
            
            return [SELECT Id, Name, Description__c FROM FoodMenu__c];
        } catch (Exception e) {
            throw new AuraHandledException('exceptionText');
        }
    }
    
}
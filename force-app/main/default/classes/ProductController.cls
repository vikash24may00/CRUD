public with sharing class ProductController {
    @AuraEnabled(cacheable=true)
    public static List<Product__c> getProducts() {
        return [SELECT Id, Name, Price__c FROM Product__c];
    }

    @AuraEnabled(cacheable=true)
    public static Product__c getProductById(Id productId) {
        return [SELECT Id, Name, Price__c FROM Product__c WHERE Id = :productId LIMIT 1];
    }

    @AuraEnabled
    public static void placeOrder(List<Product__c> items) {
        Order__c newOrder = new Order__c();
        insert newOrder;

        List<OrderItem__c> orderItems = new List<OrderItem__c>();
        for (Product__c item : items) {
            OrderItem__c orderItem = new OrderItem__c(
                Orderc__c = newOrder.Id,
                Productc__c = item.Id,
                Price__c = item.Price__c
            );
            orderItems.add(orderItem);
        }
        insert orderItems;
    }
}
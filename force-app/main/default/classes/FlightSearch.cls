/**
 * @description       : 
 * @author            : VIKASH MUNDARI
 * @group             : 
 * @last modified on  : 06-10-2024
 * @last modified by  : VIKASH MUNDARI
**/
public with sharing class FlightSearch {
    
    @AuraEnabled(cacheable=true)
    public static List<Flight__c> searchFlights(String departure, String destination, Date startDate, Date endDate, Integer passengers) {
        List<Flight__c> flights = new List<Flight__c>();

        // Query flights based on provided criteria
        flights = [SELECT Id, Flight_Number__c, Departure_City__c, Destination_City__c, 
                           Departure_Date__c, Price__c, Available_Seats__c
                   FROM Flight__c 
                   WHERE Departure_City__c = :departure 
                   AND Destination_City__c = :destination 
                   AND Departure_Date__c >= :startDate 
                   AND Departure_Date__c <= :endDate 
                   AND Available_Seats__c >= :passengers 
                   ORDER BY Departure_Date__c];

        return flights;
    }
}
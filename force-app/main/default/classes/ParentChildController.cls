/**
 * @description       : Fetches parent records with their associated child and pet records.
 * @author            : VIKASH MUNDARI
 * @group             : 
 * @last modified on  : 06-06-2024
 * @last modified by  : VIKASH MUNDARI
**/
public with sharing class ParentChildController {
    
    // Wrapper class to hold parent, child, and pet records
    public class ParentChildPetWrapper {
        @AuraEnabled
        public String parentName { get; set; }
        
        @AuraEnabled
        public String childNames { get; set; }
        
        @AuraEnabled
        public String petNames { get; set; }

        // Constructor to initialize the wrapper with parent, child, and pet names
        public ParentChildPetWrapper(String parentName, String childNames, String petNames) {
            this.parentName = parentName;
            this.childNames = childNames;
            this.petNames = petNames;
        }
    }

    // Apex method to fetch parent records with their associated child and pet records
    @AuraEnabled(cacheable=true)
    public static List<ParentChildPetWrapper> getParentChildPetRecords() {
        List<ParentChildPetWrapper> wrappers = new List<ParentChildPetWrapper>();
        
        // Fetch parent records with their associated child and pet records using nested query
        List<Parent__c> parentRecords = [
            SELECT Id, Name, 
                   (SELECT Id, Name FROM Children__r),  // Query child records
                   (SELECT Id, Name FROM Pets__r)        // Query pet records
            FROM Parent__c
        ];


        /*
        for (Parent__c parentRecord : parentRecords) 
        {
            for (Child__c childRecord : parentRecord.Children__r) 
            {
                for (Pet__c petRecord : parentRecord.Pets__r)
                {
                    wrappers.add(new ParentChildPetWrapper(parentRecord.Name, childRecord.Name, petRecord.Name));
                }
            }
        } */
        

        // // Loop through the list of parent records
        for (Parent__c parentRecord : parentRecords) {
            // Loop through child records and concatenate their names
            String childNames = '';
            for (Child__c childRecord : parentRecord.Children__r) {
                if (childNames != '') {
                    childNames += ', ';
                }
                childNames += childRecord.Name;
            }

            // Loop through pet records and concatenate their names
            String petNames = '';
            for (Pet__c petRecord : parentRecord.Pets__r) {
                if (petNames != '') {
                    petNames += ', ';
                }
                petNames += petRecord.Name;
            }

            // Add the parent, concatenated child names, and concatenated pet names to the wrapper
            wrappers.add(new ParentChildPetWrapper(parentRecord.Name, childNames, petNames));
        }
        
        return wrappers;  // Return the list of wrappers
    }
}
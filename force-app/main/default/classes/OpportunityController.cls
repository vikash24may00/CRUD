/**
 * @description       : Fetches opportunities with associated account and contact details.
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 06-06-2024
 * @last modified by  : VIKASH MUNDARI
**/

public with sharing class OpportunityController {
    @AuraEnabled(cacheable=true)
    public static List<OpportunityWrapper> getOpportunities() {
        // Retrieve opportunities with non-null account names, limited to 200 records
        List<Opportunity> opps = [SELECT Id, Name, AccountId, Account.Name 
                                   FROM Opportunity 
                                   WHERE Account.Name != null 
                                   LIMIT 200];

        // Collect account IDs from opportunities
        Set<Id> accountIds = new Set<Id>();
        for (Opportunity opp : opps) {
            accountIds.add(opp.AccountId);
        }

        // Retrieve contacts associated with the collected account IDs
        Map<Id, Contact> accountIdToContact = new Map<Id, Contact>();
        for (Contact con : [SELECT Id, Name, AccountId FROM Contact WHERE AccountId IN :accountIds]) {
            accountIdToContact.put(con.AccountId, con);
        }

        // Create OpportunityWrapper objects with opportunity and associated contact data
        List<OpportunityWrapper> oppWrappers = new List<OpportunityWrapper>();
        for (Opportunity opp : opps) {
            oppWrappers.add(new OpportunityWrapper(opp, accountIdToContact.get(opp.AccountId)));
        }

        return oppWrappers;
    }
}
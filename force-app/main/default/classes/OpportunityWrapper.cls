/**
 * @description       : Wrapper class for Opportunity with associated account and contact details.
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 06-03-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class OpportunityWrapper {
    @AuraEnabled
    public String opportunityId { get; set; }
    @AuraEnabled
    public String opportunityName { get; set; }
    @AuraEnabled
    public String accountId { get; set; }
    @AuraEnabled
    public String accountName { get; set; }
    @AuraEnabled
    public String contactName { get; set; }

    public OpportunityWrapper(Opportunity opp, Contact con) {
        this.opportunityId = opp.Id;
        this.opportunityName = opp.Name;
        this.accountId = opp.AccountId;
        this.accountName = opp.Account.Name;
        this.contactName = con != null ? con.Name : null;
    }
}
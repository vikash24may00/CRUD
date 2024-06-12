trigger AccountAddressTrigger on Account (before insert,before update) 
{
    for(account acc:trigger.new)
    { 
        if(acc.Match_Billing_Address__c)
        {
            acc.ShippingPostalCode = acc.BillingPostalCode;
        }
    }
}
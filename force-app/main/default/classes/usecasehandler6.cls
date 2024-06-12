public class usecasehandler6 
{
    public static void handleusecasehandler6(list<account> newrecords)
    {
        for(account acc:newrecords)
        {
            if(!acc.copybillingtoshipping1__c)
            {
                acc.shippingstreet = acc.billingstreet;
                acc.shippingcity = acc.billingcity;
                acc.shippingpostalcode = acc.billingpostalcode;
                acc.shippingstate = acc.billingstate;
                acc.shippingcountry = acc.billingcountry;
            }
        }
    }
}
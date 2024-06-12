public class CopyBillingAddressToShippingAddress 
{
    public static void FunctionAccount(list<Account> newAccounts)
    {
        if(newAccounts.size() > 0)
        {
            for(Account acc : newAccounts)
            {
                if(acc.BillingStreet != null)
                {
                    acc.ShippingStreet = acc.BillingStreet;
                }
                
                if(acc.BillingCity != null)
                {
                    acc.ShippingCity = acc.BillingCity;
                }
                
                if(acc.BillingState != null)
                {
                    acc.ShippingState = acc.BillingState;
                }
                
                if(acc.BillingPostalCode != null)
                {
                    acc.ShippingPostalCode = acc.BillingPostalCode;
                }
                
                if(acc.BillingCountry != null)
                {
                    acc.ShippingCountry = acc.BillingCountry;
                }
                
            }
        } 
    }
}
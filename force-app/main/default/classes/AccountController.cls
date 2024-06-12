public with sharing class AccountController 
{
    @AuraEnabled(Cacheable=true)
    public static list<Account> getAccountList()
    {
        return [SELECT id,Name,Type,Industry from Account LIMIT 5];
    }
    
    @AuraEnabled(Cacheable=true)
    public static list<Account> filterAccountType(String type)
    {
        return [SELECT id,Name,Type from Account where Type=:type LIMIT 5];
    }
    
    @AuraEnabled(Cacheable=true)
    public static list<Account> findAccounts(String searchKey)
    {
        string key = '%' + searchKey + '%';
        return [SELECT id,Name,Type,Industry from Account where Name Like:key LIMIT 5];
    }
}
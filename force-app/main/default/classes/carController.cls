public with sharing class carController {

    // wrapper class
    public class Filters
    {
    @Auraenabled 
    public String searchKey {get;set;}

    @Auraenabled 
    public Decimal maxPrice {get;set;}

    @Auraenabled 
    public String[] categories {get;set;}

    @Auraenabled 
    public String[] makeType {get;set;}

    } 

    @Auraenabled(Cacheable=true)
    public static list<Car__C> getCars(Filters filters)
    {
        String key,whereClause = '';
        Decimal maxPrice;
        String[] categories,makeType,criteria = new List<String>{};

if(filters != null)
{
    maxPrice = filters.maxPrice;
    categories = filters.categories;
    makeType = filters.makeType;

    if(!String.isEmpty(filters.searchKey))
    {
        key = '%' + filters.searchKey + '%' ;
        criteria.add('Name LIKE: Key');
    }

    if(filters.maxPrice >= 0)
    {
        criteria.add('MSRP__c <= :maxPrice');
    }

    if(filters.categories != null)
    {
        criteria.add('Category__c IN :categories');
    }

    if(filters.makeType != null)
    {
        criteria.add('Make__c IN :makeType');
    }

    if(criteria.size() > 0)
    {
        whereClause = 'WHERE' + String.join(criteria,'AND');
    }
}

 String query = 'SELECT Id,Name,MSRP__c,Description__c,Category__c,Picture_URL__c FROM Car__c' + whereClause + 'WITH SECURITY_ENFORCED' + 'ORDER BY Name';

 return Database.query(query);
    } 
}
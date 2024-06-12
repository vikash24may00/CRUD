public class usecasehandler7 
{
    public static void handleusecasehandler7(list<Position__c> newrecords)
    {
        for(Position__c p:newrecords)
        {
            if( p.Open_Date__c == null && p.Min_Pay__c == null && p.Max_Pay__c == null)
            {
                p.Open_Date__c = system.today();
                p.Min_Pay__c = 10000;
                p.Max_Pay__c = 15000; 
            }
        }
    }
}
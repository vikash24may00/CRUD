public class CustomSobjectDemo {
    
    public static void createPosition()
    {
        Position__c pos = new Position__c();
        pos.Name = 'Mulesoft Developer';
        pos.RecordTypeId = '0125g000002i3YWAAY';
        insert pos;
    }
    
    public static void createCandidate()
    {
        Candidate__c can = new Candidate__c();
        can.First_Name__c = 'kuma';
        can.Last_Name__c = 'mishima';
        insert can;
    }
    
    public static void createJobApplication()
    {
        
        Position__c pos = new Position__c();
        pos.Name = 'Full Stack Developer';
        pos.RecordTypeId = '0125g000002i3YWAAY';
        insert pos;
        
        Candidate__c can = new Candidate__c();
        can.First_Name__c = 'Ryu';
        can.Last_Name__c = 'SF6';
        insert can;
        
        Job_Application__c job = new Job_Application__c();
        job.Position__c = pos.id;
        job.Candidate__c = can.id;
        job.Status__c = 'new';
        insert job;
        
        Review__c rev = new Review__c();
        rev.Job_Application__c = job.id;
        rev.Rating__c = 5;
        insert rev;
    }    
}
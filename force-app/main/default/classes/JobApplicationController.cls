public with sharing class JobApplicationController {
    @AuraEnabled(cacheable=true)
    public static List<JobApplicationWrapper> getJobApplicationsWithPositions() {
        // Query Job Applications and related Positions using the correct child relationship name
        List<Job_Application__c> jobApplications = [
            SELECT Id, Name, Position__c,
                   Position__r.Name
            FROM Job_Application__c
        ];
        
        // Wrap the queried data
        List<JobApplicationWrapper> wrappers = new List<JobApplicationWrapper>();
        for (Job_Application__c jobApp : jobApplications) {
            JobApplicationWrapper wrapper = new JobApplicationWrapper();
            wrapper.jobApplication = jobApp;
            wrapper.positionName = jobApp.Position__r != null ? jobApp.Position__r.Name : null;
            wrappers.add(wrapper);
        }
        return wrappers;
    }
    
    public class JobApplicationWrapper {
        @AuraEnabled public Job_Application__c jobApplication { get; set; }
        @AuraEnabled public String positionName { get; set; }
    }
}
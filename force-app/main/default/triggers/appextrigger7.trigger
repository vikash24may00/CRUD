trigger appextrigger7 on Candidate__c (before insert,before update) 
{    
    if((trigger.isbefore) && (trigger.isinsert || trigger.isupdate))
    {
        for(Candidate__c cand:trigger.new)
        {
            integer recordcount = [select count() from Candidate__c where First_Name__c =: cand.First_Name__c];
            if(recordcount > 0)
            {
                cand.adderror('record already present');
            }
        }
    }    
}
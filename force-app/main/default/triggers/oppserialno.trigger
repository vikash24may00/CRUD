trigger oppserialno on OpportunityLineItem (before insert) 
{
    Set<id> oppid = new Set<id> ();
    
    for(OpportunityLineItem oppprod:Trigger.new)
    {
        oppid.add(oppprod.opportunityid);
    }
    
    List<OpportunityLineItem> oppprodlisttoupdate = new List<OpportunityLineItem>();
    
    //map opportunity id and serial number
    Map<Id,String> oppidserialnomap =new Map<Id,String>();
    
    List<OpportunityLineItem> oppprodList=[Select Id,serial_number__c,opportunityid from OpportunityLineItem where opportunityid =: oppid];
    
    if(oppprodList.size()>0)
    {
        for(OpportunityLineItem oppoprd:oppprodList)
        {
            if(oppoprd.serial_number__c!=null)
            {
                //last number of the serial number
                String lastword = oppoprd.serial_number__c.substring(oppoprd.serial_number__c.length() - 1);
                
                //convert string to integer to increment the lastnumber which is already there in Serialnumber field
                Integer num = Integer.valueOf(lastword);
                num++;
                
                //append the incremented number
                oppoprd.serial_number__c=oppoprd.serial_number__c+','+(num);
                oppprodlisttoupdate.add(oppoprd);
                
                //add it to map to make changes for the OpportunityLineItem which is newly getting inserted
                oppidserialnomap.put(oppoprd.opportunityid,oppoprd.serial_number__c);
            }
            
            else
            {
                //if the serial number field is null then it means there is no OpportunityLineItem present so by default we are passing 1
                oppoprd.serial_number__c='1';
                oppprodlisttoupdate.add(oppoprd);
            }
            
        }
    }
    if(oppprodlisttoupdate.size()>0)
    {
        update oppprodlisttoupdate;
    }
    
    for(OpportunityLineItem oppprod:Trigger.new){
        
        if(oppidserialnomap.containsKey(oppprod.opportunityid))
        {
            oppprod.serial_number__c = oppidserialnomap.get(oppprod.opportunityid);
        }
        
        else
        {
            oppprod.serial_number__c='1';
        }
    }
}
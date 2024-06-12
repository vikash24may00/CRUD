trigger TestTrigger on Account (before insert,before update,after update) 
{
    /* if (trigger.isBefore && trigger.isInsert) 
{
AccountTestTriggerHandler.FunctionAccount(trigger.new);
} */
    
    /* if(trigger.isbefore && (trigger.isinsert || trigger.isupdate))
{
CopyBillingAddressToShippingAddress.FunctionAccount(trigger.new);
} */
    
    /* if (trigger.isAfter && trigger.isUpdate) 
{
UpdateChildByParent.Function(trigger.newMap, trigger.oldMap);
} */
    
    // error a raha tha
    /*  if (trigger.isAfter && trigger.isUpdate) {
UpdateParentByChild.Function1(trigger.new, trigger.oldMap);
}  */
    
    // sahi ho gaya
    Map<Id, Contact> oldContactMap = new Map<Id, Contact>([SELECT Id, AccountId, Description FROM Contact WHERE AccountId IN :Trigger.newMap.keySet()]);
    List<Contact> newContacts = [SELECT Id, AccountId, Description FROM Contact WHERE AccountId IN :Trigger.newMap.keySet()];
    
    UpdateParentByChild.Function1(newContacts, oldContactMap);
    
    
    
}
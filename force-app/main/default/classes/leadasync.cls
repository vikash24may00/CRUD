public class leadasync 
{
    
     @future
    public static void updateleadrecords(set <id> existingrecordsid)
    {
        list<lead> existingrecords = [select id,leadsource from lead where id In :existingrecordsid ];
            for(lead record : existingrecords)
        {
            record.leadsource = 'web';
        }
        update existingrecords;
    }
    
    
    @future
    public static void createleadrecords()
    {
        lead anotherlead = new lead (lastname='test lead' , status='open - not contacted',company='test');
    }
     
}
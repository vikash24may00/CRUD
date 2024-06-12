public class leadhandler 
{
    public static void handlebeforedeletion(list<lead> newrecords)
    {
        for(lead l:newrecords)
        {
            if(l.Status == 'Working - Contacted')
            {
                l.adderror('you cannot delete');
            }
        }
    }
}
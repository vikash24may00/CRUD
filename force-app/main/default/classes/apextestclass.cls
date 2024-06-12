public class apextestclass 
{
    public static decimal farenhitetocelsius(decimal fh)
    {
        decimal cs = (fh-32) * 5/9;
        return cs.setscale(2);
    }
}
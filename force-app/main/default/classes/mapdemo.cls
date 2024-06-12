public class mapdemo 
{
    
    public static void sobjectwithoutloopdemo()
    {
        list<account> acclist = new list<account>();
        acclist = [select id,name from account limit 5];
        
        map<id,account> accmap = new map<id,account>(acclist);  //list will be converted into map
        
        system.debug(accmap);
        system.debug(accmap.keyset());
        system.debug(accmap.values());
    }
    
    public static void sobjectwithloopdemo()
    {
        list<account> acclist = new list<account>();
        acclist = [select id,name from account limit 5];
        
        map<id,account> accmap = new map<id,account>();  
        
        for(account acc: acclist)
        {
            accmap.put(acc.id,acc);
        }
        
        system.debug(accmap);
        system.debug(accmap.keyset());
        system.debug(accmap.values());
    }
    
    public static void demo()
    {
        map <integer,string> colors = new map<integer,string>();        
        colors.put(1,'red');
        colors.put(2,'blue');
        colors.put(3,'yellow');
        colors.put(4,'green');
        
        map <integer,string> cars = new map<integer,string>();
        cars.put(5,'suv');
        cars.put(6,'sedan');
        cars.put(7,'hatchback');
        cars.put(8,'oofroad');
        
        
        system.debug(colors);   
        
        colors.putAll(cars);
        
        system.debug(colors);   
    }
    
}
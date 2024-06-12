public class ListDemo {
    
    public static void SobjectListDemo()
    {
        list<Account> accountlist = new list<Account>();
        
        Account acc1 = new Account(Name='acc101' , Active__c = 'yes');
        accountlist.add(acc1);
        
        Account acc2 = new Account();
        acc2.Name = 'acc102';
        acc2.active__c = 'yes';
        accountlist.add(acc2);
        
        insert(accountlist);
        
    }
    
    
     public static void SobjectListPosition()
    {
        list<Position__c> positionlist = new list<Position__c>();
        
        Position__c pos1 = new Position__c(Name='Software Developer');
        positionlist.add(pos1);
        
        Position__c pos2 = new Position__c();
        pos2.Name = 'Web Developer';
        positionlist.add(pos2);
        
        insert(positionlist);
        
    }
    
    
    public static list<string> returndemo()
    {
        // List<String> cars = new List<String>();
        // cars.add('suv');
        // cars.add('sedan');
        // cars.add('sports');
        // cars.add('hatchback');
        List<String> cars = new List<String>{'suv','sedan','sports','hatchback'};
            
            
            return cars;
    }
    
    public static void listdemoMethod()
    {
        list<string> returnvalues = new list<string>();
        returnvalues = returndemo();
        system.debug('return values : ' + returnvalues);
        
        
        List<String> colors = new List<String>();
        colors.add('red');
        colors.add('blue');
        colors.add('green');
        colors.add('yellow');
        
        
        List<String> colors1 = new List<String>();
        colors1.add('black');
        colors1.add('white');
        
        
        colors.addAll(colors1);
        
        system.debug(colors);
        system.debug(colors1);
        
        colors1.clear();
        
        system.debug(colors1);
        
        
        List<String> clonedlist = new List<String>();
        clonedlist = colors.clone();
        System.debug(clonedlist);
        
        system.debug('Red is contained in list : ' + colors.contains('red'));
        system.debug('list is equal : ' + colors.equals(clonedlist));
        system.debug(colors.get(3));
        
        
    }
}
/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 06-04-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/

/**
 * @description       : This controller retrieves custom data,
 *                      wraps them in a custom wrapper class, and makes them available for
 *                      Lightning components.
 * @group             : 
 * @last modified on  : 06-04-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/

public class CustomDataController {
    
    // Wrapper class defined inside the controller class
    public class CustomDataWrapper {
        @AuraEnabled
        public String name { get; set; }
        
        @AuraEnabled
        public Integer age { get; set; }
        
        public CustomDataWrapper(String name, Integer age) {
            this.name = name;
            this.age = age;
        }
    }

    @AuraEnabled(cacheable=true)
    public static List<CustomDataWrapper> getCustomData() {
        List<CustomDataWrapper> wrappers = new List<CustomDataWrapper>();
        
        // Sample data
        wrappers.add(new CustomDataWrapper('John Doe', 25));
        wrappers.add(new CustomDataWrapper('Jane Smith', 30));
        wrappers.add(new CustomDataWrapper('Alice Johnson', 28));
        
        return wrappers;
    }
}
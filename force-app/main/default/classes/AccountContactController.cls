/**
 * @description       : 
 * @author            : VIKASH MUNDARI
 * @group             : 
 * @last modified on  : 06-06-2024
 * @last modified by  : VIKASH MUNDARI
**/
// /**
//  * @description       : 
//  * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
//  * @group             : 
//  * @last modified on  : 06-06-2024
//  * @last modified by  : VIKASH MUNDARI
// **/

// public class AccountContactController {
//     // Wrapper class defined inside the controller class
//     public class AccountContactWrapper {
//         @AuraEnabled
//         public Account account { get; set; }
        
//         @AuraEnabled
//         public Contact contact { get; set; }
        
//         public AccountContactWrapper(Account account, Contact contact) {
//             this.account = account;
//             this.contact = contact;
//         }
//     }

//     @AuraEnabled(cacheable=true)
//     public static List<AccountContactWrapper> getAccountContacts() {
//         List<AccountContactWrapper> wrappers = new List<AccountContactWrapper>();
        
//         List<Account> accounts = [SELECT Id, Name, (Select Id, Name from contacts) FROM Account LIMIT 20];
        
//         if (accounts != null && !accounts.isEmpty()) {
//              for (Account acc : accounts) {
               
//                  for (contact con : acc.Contacts) {
                    
//                      wrappers.add(new AccountContactWrapper(acc, con));
//                  }
                 
//              }
//          }
                

//         return wrappers;

//     }
// }


/**
 * @description       : Fetches accounts with their associated contacts.
 * @author            : VIKASH MUNDARI
 * @group             : 
 * @last modified on  : 06-06-2024
 * @last modified by  : VIKASH MUNDARI
**/
public class AccountContactController {
    // Wrapper class defined inside the controller class
    public class AccountContactWrapper {
        @AuraEnabled
        public String accountName { get; set; }
        
        @AuraEnabled
        public String contactNames { get; set; }
        
        public AccountContactWrapper(String accountName, String contactNames) {
            this.accountName = accountName;
            this.contactNames = contactNames;
        }
    }

    @AuraEnabled(cacheable=true)
    public static List<AccountContactWrapper> getAccountContacts() {
        List<AccountContactWrapper> wrappers = new List<AccountContactWrapper>();
        
        // Fetch accounts with their associated contacts using a nested query
        List<Account> accounts = [SELECT Id, Name, (SELECT Id, Name FROM Contacts) FROM Account LIMIT 20];
        
        // Loop through the list of accounts and their associated contacts
        for (Account acc : accounts) {
            if (acc.Contacts != null && !acc.Contacts.isEmpty()) {
                String contactNames = '';
                for (Contact con : acc.Contacts) {
                    if (contactNames != '') {
                        contactNames += ', ';
                    }
                    contactNames += con.Name;
                }
                wrappers.add(new AccountContactWrapper(acc.Name, contactNames));
            } else {
                wrappers.add(new AccountContactWrapper(acc.Name, ''));
            }
        }

        return wrappers;  // Return the list of wrappers
    }
}
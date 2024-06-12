public class AccountTestTriggerHandler {
    
    public static void FunctionAccount(List<Account> newAccounts) {
        if (newAccounts != null && !newAccounts.isEmpty()) {
            for (Account acc : newAccounts) {
                if (acc.Phone == null) {
                    acc.Phone.addError('You cannot insert an account without a phone number.');
                }
            }
        }
    }
}
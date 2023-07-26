public with sharing class AccountService {

    public static void deleteAccounts(Set<Id> acctIds){

        //forçando o erro DMLs
        List<Account> toDelete = [
                            SELECT Id 
                            FROM Account 
                            WHERE Id IN :acctIds];

        for(Account acct : toDelete){
            delete acct;
        }                    


    }
}
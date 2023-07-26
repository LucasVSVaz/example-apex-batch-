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

        /*if (!toDelete.isEmpty()) {
            try {
                Database.delete(toDelete);
                System.debug('Deu bom. Contas deletadas.');
            } catch (DMLException ex) {
                System.debug('Error - ' + ex.getMessage());
            }
        } else {
            System.debug('Nenhuma conta encontrada para deletar.');
        }*/
    }
}
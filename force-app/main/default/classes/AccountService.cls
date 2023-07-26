public with sharing class AccountService {

    public static void deleteAccounts(Set<Id> acctIds){

        List<Account> toDelete = [
                            SELECT Id 
                            FROM Account 
                            WHERE Id IN :acctIds];

        if (!toDelete.isEmpty()) {
            try {
                Database.delete(toDelete);
                System.debug('Deu bom. Contas deletadas.');
            } catch (DMLException ex) {
                System.debug('Error - ' + ex.getMessage());
            }
        } else {
            System.debug('Nenhuma conta encontrada para deletar.');
        }
    }
}
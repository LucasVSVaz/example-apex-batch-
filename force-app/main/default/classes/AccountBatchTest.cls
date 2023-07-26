@isTest
public with sharing class AccountBatchTest {


    @isTest
    static void testAccountBatch_Success() {

        List<Account> accounts = new List<Account>();
        for (Integer i = 0; i < 200; i++) {
            Account acc = new Account(Name = 'Test Account ' + i);
            accounts.add(acc);
        }
        insert accounts;

        for(Account acct : accounts){
            Test.setCreatedDate(acct.Id, Datetime.now().addDays(-5));
        }

        Test.startTest();
        Database.executeBatch(new AccountBatch(), 200);
        Test.stopTest();

        Integer result = [SELECT COUNT() FROM Account WHERE CreatedDate = LAST_N_DAYS:7];

        System.assertEquals(0, result);
    }
}
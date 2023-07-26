@isTest
public with sharing class ScheduleAccountBatchTest {
    

    @isTest
    static void testScheduleAccountBatch(){
        
        Test.startTest();
        ScheduleAccountBatch.scheduleBatch();
        Test.stopTest();

        Integer jobCount = [SELECT COUNT() FROM CronTrigger WHERE CronJobDetail.Name = 'Descrição do Batch'];
        System.assertEquals(1, jobCount);

    }

    /*@isTest
    static void ScheduleAccountBatch(){

        String CRON_EXP = '0 30 2 1 * ?'; 

        Test.startTest();
        List<Account> accounts = new List<Account>();
        for (Integer i = 0; i < 200; i++) {
            Account acc = new Account(Name = 'Test Account ' + i);
            accounts.add(acc);
        }
        insert accounts;

        String jobId = System.schedule('testScheduleAccountBatch', 
                    CRON_EXP, new ScheduleAccountBatch());

        CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime
                        FROM CronTrigger WHERE id = :jobId];

        System.assertEquals(CRON_EXP, ct.CronExpression);    
        
        System.assertEquals(0, ct.TimesTriggered);
        Test.stopTest();        
        
    }*/
}
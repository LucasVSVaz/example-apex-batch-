public with sharing class ScheduleAccountBatch{

    public static void scheduleBatch() {

        Integer minutesFromNow = 1;
        AccountBatch batch = new AccountBatch();

        String jobId = System.scheduleBatch(batch, 'Descrição do Batch', minutesFromNow);
        System.debug('Batch agendado com o ID do trabalho: ' + jobId);

        /*String cronExpression = '0 30 9 26 JUL ? 2023';

        AccountBatch batch = new AccountBatch();

        System.schedule('AccountBatchSchedule', cronExpression, batch);

        Database.executeBatch(new AccountBatch());*/
    }
}
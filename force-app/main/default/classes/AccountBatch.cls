global class AccountBatch implements Database.Batchable<sObject>, Database.Stateful{

    private Integer count = 0;

    global Database.QueryLocator start(Database.BatchableContext BC) {
        return Database.getQueryLocator([SELECT Id FROM Account WHERE CreatedDate = LAST_N_DAYS:7]);
    }
        
    global void execute(Database.BatchableContext BC, List<sObject> scope){

        Set<Id> accSet = (new Map<Id, sObject>(scope)).keySet();
        AccountService.deleteAccounts(accSet);
        this.count = accSet.size();
    }

    global void finish(Database.BatchableContext BC) {
        System.debug('Foram passados ' + this.count + ' Ids para a Service');

    }
}


    
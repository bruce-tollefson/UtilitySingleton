trigger AccountTrigger on Account (before insert, after insert) {
    switch on Trigger.operationType{
        when BEFORE_INSERT {
            CheckSingletonWrapper.doubleCheck();
            UtilitySingleton utility = UtilitySingleton.getInstance();
            Boolean prod = utility.isProduction;
            Boolean prod2 = ![Select isSandbox from Organization].isSandbox;
            system.debug('Before Account Insert the system is Prod?'+prod+' and Number is '+System.Limits.getQueries());
        }
        when AFTER_INSERT {
            CheckSingletonWrapper.doubleCheck();
            UtilitySingleton utility = UtilitySingleton.getInstance();
            Boolean prod = utility.isProduction;
            Boolean prod2 = ![Select isSandbox from Organization].isSandbox;
            system.debug('After Account Insert the system is Prod?'+prod+' and Number is '+System.Limits.getQueries());
            Case cs = new Case(AccountId = Trigger.New[0].Id, Subject='AccountTriggerCreate');
            insert cs;
        }
    }
    
}

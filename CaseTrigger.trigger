trigger CaseTrigger on Case (before insert, after insert) {
    switch on Trigger.operationType{
        when BEFORE_INSERT {
            CheckSingletonWrapper.doubleCheck();
            UtilitySingleton utility = UtilitySingleton.getInstance();
            Boolean prod2 = ![Select isSandbox from Organization].isSandbox;
            Boolean prod = utility.isProduction;
            
            system.debug('Before Case Insert the system is Prod?'+prod+' and Number is '+System.Limits.getQueries());
        }
        when AFTER_INSERT {
            CheckSingletonWrapper.doubleCheck();
            UtilitySingleton utility = UtilitySingleton.getInstance();
            Boolean prod2 = ![Select isSandbox from Organization].isSandbox;
            Boolean prod = utility.isProduction;
            system.debug('After Case Insert the system is Prod?'+prod+' and Number is '+System.Limits.getQueries());
        }
    }
}
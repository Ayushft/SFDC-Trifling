trigger AddRelatedRecord on Account(after insert, after update) {
    List<Opportunity> oppList = new List<Opportunity>();
    // Get the related opportunities for the accounts in this trigger
    List<Account> toProcess = null;
    switch on Trigger.operationType{
        when AFTER_INSERT{
            toProcess = trigger.New;
        }when AFTER_UPDATE{
            toProcess = [SELECT Id,Name FROM Account WHERE Id in :Trigger.New AND Id not in (SELECT AccountId FROM Opportunity WHERE AccountId in :Trigger.New)];
        }
    }
    /*Map<Id,Account> acctsWithOpps = new Map<Id,Account>(
        [SELECT Id,(SELECT Id FROM Opportunities) FROM Account WHERE Id IN :Trigger.new]);*/
    // Add an opportunity for each account if it doesn't already have one.
    // Iterate through each account.
    for(Account a : toProcess) {
        //System.debug('acctsWithOpps.get(a.Id).Opportunities.size()=' + acctsWithOpps.get(a.Id).Opportunities.size());
        // Check if the account already has a related opportunity.
        //if (acctsWithOpps.get(a.Id).Opportunities.size() == 0) {
            // If it doesn't, add a default opportunity
            oppList.add(new Opportunity(Name=a.Name + ' Opportunity',
                                       StageName='Prospecting',
                                       CloseDate=System.today().addMonths(1),
                                       AccountId=a.Id));
        //}         
    }
    if (oppList.size() > 0) {
        insert oppList;
    }
}
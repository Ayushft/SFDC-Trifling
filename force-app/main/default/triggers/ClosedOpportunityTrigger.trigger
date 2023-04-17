trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    List<Task> toProcess = new List<Task>();
            for(Opportunity opp : [SELECT Id FROM Opportunity WHERE Id in :Trigger.New AND StageName = 'Closed Won']){
                Task tt = new Task(WhatId=opp.Id,Subject='Follow Up Test Task');
                system.debug('reached');
                toProcess.add(tt);
            }
            insert toProcess;
}
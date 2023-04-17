public with sharing class PlayerController {
    @AuraEnabled(cacheable=true)
    public static List<Player__c> getPlayers() {
        return [
            SELECT Id, Name,Date_Of_Birth__c, Age__c, Nationality__c, Player_Nationality__c, Position__c, Club__c, Club__r.Name
            FROM Player__c
            WITH SECURITY_ENFORCED
            LIMIT 50
        ];
}
}
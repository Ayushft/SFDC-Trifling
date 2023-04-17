trigger ContactUpdation on Contact (before insert, before Update, after Update) {
    if(Trigger.isBefore && Trigger.isInsert){
        System.debug('I am in before insert context');
    }
    if(Trigger.isUpdate){
        if(Trigger.isBefore){
            for(Contact cc1 : Trigger.new){
        		System.debug('New Last Name : ' + cc1.LastName);
            	System.debug('Old Last Name : ' + Trigger.oldMap.get(cc1.Id).LastName);
            }
        }   
        if(Trigger.isAfter){
            System.debug('I am in after update context');
        }
    }
}
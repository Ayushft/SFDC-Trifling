trigger AccountAddressTrigger on Account (before insert, before update) {
    List<Account> clist = new List<Account>();
    if(Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)){
        for(Account acc : Trigger.New){
            if(acc.ShippingAddress == NULL && acc.Match_Billing_Address__c == TRUE){
                acc.ShippingCity = acc.BillingCity;
                acc.ShippingCountry = acc.BillingCountry;
                acc.ShippingState = acc.BillingState;
                acc.ShippingPostalCode = acc.BillingPostalCode;
                acc.ShippingStreet = acc.BillingStreet;
            }
        }
    }
}
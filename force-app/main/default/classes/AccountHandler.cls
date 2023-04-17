public class AccountHandler {
    public static Account insertNewAccount(String acctName){
        //List<Account> acctList = new List<Account>{
		Account acct = new Account(Name=acctName);
        Database.SaveResult srResult =  Database.insert(acct,false);
        //for(Database.SaveResult sr : srResult){
            if(srResult.isSuccess()){
                //ID acctID = sr.getId();
                return acct;
            }else {
            //what was the error?
            	for(Database.Error err : srResult.getErrors()) {
                	System.debug('The following error has occurred.');
                    System.debug(err.getStatusCode() + ': ' + err.getMessage());
                }
            }
       //then return null 
       return null;
    }
}
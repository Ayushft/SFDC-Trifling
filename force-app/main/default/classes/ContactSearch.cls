public class ContactSearch {
    public static Contact[] searchForContacts(String first, String second){
        Contact[] cts1 = [SELECT Id, Name FROM Contact WHERE (LastName=:first AND MailingPostalCode=:second)];
        return cts1;
    }
}
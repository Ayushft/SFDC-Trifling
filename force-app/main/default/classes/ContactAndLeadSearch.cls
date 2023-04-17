public class ContactAndLeadSearch {
    public static List<List<sObject>> searchContactsAndLeads(String first){
        List<List<sObject>> result = [FIND :first IN NAME FIELDS RETURNING Contact(FirstName, LastName), Lead(FirstName, LastName) ];
        return result;
    }
}
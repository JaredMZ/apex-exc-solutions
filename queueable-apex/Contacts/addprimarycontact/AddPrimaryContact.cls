public class AddPrimaryContact implements Queueable {
    private Contact contact;
    private String state;
    //Create class constructor
    public AddPrimaryContact(Contact contact, String state)
    {
        this.contact = contact;
        this.state = state;
    }
    
    public void execute(QueueableContext context) {
        List<Account> accounts = [SELECT ID, Name ,(Select id,FirstName,LastName from contacts ) FROM ACCOUNT WHERE BillingState = :state LIMIT 200];
        List<Contact> contacts = new List<Contact>();

        for (Account account : accounts) {
            Contact clonedContact = contact.clone(false, true);
            clonedContact.AccountId = account.Id;
            contacts.add(clonedContact);
        }

        insert contacts;
    }
    
}
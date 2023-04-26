@isTest
public class AddPrimaryContactTest {
    @isTest
    public static void testAddPrimaryContact() {
        // Insert 50 Account records for BillingState NY
        List<Account> Accounts = new List<Account>();
        for (Integer i = 0; i < 50; i++) {
            Accounts.add(new Account(Name='Test Account ' + i, BillingState='NY'));
        }        
        // Insert 50 Account records for BillingState CA
        for (Integer j = 0; j < 50; j++) {
            Accounts.add(new Account(Name='Test Account ' + j, BillingState='CA'));
        }
        insert Accounts;
        
        
        Contact contact = new Contact(FirstName='Test', LastName='contact');
        insert contact;
        String state = 'CA';
        // Create our Queueable instance
        AddPrimaryContact job = new AddPrimaryContact(contact, state);
        // startTest/stopTest block to force async processes to run
        Test.startTest();
        System.enqueueJob(job);
        Test.stopTest();
    }
}
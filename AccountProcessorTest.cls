public class AccountProcessor {
    @future //Method that accept a List of Ids
    public static void countContacts (List<Id> accountIds){
        List<Account> accountsToUpdate = new List<Account>();//List for the accounts with number of contacts
        
        for(Id accId : accountIds)//Iterate trough Ids List
        {
            Integer numContacts = [SELECT COUNT() FROM Contact WHERE AccountId = :accId];//Count the num of releted contacts
            
            accountsToUpdate.add(new Account(Id = accId, Number_Of_Contacts__c = numContacts));//Update the num of contacts
            
        }
        update accountsToUpdate;//update the List
    }

}
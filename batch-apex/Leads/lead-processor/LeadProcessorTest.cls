@isTest
private class LeadProcessorTest {
    @isTest
    static void testLeadProcessor() {
        // Insert 200 test lead records
        List<Lead> leadsToInsert = new List<Lead>();
        for (Integer i = 0; i < 200; i++) {
            leadsToInsert.add(new Lead(FirstName = 'Test', LastName = 'Lead', Company = 'Test Company', LeadSource='Dreamforce'));
        }
        insert leadsToInsert;
        
        Test.startTest();
        LeadProcessor batch = new LeadProcessor();
        Database.executeBatch(batch);
        Test.stopTest();
        
        // Verify that all lead records were updated with the correct LeadSource value
        Integer updatedLeads = [SELECT COUNT() FROM Lead WHERE LeadSource = 'Dreamforce'];
        System.assertEquals(200, updatedLeads);
    }
}
@isTest
public class DailyLeadProcessorTest {
    //CRON expression
    public static String CRON_EXP = '0 0 0 28 4 ? 2023';
    
    @isTest
    static void mainTest(){
        List<Lead> leads = new List<Lead>();
        
        for(Integer i = 0; i < 200; i++){
            Lead lead = new Lead();
            lead.FirstName = 'Test';
            lead.LastName = 'Lead' + i;
            lead.LeadSource = null;
            lead.Company = 'DEvs';
            leads.add(lead);
        }
        
        insert leads;
        
        Test.startTest();
        String jobId = System.schedule('updateLeads', CRON_EXP, new DailyLeadProcessor());
        Test.stopTest();
        
        List<Lead> actualLeads = [SELECT FirstName, LeadSource FROM Lead WHERE LeadSource = 'Dreamforce'];
        System.assertEquals(200, actualLeads.size(), 'Leads were not updated');
        
        
    }
}
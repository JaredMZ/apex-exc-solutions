public class DailyLeadProcessor implements Schedulable {
    public void execute(SchedulableContext cx){
        List<Lead> leadsBlank = [SELECT Id, Name, LeadSource FROM Lead WHERE LeadSource = '' LIMIT 200];
               
        for(Lead lead : leadsBlank){
            lead.LeadSource = 'Dreamforce';
        }
        update leadsBlank;
    }   
}
Trigger  CreateAppESforRNtoBSN on Opportunity (after insert) {
// create a map with all the Opportunity where the program is RNtoBSN and the Start date is > today
List<Enrollment_Steps__c> AppESD = new List<Enrollment_Steps__c>();
for (opportunity Opp : Trigger.new) {
if ((opp.Academic_Program__c == 'RNtoBSN')&& (opp.Academic_Program__c != null)) {
AppESD.add(new Enrollment_Steps__c (
Name = 'Application',
Opportunity__c = opp.id,
Completion_Date__c = Date.Today(),
Date_Sent__c = Date.Today(),
Status__c = 'Completed'));
}
insert AppESD;
}}
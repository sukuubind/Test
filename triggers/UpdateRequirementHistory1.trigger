Trigger UpdateRequirementHistory1 on Requirements__c ( before update) {
// Create a Map to put in the old and new values 
Map<id,String> oldValueMap = new Map<id,String>();
Map<id,String> newValueMap = new Map<id,String>();
Set<id> RequirementID = new Set<id>();
List<Requirement_History__c> ReqHistListToUpdate = new List<Requirement_History__c>();
// iterate over the object to identify and update the maps where the Requirement is changed or updated
for (integer i = 0; i < trigger.new.size(); i ++) {
String oldValueDesc = Trigger.old[i].Description__c;
String newValueDesc = Trigger.new[i].Description__c;
if ((oldValueDesc != newValueDesc ) && (newValueDesc != null)) {
oldValueMap.put(Trigger.new[i].id,Trigger.old[i].Description__c);
newValueMap.put(Trigger.new[i].id,Trigger.new[i].Description__c);
RequirementID.add(Trigger.new[i].id);
}}
// iterate over the set where all the id's are stored

for (id  Reqid : RequirementID) {
Requirement_History__c  ReqHist = new Requirement_History__c();
ReqHist.Requirement__c = Reqid;
ReqHist.Old_Value__c = oldValueMap.get(Reqid);
ReqHist.New_Value__c = newValueMap.get(Reqid);

ReqHistListToUpdate.add(ReqHist);
}
update ReqHistListToUpdate;
}
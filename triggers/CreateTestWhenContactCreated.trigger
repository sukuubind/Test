trigger CreateTestWhenContactCreated on Contact (after insert) {
List<Test__c> TestList = new List<Test__c>();

for (Contact C: Trigger.new){
if (C.Email != null){
Test__c  T = new Test__c();
T.Email__c = C.Email;
T.Comments__c = 'New Test created from ' + C.FirstName;
T.Name = 'Test created from Contact';

TestList.add(T);

}


}
Try{
insert TestList;
}
Catch (exception e){
System.debug(e);
}
}
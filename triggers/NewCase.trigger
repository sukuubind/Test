Trigger NewCase on Account (after insert) {
for (Account A : Trigger.new){
Case NewCase = new Case();
NewCase.subject = 'New Case Created';
NewCase.AccountID = A.ID;
NewCase.priority = 'High';

Insert NewCase;
}
}
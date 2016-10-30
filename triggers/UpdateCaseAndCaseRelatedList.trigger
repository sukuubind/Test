Trigger UpdateCaseAndCaseRelatedList on Case (before update,  before insert,after insert, after update){
if(Trigger.isUpdate || Trigger.isInsert){
if(Trigger.isBefore){
UpdateCaseRelatedListFromCaseAndBack UC = new UpdateCaseRelatedListFromCaseAndBack(Trigger.oldmap,Trigger.newmap,Trigger.new);
UC.UpdateCaseFromCaseRelatedList();
UC.GetContactPhonefromAccount();
}}
if (Trigger.isUpdate || Trigger.isInsert) {
if(Trigger.isAfter) {
UpdateCaseRelatedListFromCaseAndBack UC = new UpdateCaseRelatedListFromCaseAndBack(Trigger.oldmap,Trigger.newmap,Trigger.new);
UC.UpdateCaseRelatedListFromCase();
}}}
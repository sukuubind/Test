Trigger CommentHistory on Test__c (before update){
// Commenting a line from with Force.com ide
Set<ID> TestSetID = new Set<ID>();

Map<String,Test__c> OldMapComment = new Map<String,Test__c>();
Map<String,Test__c> NewMapComment = new Map<String,Test__c>();

for (Test__c T : Trigger.new){

If(T.Comments__c != null){

T.Comments_History__c = Trigger.oldMap.get(T.ID).Comments__c;
}

}}
Trigger MasterOpportunityTrigger on Opportunity(before insert,after insert,before update,after update,before delete, after delete){
if (Trigger.isBefore){
if (Trigger.isInsert){}
if(Trigger.isUpdate){
//WinningOppChecker checker = new WinningOppChecker(Trigger.oldMap,Trigger.newMap);
//checker.CheckWinningOpps();
}

}

}
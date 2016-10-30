Trigger CaseLimit on Case (before update, before insert){
Set<ID> ABCSet = new Set<ID>();
CaseLimit  CLU = new CaseLimit(Trigger.newMap,Trigger.oldMap,Trigger.new);
CLU.CaseLimitMethod(Trigger.new);
//CLU.PutReturnValue();


}
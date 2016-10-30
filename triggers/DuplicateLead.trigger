Trigger DuplicateLead on Lead (before insert,before update){
DuplicateCheck  DC = new DuplicateCheck(Trigger.oldmap,trigger.newmap,trigger.new);
DC.CheckDuplicateMethod();
}
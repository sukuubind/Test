Trigger EmailToUser on Case (before update,before insert){
EmailToUserMap  EM = new EmailToUserMap(Trigger.oldmap,Trigger.newmap,Trigger.new);
EM.EmailToUserMapMethod();
}
Trigger UpdateRListFromMasterAndMasterFromRList on Account(before update, before insert,after update, after insert, before delete, after delete){
if (Trigger.IsUpdate){
if (Trigger.IsBefore){
 UpdateRListFromMasterAndMasterFromRList RL = new  UpdateRListFromMasterAndMasterFromRList(Trigger.oldMap,Trigger.newMap,Trigger.new);
 RL.RivalMethodAll();
 //ReturnMethod  R = new ReturnMethod();
// R.ReturnMeth( 'God is Greatest');
// RL.RivalMethodBeforeUpdate();
 }
if(Trigger.IsAfter){
UpdateRListFromMasterAndMasterFromRList RL = new  UpdateRListFromMasterAndMasterFromRList(Trigger.oldMap,Trigger.newMap,Trigger.new);
 //RL.RivalMethodAll();
 RL.RivalMethodBeforeUpdate();

}
}
if(Trigger.isInsert){}
if(Trigger.isDelete){}
}
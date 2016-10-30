Trigger SpecialLeadConvertToMember on Lead (Before update){
SpecialLeadConvertToMember  SCM = new SpecialLeadConvertToMember(Trigger.oldMap,Trigger.newMap,Trigger.new);
SCM.ConvertToMember();
SCM.ReturnMember();

}
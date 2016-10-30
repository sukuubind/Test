Trigger duplicateCheckonEmail on Contact (before update, before insert) {
// Testing done on 05_26
Map<id,Contact> OpptyList = new Map<id,Contact>();
for (integer i=0; i<trigger.new.size(); i++)
{
if((trigger.new[i].Email != null && Trigger.old[i].Email != null) && (Trigger.new[i].Email == Trigger.old[i].Email )){
trigger.new[i].Email.addError('There is a duplicate email existing ');
}
}}
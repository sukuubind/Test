trigger UpdateLastOutreachOnAccount on case (
    before insert,
    before update,
    before delete,
    after insert,
    after update,
    after delete,
    after undelete) {

        if (Trigger.isBefore) {
            //call your handler.before method

        } else if (Trigger.isAfter && Trigger.isInsert) {
            UpdateLastOutreachOnAccount.updateOutreachOnAccountMethod(Trigger.new,Trigger.newMap,Trigger.old,Trigger.oldMap);

        }
}
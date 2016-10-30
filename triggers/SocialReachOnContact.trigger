trigger SocialReachOnContact on Contact (
    before insert,
    before update,
    before delete,
    after insert,
    after update,
    after delete,
    after undelete) {

        if (Trigger.isAfter && Trigger.isUpdate) {
            //call your handler.before method
            SocialReach.updateAccountWithSocialReachUpdate(Trigger.new,Trigger.newMap,Trigger.old, Trigger.oldMap);

        } else if (Trigger.isAfter && Trigger.isInsert) {
            //call handler.after method
            SocialReach.updateAccountWithSocialReach(Trigger.new,Trigger.newMap,Trigger.old, Trigger.oldMap);

        }
}
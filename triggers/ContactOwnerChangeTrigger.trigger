trigger ContactOwnerChangeTrigger on Contact (
    before insert,
    before update,
    before delete,
    after insert,
    after update,
    after delete,
    after undelete) {

        if (Trigger.isBefore) {
            //call your handler.before method

        } else if (Trigger.isAfter && Trigger.isUpdate) {
            //call handler.after method
            ProgramFlowExperiment ple = new ProgramFlowExperiment();
            ple.HandleContactUpdateTrigger(Trigger.new, Trigger.newMap, Trigger.old, Trigger.oldMap);

        }
}
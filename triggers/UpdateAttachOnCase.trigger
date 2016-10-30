trigger UpdateAttachOnCase on Attachment (after insert,after delete) {
    if(trigger.isAfter && trigger.isInsert )
    {
        UpdateCaseOnAttachment.UpdateCaseOnAttachmentMethod(trigger.new,trigger.newMap,trigger.old,trigger.oldMap);
    }
    if(trigger.isAfter && trigger.isDelete)
    {
        UpdateCaseOnAttachment.updateCaseOnAttachmentMethodOnDelete(trigger.new,trigger.newMap,trigger.old,trigger.oldMap);
        }

}
trigger UpdateContactFromTestOnContact on TestOnContacts__c (
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
	    	//call handler.after method
	    	UpdateContactFromTestOnContact.updateContact(Trigger.new,Trigger.newMap,Trigger.old,Trigger.oldMap);

		}
}
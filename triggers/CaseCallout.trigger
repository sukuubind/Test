trigger CaseCallout on Case (after insert) {

    for (Case a : Trigger.new) {
        // make the asynchronous web service callout
        WebServiceCallout.sendNotification(a.Origin, a.Status,a.ID);
    }

}
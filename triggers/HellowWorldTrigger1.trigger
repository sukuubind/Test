Trigger HellowWorldTrigger1 on Book__c (before insert,before update) {

Book__c [] books = Trigger.new;
MyHelloWorld2.applyDiscount(books);
}
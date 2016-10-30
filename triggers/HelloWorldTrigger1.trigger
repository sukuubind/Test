Trigger HelloWorldTrigger1 on Mags__c (before insert) {
Mags__c [] Books = Trigger.new;
MyHelloWorld1.applyDiscount1(Books);
}
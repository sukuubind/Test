/**
 * Created by sukumar on 11/1/2016.
 */

@IsTest
private class TestClassInIntellij {
    static testMethod void testBehavior() {

        Account a = new Account();
        a.Name = 'Test';
        insert a;

        Rival__c r = new Rival__c();
        r.Amount__c = 200;
        r.Account__c = a.Id;
        insert r;
        System.debug('Account R is ' + r);
        Rival__c r1 = new Rival__c();
        r1.Amount__c = 200;
        r1.Account__c = a.Id;
        insert r1;

        a.Industry = 'Agriculture';
        update a;
        List<Account> aList = [Select Id from Account Where Rival_Total__c = 2];
        System.assertEquals(aList.size(),1);

    }
}
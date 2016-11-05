/**
 * Created by sukumar on 11/2/2016.
 */

@IsTest
private class CaseLimitOne_Test {
    static testMethod void testBehavior() {


        Profile p = [SELECT Id FROM Profile WHERE Name = 'Standard User'];
        User u = new User(Alias = 'standt' , Email = 'standarduser@testorg.com' ,
                EmailEncodingKey = 'UTF-8' , LastName = 'Testing123' , LanguageLocaleKey = 'en_US' ,
                LocaleSidKey = 'en_US' , ProfileId = p.Id , UserIsSpecial__c = true ,
                TimeZoneSidKey = 'America/Los_Angeles' , UserName = 'standarduserTestUser@testorg.com');
        insert u;

        User_Limit__c ulimit = new User_Limit__c();
        ulimit.User_ID__c = u.Id;
        ulimit.Limit__c = 2;
        ulimit.Name = u.LastName;
        insert ulimit;

        System.debug('ulimit ' + ulimit);
        System.RunAs(u) {
            List<Case> caseList = new List<Case>();
            for (integer i = 0; i <= 3; i++) {
                Case c = new Case();
                c.OwnerId = u.Id;
                c.Origin = 'Web';
                c.status = 'New';
                caseList.add(c);
            }

            insert caseList;
            List<Case> cList = [Select Id from Case Where OwnerId = :u.Id];
           // System.assertEquals(cList.size() , 0);

            Case nc = new Case();
            nc.OwnerId = u.Id;
            nc.Origin = 'Web';
            nc.status = 'New';
            insert nc;

            List<Case> cList1 = [Select Id from Case Where OwnerId = :u.Id];
           // System.assertEquals(cList1.size() , 0);

        }
    }
}
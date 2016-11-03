/**
 * Created by sukumar on 11/2/2016.
 */

/**
 * Created by sukumar on 11/1/2016.
 */

public with sharing class ClassInIntellij {
    // Define variables
    List<Account> newList;
    Map<Id, Account> newMap;
    List<Account> oldList;
    Map<Id, Account> oldMap;

    // Constructor which will create an object from the class definition
    public ClassInIntellij(List<Account> newList, Map<Id, Account> newMap, List<Account> oldList, Map<Id, Account> oldMap) {
        // Assign variables
        this.newList = newList;
        this.oldList = oldList;
        this.newMap = newMap;
        this.oldMap = oldMap;
    }

    public Static Map<Id,Rival__c> updateAccountFromRival(List<Account> newList,Map<Id,Account> newMap,List<Account> oldList,Map<Id,Account> oldMap)
    {
        // Identify the records to be processed
        Set<Id> accountSetId = new Set<Id>();

        for(Account a : newMap.values())
        {
            // if(oldMap.get(Id).Industry != a.Industry)
            // {
            accountSetId.add(a.Id);
            //}
        }


        Map<Id,Integer> rivalCountMap = new Map<Id,Integer>();
        Map<Id,Decimal> totalAmountMap = new Map<Id,Decimal>();

        for(AggregateResult result : [Select count(Id),Sum(Amount__c),Account__c from Rival__c Where Account__c IN:  accountSetId group by Account__c])
        {
            rivalCountMap.put((Id) result.get('Account__c'), (Integer) result.get('Expr0'));
            totalAmountMap.put((Id) result.get('Account__c'), (Decimal) result.get('Expr1'));
        }


        for(Id actId : accountSetId)
        {
            Account a = newMap.get(actId);
            if(oldMap.get(a.Id).Amount__c != totalAmountMap.get(a.Id))
                a.Amount__c = totalAmountMap.get(a.Id);
            // if(oldMap.get(a.Id).Rival_Total__c != rivalCountMap.get(a.Id))
            a.Rival_Total__c = rivalCountMap.get(a.Id);
        }

        return null;

    }
}
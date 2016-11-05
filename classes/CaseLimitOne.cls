/**
* Created by sukumar on 11/2/2016.
*/

public class CaseLimitOne {
    // Assign variables
    List<Case> newList;
    Map<Id , Case> newMap;
    List<Case> oldList;
    Map<Id , Case> oldMap;

    public CaseLimitOne() {
        this.newList = newList;
        this.newMap = newMap;
        this.oldList = oldList;
        this.oldMap = oldMap;

    }

    public Static Map<Id , Case> caseLimit(List<Case> newList , Map<Id , Case> newMap , List<Case> oldList , Map<Id , Case> oldMap) {
        String userName = userInfo.getName();
        Integer maxCases;
        User_Limit__c  settings = User_Limit__c.getInstance(UserName);
        if(settings != null){
            maxCases = Integer.ValueOF(settings.Limit__c);
        }

      System.debug('maxCases is ############ ' + maxCases);
        // Identify the records to be processed

        Set<Id> caseOwnerSetId = new Set<Id>();
        Set<Id> caseSetId = new Set<Id>();
        for (Case c : newMap.values()) {
            if (c.OwnerId != null)
                caseOwnerSetId.add(c.OwnerId);
            caseSetId.add(c.Id);
        }

        Map<Id , Integer> caseCountMap = new Map<Id , Integer>();
        for (AggregateResult result : [Select count(Id) , OwnerId from Case Where OwnerId IN:caseOwnerSetId and CreatedDate = THIS_MONTH group by OwnerId]) {
            caseCountMap.put((Id) result.get('OwnerId') , (Integer) result.get('Expr0'));
        }

        Map<Id , List<User>> userMap = new Map<Id , List<User>>();
        for (List<User> userList : [Select Id , Name from User Where ID IN:caseOwnerSetId]) {
            for (User u : userList) {
                if (userMap.containsKey(u.Id)) {
                    userMap.get(u.Id).add(u);
                } else {
                    List<User> userList1 = new List<User>();
                    userList1.add(u);
                    userMap.put(u.Id , userList1);
                }
            }
        }

        for (Id cId : caseSetId) {
            Case c = newMap.get(cId);
            if (maxCases < caseCountMap.get(c.OwnerId)) {
                c.addError('The user ' + userMap.get(c.OwnerId)[0].Name + 'has completed ' + maxCases);
            }
        }

        return null;
    }
}
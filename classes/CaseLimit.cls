public class CaseLimit{
    //Define variables
    Map<ID,Case> OldCasesMap;
    Map<ID,Case> NewCasesMap;
    List<Case> NewCasesList;
    List<Case> NewCasesListMethod;
    Integer MaxCases;

    // Constructor that will create an object from the class and also expect new and old values from the trigger
    public CaseLimit(Map<ID,Case> OldCasesTriggerMap,Map<ID,Case> NewCasesTriggerMap,List<Case> NewCasesTriggerList){
        // Assign value to variables
        OldCasesMap = OldCasesTriggerMap;
        NewCasesMap = NewCasesTriggerMap;
        NewCasesList = NewCasesTriggerList;
    }

    public List<Case> CaseLimitMethod(List<Case> NewCasesTriggerListMethod){
NewCasesListMethod = NewCasesTriggerListMethod;
set<ID> OwnerSetID = new Set<ID>();
Map<ID,Integer> CaseCountMap = new Map<ID,Integer>();
String UserName = UserInfo.getName();
User_Limit__c  settings = User_Limit__c.getInstance(UserName);
if(settings != null){
    MaxCases = Integer.ValueOF(settings.Limit__c);
    }

    for(Case NewCase : NewCasesListMethod){
        if(NewCase.ownerid != null){
OwnerSetID.add(NewCase.ownerid);
        }
    }

for (AggregateResult result : [Select count(ID),ownerid from Case where ownerid IN: OwnerSetID and CreatedDate = THIS_MONTH group by ownerid]){
    CaseCountMap.put((ID) result.get('ownerid'),(Integer) result.get('Expr0'));
}

Map<ID,User> UserMap = new Map<ID,User>();
for (List<User> PotentialUsers : [Select ID,Name from User where ID IN: OwnerSetID]){
    for(User U : PotentialUsers){
        UserMap.put(U.ID,U);
    }
}

for (Case NewCase : NewCasesListMethod){
    if(MaxCases < CaseCountMap.get(NewCase.ownerid)){
        NewCase.addError('The User ' + UserMap.get(NewCase.ownerid).name + ' has completed his quota of ' + MaxCases + 'for this month');

    }
}
return NewCasesListMethod;
}

}
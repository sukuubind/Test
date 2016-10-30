public class  CaseLimitOnUser{
    // Define variables
Map<ID,Case> OldCasesMap;
Map<ID,Case> NewCasesMap;
List<Case> NewCasesList;
Integer MaxCases;
    Set<ID> CaseSetID = new Set<ID>();
    Map<ID,Integer> CaseCountMap = new Map<ID,Integer>();
// Constructor that will create an object from the class and also expect new and old values from the trigger that is calling the class
public CaseLimitOnUser(Map<ID,Case> OldCasesTriggerMap,Map<ID,Case> NewCasesTriggerMap, List<Case> NewCasesTriggerList){
    // Assign value to variables
    OldCasesMap = OldCasesTriggerMap;
    NewCasesMap = NewCasesTriggerMap;
    NewCasesList = NewCasesTriggerList;
    
}

// Main methods here

public string CaseLimitMainMethod(){
    
String UserName = userinfo.getName();

User_Limit__c  settings =  User_Limit__c.getValues(UserName);
if (settings != null){
MaxCases = Integer.ValueOf(settings.Limit__c);

}

for (Case  NewCase : NewCasesList){
    if(NewCase.ownerid != null ){
CaseSetID.add(NewCase.ownerid);
    }
}
for (AggregateResult  result  :  [Select count(id),ownerid from Case where ownerid IN: CaseSetID  and CreatedDate = THIS_MONTH  group by ownerid]){
    CaseCountMap.put((id) result.get('ownerid'), (Integer) result.get('Expr0'));
}

List<User> PotentialUsers = [Select id,name from User where id IN: CaseSetID];
Map<ID,User> UserMap = new Map<ID,User>();
for (User U : PotentialUsers){
    UserMap.put(U.id,U);
}


for (Case  NewCase : NewCasesList){
    if (MaxCases < CaseCountMap.get(NewCase.ownerid)){
    NewCase.addError('The total no. of case limit of ' + MaxCases + ' for user '+ UserMap.get(NewCase.ownerid).name + 'for this month has been reache');
    }
}
String U1 = UserName;
return U1;
}

public void PutReturnValue(){
    for (Case NewCase : NewCasesList){
    NewCase.Test__c =  CaseLimitMainMethod();
    }
}

}
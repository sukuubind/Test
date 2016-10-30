Trigger UpdateRivalsAndAccount on Account (before update, after update){
Set<ID> AccountSet = new Set<ID>();
List<Rival__c> RivalListToUpdateForUpdatingFieldsOnRival = new List<Rival__c>();
for (Account A: Trigger.new){
if (A.Email__c != null){
AccountSet.add(A.ID);

}

}

Map<ID,Decimal> RivalCountMap = new Map<ID,Decimal>();
Map<ID,Decimal> RivalAmountMap = new Map<ID,Decimal>();
if(Trigger.isBefore) {
for (AggregateResult Result : [Select Count(ID),Account__c from Rival__c where Account__c IN: AccountSet group by Account__c]){
RivalCountMap.put((ID) Result.get('Account__c'), (Decimal) Result.get('expr0'));
}

for (AggregateResult Result : [Select Sum(Amount__c),Account__c from Rival__c where Account__c IN: AccountSet group by Account__c]){
RivalAmountMap.put((ID) Result.get('Account__c'), (Decimal) Result.get('expr0'));
}

for (Account A: Trigger.new){
if (A.Email__c != null){
A.Number_of_Rivals_for_this_Account__c = RivalCountMap.get(A.ID);
A.Rival_Total__c = RivalAmountMap.get(A.ID);

}

}

}


if(Trigger.IsAfter){
List<Account> AccountListToBeUserForIteratingOverTheRelatedList = [Select ID,Name,Rival_Total__c,Email__c,Number_of_Rivals_for_this_Account__c,(Select ID,Name,Account__c,Alert__c,Amount__c,Email__c,Email_Diff_From_Account_Email__c from Rival__r) from Account Where ID IN: AccountSet];

for (Account A: AccountListToBeUserForIteratingOverTheRelatedList){
if (A.Email__c != null){
for (Rival__c  RV : A.Rival__r){
if (A.Email__c != RV.Email__c){
RV.Account__c = A.ID;
RV.Email__c = A.Email__c;
RivalListToUpdateForUpdatingFieldsOnRival.add(RV);
}

}
}
Update RivalListToUpdateForUpdatingFieldsOnRival;
}}



}
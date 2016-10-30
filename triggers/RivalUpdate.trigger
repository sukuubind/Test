Trigger RivalUpdate on Account (after update){
Set<ID> UserSet = new Set<ID>();
Decimal T = 0;
Decimal F;
List<Account> ListToUpdate = new List<account>();
List<Rival__c> RivalList = new List<Rival__c>();
for (Account A: Trigger.new){
if (A.Email__c != null){
UserSet.add(A.ID);
}
}

List<Account> AccountList = [Select ID,Name,Email__c,Rival_Total__c,(Select ID,Amount__c,Email__c,Alert__c,Email_Diff_From_Account_Email__c,Account__c from Rival__r) from Account where ID IN: UserSet];
for (Account A: AccountList){
//if (A.Email__c != null){

for (Rival__c RV : A.Rival__r){


RV.account__c = A.ID;
//RV.ID = A.Rivals__r.id;
RV.email__c = A.Email__c;
RV.alert__c = 'Red';
T =  T + RV.Amount__c;
 F = T ;
 

RivalList.add(RV);

}
}

update RivalList;

}
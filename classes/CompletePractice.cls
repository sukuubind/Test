// Custom settings -- It will show the limit of Rivals that can be created by any user 
// if will also create a new Contact for each Rival when created and the rival amount is more than 10000

public class  CompletePractice{
// Assign variables which will accept the Trigger.oldMap,Trigger.newMap,Trigger.new from the Trigger
Map<ID,Account> OldAcctsMap;
Map<ID,Account> NewAcctsMap;
List<Account> NewAcctsList;
Set<ID> UserIDSet = new Set<ID>();
Set<ID> AccountIDSet = new Set<ID>();
Map<ID,Decimal> RivalCountMap = new Map<ID,Decimal>();
Map<ID,Decimal> TotalAmountMap = new Map<ID,Decimal>();

// Create a constructor to expect Old and New Records(Old and New Map and List) from the Trigger

public CompletePractice(Map<ID,Account> OldAcctsTriggerMap , Map<ID,Account> NewAcctsTriggerMap, List<Account> NewAcctsTriggerList){
// Assign values to the variables
OldAcctsMap = OldAcctsTriggerMap;
NewAcctsMap = NewAcctsTriggerMap;
NewAcctsList = NewAcctsTriggerList;

}
// Main Methods

// Method for putting all the ID for trigger.new in a Sets

public void PutIDInSetForUser(){
for (Account A: NewAcctsList){
if (A.ownerid != null){
UserIDSet.add(A.ownerID);
AccountIDSet.add(A.ID);
}
}
}

// Method for updating the Account object from the values from Rival records

// We will get the count of the no. of Rivals for the Account

public void UpdateAccountFromRivalBeforeUpdate(){
for (AggregateResult result :[Select count(id), Account__c from Rival__c where Account__c IN: AccountIDSet group by Account__c]){
RivalCountMap.put((ID) result.get('Account__c'), (Decimal) result.get('expr0'));
}

// Get the Total Amount on all the Rivals related list for the Account

for (AggregateResult result :[Select sum(Amount__c), Account__c from Rival__c where Account__c IN: AccountIDSet group by Account__c]){
TotalAmountMap.put((ID) result.get('Account__c'), (Decimal) result.get('expr0'));
}

// Iterate over the object and change get the values

for (Account A: NewAcctsList){
A.Number_of_Rivals_for_this_Account__c = RivalCountMap.get(A.ID);
A.Rival_Total__c = TotalAmountMap.get(A.ID);
}
}

// This method will update the Account changes to all the values in the Related lists

public void UpdateRivalsFromAccountAfterUpdate(){
Set<ID> EmailIDSet = new Set<ID>();
for (Account A: NewAcctsList){
if (A.Email__c != null){
EmailIDSet.add(A.ID);
}
}
List<Test_Without_Lookup__c> TestToUpdate = new List<Test_Without_Lookup__c>();
List<Rival__c> RivalListToUpdate = new List<Rival__c>();
List<Account> AccountList = [Select ID,Email__c,(Select ID,Email__c,Account__c from Rival__r) from Account where ID IN: EmailIDSet];
for (Account A :AccountList){
if(A.Email__c != null){
for (Rival__c RV: A.Rival__r){
if(A.Email__c != RV.Email__c){
RV.Email__c = A.Email__c;
RV.Account__c = A.ID;

Test_Without_Lookup__c  TWLC = new Test_Without_Lookup__c();
TWLC.Text__c = 'I have been created thru a code in UpdateRivalsFromAccount';
TWLC.Name = 'Gods';
TestToUpdate.add(TWLC);

RivalListToUpdate.add(RV);
}
}

}

}
update RivalListToUpdate;
insert TestToUpdate;
}

// This method will create a new Test_Without_Lookup__c if the amount in Account is > 10000

public void CreateTestWithoutLookupFromAccountAfterUpdate (){
List<Test_Without_Lookup__c> TestToUpdate = new List<Test_Without_Lookup__c>();

for (Account  A: NewAcctsList){
if (A.Amount__c > 10000){
Account OldAccount = OldAcctsMap.get(A.ID);
Decimal OldAmount = OldAccount.Amount__c;
Decimal NewAmount = A.Amount__c;
if(NewAmount != OldAmount) {
Test_Without_Lookup__c  TWLC = new Test_Without_Lookup__c();
TWLC.Text__c = 'I have been created thru a code in CreateTestWithoutLookupFromAccountAfterUpdate';
TWLC.Name = 'God';
TestToUpdate.add(TWLC);
}}
insert TestToUpdate;
}}

}
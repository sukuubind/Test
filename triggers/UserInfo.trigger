Trigger UserInfo on User (before update,before insert){

Set<String> UNameSet = new Set<String>();
for (User U : Trigger.new){
If(U.FirstName != null ){
UNameSet.add(U.FirstName);
}
}
List<User> PotentialUsers = [Select ID,FirstName from User];
Map<String,User> UserMap = new Map<String,User>();

for (User U : PotentialUsers){
UserMap.put(U.FirstName,U);
}

for (User U : Trigger.new){
if(U.FirstName != null){
User Creator = UserMap.get(U.FirstName);
if(Creator != null) {
U.User_ID__c = Creator.id;
}}
}
}
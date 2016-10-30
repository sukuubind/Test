Trigger DuplicateCheck on Contact(before insert,before update){
// new lines added to check if the code is still the same.
Set<ID> ContactSetID = new Set<ID>();
Set<String> EmailSet = new Set<string>();
for (Contact C: Trigger.new){
if (C.Email != null){
EmailSet.add(C.Email);
}
}

List<Contact> PotentialContacts = [Select id,email from contact where Email IN: EmailSet];

Map<String,Contact> EmailMap = new Map<String,Contact>();

for (Contact C : PotentialContacts){
EmailMap.put(C.Email,C);
}

for (Contact C: Trigger.new){
if (C.Email != null){
Contact Creator = EmailMap.get(C.Email);
if (Creator != null){
C.AddError('this email already exists');
}}

}
}
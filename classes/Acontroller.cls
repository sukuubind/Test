public class Acontroller {
public Account acct {get;set;}
public string sortOrder = 'Name';

public Acontroller(){

String acctid = apexPages.currentPage().getParameters().get('id');
acct = [Select Id,Name,ownerid,rating from account where ID =: acctid];

}

public List<Opportunity> childOpps{

get
{
if (childOpps == null){
childOpps = [Select ID,Name,StageName,CloseDate,ownerid,isClosed,amount from Opportunity where accountid =: acct.id ORDER BY  Name     ASC  ];
}
return childOpps;
}
Set;
}

public void CreateTaskOnchildOpps(){
List<Task> TaskList = new List<Task>();
for (Opportunity opp : childOpps){
if(!opp.isClosed){
Task T = new Task();
T.WhatID = opp.id;
T.ownerid = opp.ownerid;
T.ActivityDate = Date.today() + 3;
T.Status = 'Not Started';
T.Subject = 'Send a follup email thru CreateTaskOnChildOpps Method';
Tasklist.add(T);
}}
insert Tasklist;
}

public void remove(){
List<Opportunity> OpptyToRemove = new List<Opportunity>();
for (Opportunity opp: childOpps){
if(!opp.isclosed){
OpptyToRemove.add(opp);
}}
Delete OpptyToRemove;
}


public void CreateMemberOne(){
List<Member__c> MemberList = new List<Member__c>();
for (Opportunity opp : childOpps){
if(!opp.isClosed ){
Member__c M = new Member__c();
M.Email__c = 'AAA@email.com';
M.Name__c = ' CreateMember method';
Memberlist.add(M);
}}
insert Memberlist;
}




public PageReference save()

{
if(acct.rating == 'Hot'){
CreateTaskOnchildOpps();
}
else 

if(acct.rating == 'Warm'){
CreateMemberOne();
}

update acct;
return new PageReference('/' + acct.id);}

public PageReference nowremove()
{
remove();
update acct;
return new PageReference('/' + acct.id);
}



}
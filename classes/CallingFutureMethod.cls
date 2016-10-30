public class CallingFutureMethod {
//define variables
Map<ID,Account> OldAcctsMap;
Map<ID,Account> NewAcctsMap;
List<Account> NewAcctsList;
Map<ID,Decimal> ContactCountMap = new Map<ID,Decimal>();
Set<ID> AccountSetID ;
// Constructor 
public CallingFutureMethod(Set<ID> AccountSet){

AccountSetID = AccountSet;
}
public void CallMethod(){
FutureMethodClass.ProcessfutureMethod(AccountSetID);
}}
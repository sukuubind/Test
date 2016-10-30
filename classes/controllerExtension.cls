public class controllerExtension {
private final Account acct;
Integer A = 1;
Integer B = 2;
Integer Total;
    public controllerExtension(ApexPages.StandardController stdController) {
this.acct = (Account)stdController.getRecord();
    }
public String getGreeting(){

return 'Hello ' + acct.name + '(' + acct.id + ')';
}

public String getCalculate(){
Total = A + B;
return 'Hello ' + acct.name + '(' + acct.id + ')' + 'Total' + String.Valueof(Total);
}

}
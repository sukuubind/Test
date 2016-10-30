public with sharing class ActionParameterController1
{
    //the id of the opportunity to close is sent from the page as parameter to the winOppaction method
    public Id oppIdToWin{get;set;}

    // constructor - retrieves the first 50 opportunities

public list<Opportunity> getOpps() {
    return[Select ID,Name,StageName,CloseDate,Amount,owner.name,account.name,type from Opportunity limit 50];

}

// Updates the selected Opportunity to Closed won
public PageReference winOpp() {
    
    Opportunity opp = new Opportunity(ID=oppIdToWin,StageName='Closed Won');
    update opp;
    return null;
}

public PageReference ChangeClosedate() {
    
    Opportunity opp = new Opportunity(ID=oppIdToWin,CloseDate=Date.today());
    update opp;
    return null;
}



}
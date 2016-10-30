public  class CachedData {

    public static Map<Id,Opportunity> allOpportunityCachedMap ;
	public static Map<Id,Opportunity> returnOpportunityMap()
	{
       if(allOpportunityCachedMap == null)
       {
       	allOpportunityCachedMap = new Map<Id,Opportunity>([Select Id,StageName,AccountId from Opportunity]);
       }
       return allOpportunityCachedMap;
	}
}
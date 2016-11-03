global class AngularSearch {

	global static string getAccounts()
	{
		return JSON.serialize([Select Id,Name,Rating,Industry from Account]);
	}

 // Testing if this goes to source tree
	global static string getOpportunities()
	{
		return JSON.serialize([Select Id,Name,StageName from Opportunity]);
	}


	global static string getCases()
	{
		return JSON.serialize([Select Id,Status,Priority,Contact.Name,Account.Name from Case]);
	}

	global static List<Opportunity> getOpportunitiesWithAccount()
	{
		return [Select Id,Name,StageName,AccountId from Opportunity];
	}
}
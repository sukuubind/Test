global class AccountQueryHandler {
	global static Map<Id, Account> allAccountMap {
		//Added comment to check github
		get
		{
			if (allAccountMap == null)
				allAccountMap= new Map<Id, Account> ([SELECT Id,name,Industry,AnnualRevenue,site,ownerid,fax,parentid,rating,shippingAddress,type, (SELECT AccountID, ownerid,Email,	HasOptedOutOfEmail,Description, Birthdate FROM contacts ) FROM Account ]);

			System.debug('allAdvisorAssignmentProfileMap size is @@@@@@@@@ ' + allAccountMap.size());
			    System.debug('allAdvisorAssignmentProfileMap is @@@@@@@@@ ' + allAccountMap);

			return allAccountMap;
		}
		private set;
	}




	global static Map<Id,Account>allAccountOwnwerAsIdMap
	{
		get
		{
			if (allAccountOwnwerAsIdMap == null)
			                                                        {

				allAccountOwnwerAsIdMap  = new Map<Id,Account> ();

				for (Account AccountProfile : allAccountOwnwerAsIdMap.values())
				                        {
					if (String.isNotBlank(AccountProfile.ownerid))
						allAccountOwnwerAsIdMap.put(AccountProfile.ownerid, AccountProfile);

				}
			}
			return allAccountOwnwerAsIdMap;
		}
		            private set;
	}

}
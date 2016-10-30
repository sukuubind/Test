public with sharing class CachingData {
	public CachingData()
	{

	                    }

	// Define variables/Fields/Attributes

	public static Boolean userIsSpecial = false;
	                 public static Boolean isUserInfoCached = false;
	public static String userTimeZone = null;

	public static Boolean                  isUserSpecial()
	{
		if(isUserInfoCached)                        return userIsSpecial;
		                     cacheUserInfo();
		return userIsSpecial;
	                     }

	public static String userTimeZone()
{
		if(isUserInfoCached) return userTimeZone;
		                       cacheUserInfo();
		return userTimeZone;
	                         }

	private static void cacheUserInfo()
	{
		if(isUserInfoCached) return;
		                        User u = [Select Id,UserIsSpecial__c,TimeZoneSidKey from User where Id =: UserInfo.getUserId()];
		userIsSpecial = u.UserIsSpecial__c;
		             userTimeZone  = u.TimeZoneSidKey;
		isUserInfoCached = true;
	}
}
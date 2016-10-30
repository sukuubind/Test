/*
    @Author: Mohammad Usman
    @Description: Class is used to get Authentication of salesforce
    @version:1.0
*/
public with sharing class AuthenticationDetail{
    /*End point Url to web service callout*/
    private final static String ENP_POINT_URL = 'https://login.salesforce.com/services/oauth2/token';
    //For development and production https://login.salesforce.com/services/oauth2/token
    //And for sandbox https://test.salesforce.com/services/oauth2/token
    private final static String REQUEST_BODY = 'grant_type=password&client_id={0}&client_secret={1}&username={2}&password={3}';
    private final static String USERNAME = 'sukubind@hotmail.com';
    private final static String PASSWORD = 'Password008ez6KE00IV8ZiSYuEkjyJFk1iG';
    private final static String CONSUMER_KEY = '3MVG9fMtCkV6eLhcuRu3bYsMLN8AtAjacqPJc947aq1Dm_diGjsqPReA5IrxVpWaywbjRWq3VcLzJzZp3w1a9';
    private final static String CONSUMER_SECRET = '8007237883993367578';
    
    /*To generate Access token Method*/
    private static OAuth getAccessToken(){
        try{
            HttpRequest req = new HttpRequest();
            req.setEndpoint(ENP_POINT_URL);
            req.setMethod('POST');          
            Blob headerValue = Blob.valueOf(USERNAME + ':' + PASSWORD);
            String authorizationHeader = 'BASIC ' +
            EncodingUtil.base64Encode(headerValue);
            req.setHeader('Authorization', authorizationHeader); 
            req.setBody(String.format(REQUEST_BODY ,new string[]{CONSUMER_KEY,CONSUMER_SECRET,
                                                                 USERNAME,PASSWORD}));
            req.setTimeout(60000);
            Http http = new Http();
            HttpResponse res = http.send(req);
            OAuth objAuthenticationInfo = (OAuth)JSON.deserialize(res.getbody(), OAuth.class);
            return objAuthenticationInfo;
        }catch(CallOutException ce){
            throw ce;
        }
        return null;
    }
    
    /*To get Access token property*/
    public static OAuth authenticationDetail{
        get{
            if(authenticationDetail == null){
                authenticationDetail = getAccessToken();
            }
            return authenticationDetail;
        }set;
    }
        
    /*To get aouthentication detail Wrapper*/
    public class OAuth{
        public String id{get;set;}
        public String issued_at{get;set;}
        public String instance_url{get;set;}
        public String signature{get;set;}
        public String access_token{get;set;}    
    }   
}
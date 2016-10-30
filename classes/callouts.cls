public   class callouts {
public static string callRest_GET(){
Http ht = new Http();
HttpRequest req = new HttpRequest();
req.setMethod('GET');
req.setTimeout(120000);
//No body for GET
//req.setBody();
//req.setBodyAsBlob(blob body);
req.setEndpoint('https://na16.salesforce.com/services/apexrest/CherwellCaseIntegration/500j00000058Alq');
//We don't need any special headers
//req.setHeader(String key, String value);
HttpResponse res = new HttpResponse();
res = ht.send(req);
system.debug(res.getStatusCode());
system.debug(res.getHeaderKeys());
system.debug(res.getHeader('Content-Type'));
system.debug(res.getBody());
return res.getBody();
}
}
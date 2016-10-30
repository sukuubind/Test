public with sharing class ActionFunctionDemoController {

    // Define variables
    public Account cat{get;set;}
    public String message{get;set;}
    public ActionFunctionDemoController() {
        cat = new Account(name = 'Some Value',Industry = 'Agriculture');
        message = 'Saved'; // initial message;

    }

    public pageReference Save()
    {
        try {
            insert cat;
            message = 'insert successful ---- '+ cat.Id;
        } catch(Exception e) {
            ApexPages.addMessages(e);
            message = 'Whoops! An error occured ---- ' + e.getMessage();
            System.debug(e.getMessage());
        }
        return null;
    }
}
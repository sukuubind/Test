public class ContactsListController {

private String sortOrder = 'LastName';

public list<Contact> getContacts(){

List<Contact> results = Database.query('Select ID,FirstName,lastName,Email,title from Contact where Email != null ORDER BY ' + sortOrder + ' ASC ');
return results;

}

public void sortByFirstName(){
this.sortOrder = 'FirstName';
}

public void sortByLastName(){
this.sortOrder = 'LastName';
}
}
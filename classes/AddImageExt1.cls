public with sharing class AddImageExt1{
// define variables

public attachment att{get;set;}
// id of the record that will parent the id

private id parentID {get;set;}

// constructor
public AddImageExt1(ApexPages.StandardController std){

att = new Attachment();
parentID = std.getId();

}

// action method to save the attachment

public void uploadImage(){

att.parentid = parentID;
att.name = 'image';
insert att;
att = new Attachment();

}
// get the id of the latest attachment with the name of the image

public ID getImageID(){
Id result = null;
List<Attachment> images = [Select id from Attachment where name = 'image' and parentid =: parentiD order by createddate desc];
if (images.size() > 0){
result = images[0].id;

}

return result;
}


}
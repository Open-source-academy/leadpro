// JScript source code



$(document).ready(function() {
 //global variables
 var form = $("#form1");

 var name = $("#nametxt"); //textbox u are going to validate
 var nameInfo = $("#namemsg"); //to display error message
 
 
 
 //first validation on form submit
 form.submit(function() {
 // validation begin before submit
 if (validateName())
 {
 return true;
 } 
 else
 { 
	 return false; 
	 }

 });

 //declare name validation function
 function validateName() {
 //validation for empty
 if (name.val() == "" ) {
 name.addClass("error");
 nameInfo.text("Names cannot be empty!");
  nameInfo.addClass("msg");
 return false;
 } else {
 name.removeClass("error");
 nameInfo.text("*");
 nameInfo.removeClass("msg");
 }

 //if it's NOT valid
 if (name.val().length < 2) {
 name.addClass("error");
 nameInfo.text("Names with more than 2 letters!");
 nameInfo.addClass("msg");
 return false;
 }
 //if it's valid
 else {
 name.removeClass("error");
 nameInfo.text("*");
 nameInfo.removeClass("msg");
 }
 
 
 } 
});
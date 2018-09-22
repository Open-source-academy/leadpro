var httpObject = null;

    // Get the HTTP Object
    function getHTTPObject(){
	
	if (window.ActiveXObject) return new ActiveXObject("Microsoft.XMLHTTP");
    else if (window.XMLHttpRequest) return new XMLHttpRequest();
    else {
    alert("Your browser does not support AJAX.");
    return null;
    }
    }

function chk()
{
var f=document.forms["regForm"];
if(f.IName.value=="" || f.IName.value==null)
{
document.getElementById('InstituteName').innerHTML="<lable style='color:red;'> * Enter Email Id</lable>";
   return false;
}
else
{
document.getElementById('InstituteName').innerHTML="";
   return true;
}

}

/*function compare()
{
	var pass1=document.registration.password.value;
	var pass2=document.registration.Cpassword.value;
	
	if(pass1!=pass2)
		{
		alert("Please Check the PassWord");
		}
	return false;
	
}


function validate()
{
	
}*/
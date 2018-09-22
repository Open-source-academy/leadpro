  var xmlHttp  
      var xmlHttp
      function showState(str)
      {
      if (typeof XMLHttpRequest != "undefined")
      {
      xmlHttp= new XMLHttpRequest();
      }
      else if (window.ActiveXObject){
      xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
      }
      if (xmlHttp==null){
      alert("Browser does not support XMLHTTP Request")
      return;
      } 
      
      var url="getProductDetailScriptPage.jsp";
      url +="?table=" +str;
      xmlHttp.onreadystatechange = stateChange;
      xmlHttp.open("GET", url, true);
      xmlHttp.send(null);
      }

      function stateChange(){   
      if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
      document.getElementById("list").innerHTML=xmlHttp.responseText   
      }   
      }
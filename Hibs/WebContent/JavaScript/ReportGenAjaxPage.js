      var xmlHttp1
      function getCount()
      {
      if (typeof XMLHttpRequest != "undefined")
      {
      xmlHttp1= new XMLHttpRequest();
      }
      else if (window.ActiveXObject){
      xmlHttp1= new ActiveXObject("Microsoft.XMLHTTP");
      }
      if (xmlHttp1==null){
      alert("Browser does not support XMLHTTP Request")
      return;
      } 
      var product=document.form1.product.value;
      var date=document.form1.date.value;
      var deal=document.form1.deal.value;
      
      if(product=="")
    	  {
    	  //document.getElementById("name").style.borderColor="red";
		document.form1.product.focus();
		return false;
    	  }
      if(date=="")
    	  { 
    	  document.getElementById("datemsg").style.borderColor="red";
		document.form1.date.focus();
		return false;
    	  
    	  }
      if(deal=="")
    	  {
    	  document.getElementById("dealmsg").style.borderColor="red";
		document.form1.deal.focus();
		return false;
    	  
    	  }
      
      
      
      var url="reportGenAjax.jsp";
      url +="?product="+product+"&date="+date+"&deal="+deal;
      xmlHttp1.onreadystatechange = stateChange;
      xmlHttp1.open("GET", url, true);
      xmlHttp1.send(null);
      }

      function stateChange(){   
      if (xmlHttp1.readyState==4 || xmlHttp1.readyState=="complete"){   
      document.getElementById("report").innerHTML=xmlHttp1.responseText   
      }   
      }
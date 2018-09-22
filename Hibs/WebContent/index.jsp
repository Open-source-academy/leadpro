<html>
<head><link rel="shortcut icon" href="images/logo.ico"/>
<title>Lead Pro</title>
<script type="text/javascript" src="JavaScript/loginValidate.js"></script>
<script type="text/javascript" src="JavaScript/loginEffect.js"></script>
<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script> -->
	<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
	<script type="text/javascript" src="JavaScript/coin-slider.js"></script>

	<link rel="stylesheet" href="css/coin-slider-styles.css" type="text/css" />
<script> 
$(document).ready(function(){
  $("#flip").click(function(){
    $("#flip").hide();
$("#panel1").slideToggle("1000");
$("#panel2").slideToggle("2000");
$("#panel3").slideToggle("3000");
  });
});
</script>

<link rel="stylesheet" type="text/css" href="css/panStyle.css" media="screen" />
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
body {
	background-color: #CCCCCC;
}
.style16 {font-family: Arial, Helvetica, sans-serif; font-size: 9pt; color: #FFFFFF; }
-->
</style>
<script type="text/JavaScript">
<!--
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
</script>
<link href="css/demo.css" rel="stylesheet" type="text/css">
<link href="css/style1.css" rel="stylesheet" type="text/css">
<link href="css/reset.css" rel="stylesheet" type="text/css">
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="MM_preloadImages('images/button_04.png')">
<!-- Save for Web Slices (index.psd) -->
<table width="1007" height="372" border="0" align="center" cellpadding="0" cellspacing="0" id="Table_01" bgcolor="white">
  <tr>
    <td colspan="3"><img src="images/index_01.png" width="749" height="113" alt=""></td>
    <td width="258" valign="middle" background="images/bg_02.png" bgcolor="#1B85BC"><table width="100%" border="0">
      
      <tr>
        <td> <form name="form1" method="post" action="loginbean.jsp" onSubmit="return validate()">
         
          <table width="100%" border="0">
            

<tr><td colspan="3" align="center"><div id=flip><a class="menu_links" onClick="displayData(11,1,0,'A')" onMouseOver="" style="cursor: pointer;"> <font  color="white">Already User? Login here...!!</font> </a></div></td></tr>

<tr id="panel1">
              <td width="32%" class="style16">Email</td>
              <td width="3%"><span class="style16">:</span></td>
              <td colspan="2"><label>
                 <input name="name" placeholder="Email" type="email" id="nametxt" size="22"><br/><span id="namemsg"></span>
              </label></td>
            </tr>
            <tr id="panel2">
              <td><span class="style16">Password</span></td>
              <td><span class="style16">:</span></td>
              <td colspan="2"><label>
                <input name="password" placeholder="Password" type="password" id="password" size="22"><br/><span id="passmsg"></span>
              </label></td>
            </tr>
            <tr id="panel3">
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td width="38%"><label>
                <input type="submit" name="Submit" value="Login">
              </label></td>
              <td width="27%">&nbsp;</td>
            </tr>


          </table>
                </form>
        </td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="52" colspan="3"><img src="images/index_03.png" width="749" height="52" alt=""></td>
    <td bgcolor="#FFFFFF"><a href="registration.html" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image24','','images/button_04.png',1)"><img src="images/30day.png" name="Image24" width="251" height="52" border="0"></a></td>
  </tr>
  <tr>
    <td width="289" bgcolor="#FFFFFF">
    <div class="content">
      <ul class="ca-menu">
        <li> <a href="#">
          <div class="ca-content">
            <h2 class="ca-main">HOME</h2>
            <h3 class="ca-sub">Our Technology</h3>
          </div>
        </a></li>
        <li> <a href="#">
          <div class="ca-content">
            <h2 class="ca-main">About Us</h2>
            <h3 class="ca-sub">See How we are</h3>
          </div>
        </a></li>
        <li> <a href="#">
          <div class="ca-content">
            <h2 class="ca-main">Products</h2>
            <h3 class="ca-sub">Check our Products!</h3>
          </div>
        </a></li>
        <li> <a href="#">
          <div class="ca-content">
            <h2 class="ca-main">Developers</h2>
            <h3 class="ca-sub">Meet our Developers</h3>
          </div>
        </a></li>
        <li> <a href="#">
          <div class="ca-content">
            <h2 class="ca-main">Unconditional Support</h2>
            <h3 class="ca-sub">24/7 for you needs</h3>
          </div>
        </a></li>
      </ul>
    </div></td>
    <td width="12">&nbsp;</td>
    <td colspan="2" bgcolor="#FFFFFF">
    <!-- body --> 
    <div id="games">
		
			<a href="#" target="_blank">
				<img src="http://vectorpoint.co.uk/wp-content/uploads/2011/08/SEO-for-business-start-ups1.jpg" alt="Mini Ninjas" />
				<span>
					<h2><b>Are you a Business Developer?</b></h2><br />
					
				</span>
			</a>
			
			<a href="#" target="_blank">
				<img src="http://www.atlphp.org/wp-content/uploads/2012/12/business-to-business.jpg" alt="Spiderman: Shattered Dimensions" />
			<span>
					<h2><b>Getting worried about Business Development?</b></h2><br />
					
				</span>
			</a>
			
			<a href="#" target="_blank">
			
				
				<img src="http://venturebeat.files.wordpress.com/2012/07/shocked-computer-guy.jpeg?w=558&h=9999&crop=0" alt="Price of Persia" />
			<span>
					<h2><b>Getting worried about Large amount of Data?</b></h2><br />
					
				</span>
			</a>
			
			<a href="#" target="_blank">
				<img src="http://www.businesscomputingworld.co.uk/wp-content/uploads/2011/03/linkedin.jpg" alt="Brink" /> <!-- business lead photos from google  -->
			<span>
					<h2><b>Go LEADPRO..!</b></h2><br />
					Hibs Leads provides in-built unlimited emails and sms services for the companies to follow up leads as and when they wish.
					 The main feature of this project is report generation which can be statistical as well as graphs as per user's choice.
					
				</span>
			</a>
		
			<a href="#" target="_blank" >
				<img src="http://www.atginfo.com/wp-content/uploads/2012/05/CLOUD_READINESS.jpg" alt="God of War III" />
			<span>
			<b>Your Business in the Cloud - All Systems GO!</b>
			In the cloud, all you need is an internet browser to access that software and information remotely. That's it. Think of the power of that...
			</span>
			</a>
			
			<a href="#" target="_blank">
				<img src="http://www.hrilodging.com/resourcefiles/mainimages/contact-us-send-business-lead-top.jpg" alt="Borderlands" />
				<span>
					<b>Follow Your Customer..!</b><br />
					Get unlimited Emails and SMS to keep in touch with your Customers..!
				</span>
			</a>
			
			<a href="#" target="_blank">
				<img src="http://androidheadlines.com/images/megacloud-android-app-for-megasize-cloud-storage-and-multimedia-streaming-on-the-go_tenom_0.jpg" alt="Star Wars: The Old Republic" />
			<span>
					<b>Get instant report in your Mobile</b><br/>
					Know your business from where you are....
				</span>
			</a>
				
			<a href="#" target="_blank">
				<img src="http://cdn.business2community.com/wp-content/uploads/2012/11/b2b-sales-leads2.jpg" alt="Batman: Arkham Asylum" />
				
				<span>
					<b>Make your Business with Lead Pro</b><br/>
					Get your free version now....!
					</span>
			</a>
			
		</div>
		<script>
			$('#games').coinslider();
		</script>
    
    
    
    <!-- End of Body -->
    </td>
  </tr>
  <tr>
    <td colspan="4" bgcolor="#FFFFFF"></br></br></br></td>
  </tr>
  <tr>
    <td colspan="4" bgcolor="#0F6D9E"><br><br><br><br></td>
  </tr>
  <tr>
    <td><img src="images/spacer.gif" width="289" height="1" alt=""></td>
    <td><img src="images/spacer.gif" width="12" height="1" alt=""></td>
    <td width="448"><img src="images/spacer.gif" width="448" height="1" alt=""></td>
    <td><img src="images/spacer.gif" width="251" height="1" alt=""></td>
  </tr>
</table>
 <!-- End Save for Web Slices -->
</body>
</html>

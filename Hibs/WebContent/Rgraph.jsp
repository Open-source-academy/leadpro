<%
if(session.getAttribute("username")==null)
{
	response.sendRedirect("index.jsp");
	
}
else 
{
%>

<html>
<head><link rel="stylesheet" type="text/css" href="css/bodyBackGround.css" media="screen" />

		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<link rel="shortcut icon" href="images/logo.ico"/>
<link rel="stylesheet" type="text/css" href="css/bodyBackGround.css" media="screen" />

<title>Lead Pro:Report  </title>
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
		<script type="text/javascript">
$(function () {
    var chart;
    $(document).ready(function() {
     var day=new Array('Day1', 'Day2', 'Day3', 'Day4', 'Day5', 'Day6', 'Day7', 'Day8', 'Day9', 'Day10', 'Day11', 'Day12', 'Day13', 'Day14', 'Day15');
        chart = new Highcharts.Chart({
            chart: {
                renderTo: 'container',
                type: 'line'
            },
            title: {
                text: 'Weekly Average Leads'
            },
            subtitle: {
                text: 'Source: AbileTechnologies.com'
            },
            xAxis: {
                categories:day
            },
            yAxis: {
                title: {
                    text: 'Leads'
                }
            },
            tooltip: {
                enabled: false,
                formatter: function() {
                    return '<b>'+ this.series.name +'</b><br/>'+
                        this.x +': '+ this.y +'°C';
                }
            },
            plotOptions: {
                line: {
                    dataLabels: {
                        enabled: true
                    },
                    enableMouseTracking: false
                }
            },
            series: [{
                name: 'Enquiry',
                data: [<%=request.getParameter("txt0")%>,<%=request.getParameter("txt1")%>,<%=request.getParameter("txt2")%>,<%=request.getParameter("txt3")%>,<%=request.getParameter("txt4")%>,<%=request.getParameter("txt5")%>,<%=request.getParameter("txt6")%>,<%=request.getParameter("txt7")%>,<%=request.getParameter("txt8")%>,<%=request.getParameter("txt9")%>,<%=request.getParameter("txt10")%>,<%=request.getParameter("txt11")%>,<%=request.getParameter("txt12")%>,<%=request.getParameter("txt13")%>,<%=request.getParameter("txt14")%>]
            }, {
                name: 'Sales',
                data: [<%=request.getParameter("pur1")%>,<%=request.getParameter("pur2")%>,<%=request.getParameter("pur3")%>,<%=request.getParameter("pur4")%>,<%=request.getParameter("pur5")%>,<%=request.getParameter("pur6")%>,<%=request.getParameter("pur7")%>,<%=request.getParameter("pur8")%>,<%=request.getParameter("pur9")%>,<%=request.getParameter("pur10")%>,<%=request.getParameter("pur11")%>,<%=request.getParameter("pur12")%>,<%=request.getParameter("pur13")%>,<%=request.getParameter("pur14")%>,<%=request.getParameter("pur15")%>]//[3.9, 4.2, 5.7, 8.5, 11.9, 15.2]
            }
            , {
                name: 'Missings',
                data: [<%=request.getParameter("mis1")%>,<%=request.getParameter("mis2")%>,<%=request.getParameter("mis3")%>,<%=request.getParameter("mis4")%>,<%=request.getParameter("mis5")%>,<%=request.getParameter("mis6")%>,<%=request.getParameter("mis7")%>,<%=request.getParameter("mis8")%>,<%=request.getParameter("mis9")%>,<%=request.getParameter("mis10")%>,<%=request.getParameter("mis11")%>,<%=request.getParameter("mis12")%>,<%=request.getParameter("mis13")%>,<%=request.getParameter("mis14")%>,<%=request.getParameter("mis15")%>]//[3.9, 4.2, 5.7, 8.5, 11.9, 15.2]
            }]
        });
    });
    
});
		</script>
<script src="js/highcharts.js"></script>
<script src="js/modules/exporting.js"></script>


<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
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
</head>
<body  class="back" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="MM_preloadImages('images/layout_button_03.gif','images/layout_button_05.gif')">
<!-- Save for Web Slices (new home.psd) -->
<table  width="1001" height="713" bgcolor="white" border="0" align="center" cellpadding="0" cellspacing="0"  id="Table_01">
	<tr>
		<td colspan="5">
			<img src="images/layout_01.png" width="1000" height="155" alt="1"></td>
		<td>
			<img src="images/spacer.gif" width="1" height="155" alt=""></td>
	</tr>
	<tr>
		<td rowspan="3">
			
		<td rowspan="2"><a href="UserHome.jsp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image15','','images/layout_button_03.gif',1)"><img src="images/layout_03.gif" name="Image15" width="181" height="103" border="0"></a></td>
		<td rowspan="2">
			
		<td><a href="UserLogOut.jsp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image16','','images/layout_button_05.gif',1)"><img src="images/layout_05.gif" name="Image16" width="106" height="40" border="0"></a></td>
		<td rowspan="3">
			</td>
		<td>
			<img src="images/spacer.gif" width="1" height="40" alt="5"></td>
	</tr>
	<tr>
		<td rowspan="2">
			</td>
		<td>
			<img src="images/spacer.gif" width="1" height="63" alt="7"></td>
	</tr>
	<tr>
		<td colspan="2">
			<img src="images/layout_08.gif" width="752" height="7" alt=""></td>
		<td>
			<img src="images/spacer.gif" width="1" height="7" alt=""></td>
	</tr>
	<tr>
		<td colspan="5" valign="top">
		
		<!--- working ---->
<div id="container" style="min-width: 300px; height: 400px; margin: 0 auto"></div>

		
		</td>
		<td>
			<img src="images/spacer.gif" width="1" height="364" alt=""></td>
	</tr>
	<tr>
		<td colspan="5" bgcolor="#4E82BB"><br><br><br><br>
			</td>
		<td>
			<img src="images/spacer.gif" width="1" height="84" alt=""></td>
	</tr>
</table>
<!-- End Save for Web Slices -->
</body>
</html>
<%}%>
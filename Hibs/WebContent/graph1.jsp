<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>Highcharts Example</title>

		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
		<script type="text/javascript">
$(function () {
    var chart;
    $(document).ready(function() {
     var day=new Array('Day1', 'Day2', 'Day3', 'Day4', 'Day5', 'Day6');
        chart = new Highcharts.Chart({
            chart: {
                renderTo: 'container',
                type: 'line'
            },
            title: {
                text: 'Weekly Average Sales'
            },
            subtitle: {
                text: 'Source: AbileTechnologies.com'
            },
            xAxis: {
                categories:day
            },
            yAxis: {
                title: {
                    text: 'Sales)'
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
                data: [<%=request.getParameter("txt0")%>,<%=request.getParameter("txt1")%>,<%=request.getParameter("txt2")%>,<%=request.getParameter("txt3")%>,<%=request.getParameter("txt4")%>,<%=request.getParameter("txt5")%>]
            }, {
                name: 'Sales',
                data: [<%=request.getParameter("pur1")%>,<%=request.getParameter("pur2")%>,<%=request.getParameter("pur3")%>,<%=request.getParameter("pur4")%>,<%=request.getParameter("pur5")%>,<%=request.getParameter("pur6")%>]//[3.9, 4.2, 5.7, 8.5, 11.9, 15.2]
            }
            , {
                name: 'Missings',
                data: [<%=request.getParameter("mis1")%>,<%=request.getParameter("mis2")%>,<%=request.getParameter("mis3")%>,<%=request.getParameter("mis4")%>,<%=request.getParameter("mis5")%>,<%=request.getParameter("mis6")%>]//[3.9, 4.2, 5.7, 8.5, 11.9, 15.2]
            }]
        });
    });
    
});
		</script>
	</head>
	<body>
<script src="js/highcharts.js"></script>
<script src="js/modules/exporting.js"></script>

<div id="container" style="min-width: 400px; height: 400px; margin: 0 auto"></div>

	</body>
</html>

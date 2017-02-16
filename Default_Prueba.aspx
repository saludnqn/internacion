<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default_Prueba.aspx.cs" Inherits="WebInternacion2.Default1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Usando Flot</title>
    <script src="script/jquery.js" type="text/javascript"></script>
    
		<script type="text/javascript">
		    $(function () {
		        $('#container').highcharts({
		            chart: {
		                type: 'column'
		            },
		            title: {
		                text: 'Resumen de Internación'
		            },
		            subtitle: {
		                text: 'Salud'
		            },
		            xAxis: {
		                categories: [
                    'Peíatría',
                    'Clínica Médica',
                    'Cirugía Gral',
                    'Tocoginecología'                                        
                ]
		            },
		            yAxis: {
		                min: 0,
		                title: {
		                    text: 'Datos'
		                }
		            },
		            tooltip: {
		                headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
		                pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                    '<td style="padding:0"><b>{point.y:.1f} mm</b></td></tr>',
		                footerFormat: '</table>',
		                shared: true,
		                useHTML: true
		            },
		            plotOptions: {
		                column: {
		                    pointPadding: 0.2,
		                    borderWidth: 0
		                }
		            },
		            series: [{
		                name: 'Cant. De Camas',
		                data: [49.9, 71.5, 106.4, 129.2]

		            }, {
		                name: 'Camas Ocupadas',
		                data: [83.6, 78.8, 98.5, 93.4]

		            }, {
		                name: 'Camas Bloqueadas',
		                data: [48.9, 38.8, 39.3, 41.4]

		            }, {
		                name: 'Camas Libres',
		                data: [42.4, 33.2, 34.5, 39.7]

		            }]
		        });
		    });
    

		</script> 
   
</head>
<body>
    <div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
    
    <script src="script/HighCharts/highcharts.js" type="text/javascript"></script>
    <script src="script/HighCharts/exporting.js" type="text/javascript"></script>
</body>
</html>

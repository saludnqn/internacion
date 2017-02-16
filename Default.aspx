<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebInternacion2.Default"
    MasterPageFile="~/Site1.Master" %>

<%@ Register Src="UserControls/ResumenInternaciones.ascx" TagName="ResumenInternaciones"
    TagPrefix="uc1" %>
<asp:Content ID="content2" ContentPlaceHolderID="head" runat="server">

    <table style="margin: 0 auto; width: 70%;">
        <tr>
            <td style="vertical-align: top; width: 500px;">
                <div>
                    <br />
                    <h3>Bienvenido al Sistema de Gestion de Internaciones</h3>                  
                    <div>
                        <%--<div>
                            <a href="Manual del Usuario Internacion.pdf" target="_blank">Manual de Usuario</a>
                            </div>
                          <br />  <br />--%>
                        <div style="min-width: 300px; height: 250px; margin: 0 auto">
                            <uc1:ResumenInternaciones ID="ResumenInternaciones1" runat="server" />
                        </div>
                        
                        <div id="container" style="min-width: 300px; height: 350px; margin: 0 auto">
                        </div>
                    </div>
                </div>
            </td>
            <%-- <td style="vertical-align: top">
                    <div class="left_content">
                        &nbsp;
                    </div>
                </td>--%>
        </tr>
    </table>

    <script type="text/javascript">
        $(function () {
            $('#container').highcharts({
                chart: {
                    type: 'column'
                },
                title: {
                    text: 'Gráfica de Internación'
                },
                subtitle: {
                    text: '<%=devuelveNombreHospital() %>'
                },
                xAxis: {
                    categories:  <%=devuelveServicio() %>
//                    'Pediatría',
//                    'Clínica Médica',
//                    'Cirugía Gral',
//                    'Tocoginecología',
//                    'Odontologia',
//                    'Ginecología'
                
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
                    '<td style="padding:0"><b>{point.y}</b></td></tr>',
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
                    pointWidth: 20,
                    name: 'Cant. De Camas',
                    data: <%=cantidaDeCamas() %>                    
                    }, {
                        pointWidth: 20,
                        name: 'Camas Ocupadas',
                        data: <%=camasOcupadas() %>

                    }, {
                        pointWidth: 20,
                        name: 'Camas Bloqueadas',
                        data: <%=camasBloqueadas() %>

                    }, {
                        pointWidth: 20,
                        name: 'Camas Libres',
                        data: <%=camasLibres() %>

                    }]
            });
        });
    

    </script>
    <!--Gráficos HighCharts-->
    <%--<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.8.2/jquery.js"></script>--%>
    <script type="text/javascript" src="script/HighCharts/jquery-1.8.2.js"></script>
    <script src="script/HighCharts/highcharts.js" type="text/javascript"></script>
    <script src="script/HighCharts/exporting.js" type="text/javascript"></script>
</asp:Content>

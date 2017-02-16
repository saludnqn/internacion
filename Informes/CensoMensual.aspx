<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CensoMensual.aspx.cs" Inherits="WebInternacion2.Informes.CensoMensual"
    MasterPageFile="~/Site1.Master" %>

<asp:Content ID="content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" src="../script/autocomplete/jquery-1.8.2.js"></script>
    <script type="text/javascript" src="../script/autocomplete/jquery-ui.js"></script>
    <link type="text/css" rel="stylesheet" href="../script/jquery-ui-1.7.1.custom.css" />
    <%--<script type="text/javascript" src="../script/jquery.min.js"></script>
    <script type="text/javascript" src="../script/jquery-ui.min.js"></script>--%>
    <script type="text/javascript" src="../script/jquery.ui.datepicker-es.js"></script>
    <script type="text/javascript">


        $(function () {
            $("#<%=txtFechaDesde.ClientID %>").datepicker({
                showOn: 'button',
                buttonImage: '../App_Themes/default/images/calend1.jpg',
                buttonImageOnly: true
            });
        });


        $(function () {
            $("#<%=txtFechaHasta.ClientID %>").datepicker({
                showOn: 'button',
                buttonImage: '../App_Themes/default/images/calend1.jpg',
                buttonImageOnly: true
            });
        });



    </script>
    <script type="text/javascript" src="../script/Mascara.js"></script>
    <script type="text/javascript" src="../script/ValidaFecha.js"></script>

     <style type="text/css">
       .DataGridFixedHeader
{
position: relative;
top: expression(this.offsetParent.scrollTop-3); /*this works fine with IE only, but FireFox seems to be ignoring this*/
}
    </style>
</asp:Content>
<asp:Content ID="content2" ContentPlaceHolderID="cuerpo" runat="server">
    <table cellpadding="1" cellspacing="1" class="myTabla" style="width: 1000px; margin: 0 auto;">
        <tr>
            <td colspan="8">
                <b class="mytituloTabla">CENSO MENSUAL </b>
                <hr />
            </td>
        </tr>
        <tr>
            <td class="myLabelIzquierda" style="width: 83px; height: 26px;">Servicio:
            </td>
            <td colspan="3" style="height: 26px">
                <asp:DropDownList ID="ddlServicio" runat="server" ToolTip="Seleccione el servicio" DataTextField="nombre" DataValueField="idServicio"
                    TabIndex="1" CssClass="myList" >
                </asp:DropDownList>
                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="ddlServicio"
                    ErrorMessage="*" MaximumValue="999999" MinimumValue="1" Type="Integer" ValidationGroup="0">*</asp:RangeValidator>
            </td>
            <td colspan="2" style="height: 26px">
                </td>
            <td colspan="2" style="height: 26px">
                </td>
        </tr>
        <tr>
            <td class="myLabelIzquierda" style="width: 83px">Fecha Desde:
            </td>
            <td style="width: 185px">
                <input id="txtFechaDesde" runat="server" type="text" maxlength="10" onblur="valFecha(this)"
                    onkeyup="mascara(this,'/',patron,true)" tabindex="2" class="myTexto" style="width: 70px" /><asp:RequiredFieldValidator
                        ID="rfvFechadesde" runat="server" ControlToValidate="txtFechaDesde" ErrorMessage="Fecha desde"
                        ValidationGroup="0">*</asp:RequiredFieldValidator>
            </td>
            <td class="myLabelIzquierda" colspan="3">Fecha Hasta:
            </td>
            <td style="width: 134px" colspan="2">
                <input id="txtFechaHasta" runat="server" type="text" maxlength="10" onblur="valFecha(this)"
                    onkeyup="mascara(this,'/',patron,true)" tabindex="3" class="myTexto" style="width: 70px" /><asp:RequiredFieldValidator
                        ID="rfvFechahasta" runat="server" ControlToValidate="txtFechaHasta" ErrorMessage="Fecha hasta"
                        ValidationGroup="0">*</asp:RequiredFieldValidator>
            </td>                        

            <td style="width: 466px" align="right">
                <asp:Button ID="btnRegenerar" runat="server"  TabIndex="4" Text="Regenerar Censos Diarios"
                    ValidationGroup="0" Width="150px" OnClick="btnRegenerar_Click" visible="false"/>
                <asp:Button ID="btnBuscar" runat="server"  TabIndex="4" Text="Ver Censo"
                    ValidationGroup="0" Width="150px" OnClick="btnBuscar_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="8">
                <hr />
            </td>
        </tr>
        <tr>
            <td colspan="8">
                <table style="width: 100%;">
                    <tr>
                        <td colspan="2">
                            <asp:GridView ID="gvLista" runat="server" BorderColor="#666666" BorderStyle="Solid"
                                CssClass="table table-striped table-bordered table-hover" BorderWidth="1px" CellPadding="0"
                                EmptyDataText="No se encontraron internaciones para los parametros de busqueda ingresados"
                                Font-Size="9pt" ForeColor="Black" PageSize="20" Width="100%" Height="200px" CaptionAlign="Top"
                                OnRowDataBound="gvLista_RowDataBound" ShowFooter="True" AutoGenerateColumns="False">
                                <RowStyle BackColor="White" Font-Names="Arial" Font-Size="9pt" ForeColor="Black"
                                    HorizontalAlign="Center" Height="25px" />
                                <PagerSettings Mode="NumericFirstLast" Position="Top" />
                                <Columns>
                                    <asp:BoundField DataField="DIA" HeaderText="DIA">
                                        <ItemStyle BackColor="#DFDFDF" Font-Bold="True" Width="80px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="existenciaCeroHoras" HeaderText="EXISTENCIA A LAS 0 HS.">
                                        <ItemStyle Width="80px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="ingresos" HeaderText="INGRESOS">
                                        <ItemStyle Width="80px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="paseDe" HeaderText="PASE DE">
                                        <ItemStyle Width="80px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="egresoVivo" HeaderText="EGRESOS VIVOS">
                                        <ItemStyle BackColor="#DFDFDF" Font-Bold="True" Width="80px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="egresoDefuncion" HeaderText="EGRESOS FALLEC.">
                                        <ItemStyle BackColor="#DFDFDF" Font-Bold="True" Width="80px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="paseA" HeaderText="PASE A">
                                        <ItemStyle Width="80px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="existencia24Horas" HeaderText="EXISTENCIA 24HS.">
                                        <ItemStyle Width="80px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="ingresoEgresoDia" HeaderText="INGR. EGR. DIA">
                                        <ItemStyle Width="80px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="pacientesDia" HeaderText="PACIENTES-DIA">
                                        <ItemStyle BackColor="#DFDFDF" Font-Bold="True" Width="80px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="camasDisponibles" HeaderText="CAMAS DISPONIBLES">
                                        <ItemStyle BackColor="#DFDFDF" Font-Bold="True" Width="80px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="bloqueos" HeaderText="BLOQUEOS">
                                        <ItemStyle Width="80px" />
                                    </asp:BoundField>
                                     <asp:BoundField DataField="diasEstada" HeaderText="DIAS ESTADA">
                                        <ItemStyle Width="50px" />
                                    </asp:BoundField>
                                </Columns>
                                <FooterStyle BackColor="#CCCCCC" Font-Bold="True" ForeColor="Black" Font-Size="9pt"
                                    HorizontalAlign="Center" />
                                <PagerStyle BackColor="#E6E6E6" ForeColor="Black" HorizontalAlign="Right" />
                                <SelectedRowStyle BackColor="White" Font-Bold="True" ForeColor="#333333" />
                                <HeaderStyle CssClass="DataGridFixedHeader" BackColor="#CCCCCC" Font-Bold="False" Font-Names="Arial" Font-Size="8pt"
                                    ForeColor="Black" />
                                <EditRowStyle BackColor="#999999" />
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td class="myLabelIzquierda" colspan="2">
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td class="myLabelIzquierda" colspan="2">
                            <table class="table table-striped table-bordered table-hover" style="width: 100%;">
                                <tr>
                                    <td class="myLabelLitlle" align="center" style="background-color: #CCCCCC; border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #000000;">Promedio Diario de Pacientes Día
                                    </td>
                                    <td class="myLabelLitlle" align="center" style="background-color: #CCCCCC; border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #000000;">&nbsp;Promedio Diario de Camas Disponibles
                                    </td>
                                    <td class="myLabelLitlle" align="center" style="background-color: #CCCCCC; border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #000000;">&nbsp;Promedio de Permanencia
                                    </td>
                                    <td class="myLabelLitlle" align="center" style="background-color: #CCCCCC; border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #000000;">Promedio Días Estada
                                    </td>
                                    <td class="myLabelLitlle" align="center" style="background-color: #CCCCCC; border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #000000;">Porcentaje Ocupación de Camas
                                    </td>
                                    <td class="myLabelLitlle" align="center" style="background-color: #CCCCCC; border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #000000;">Giros de Cama
                                    </td>
                                    <td class="myLabelLitlle" align="center" style="background-color: #CCCCCC; border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #000000;">Tasa de Mortalidad.
                                    </td>
                                </tr>
                                <tr>
                                    <td class="myLabel" align="center">
                                        <asp:Label ID="lblPromedioPacientesDia" runat="server" Font-Bold="True" />
                                    </td>
                                    <td class="myLabel" align="center">
                                        <asp:Label ID="lblPromedioCamasDisponibles" runat="server" Font-Bold="True" />
                                    </td>
                                    <td class="myLabel" align="center">
                                        <asp:Label ID="lblPromedioPermanencia" runat="server" Font-Bold="True" />
                                    </td>
                                    <td class="myLabel" align="center">
                                        <asp:Label ID="lblPromedioDiasEstada" runat="server" Font-Bold="True" />
                                    </td>
                                    <td class="myLabel" align="center">
                                        <asp:Label ID="lblPorcentajeOcupacion" runat="server" Font-Bold="True" />
                                    </td>
                                    <td class="myLabel" align="center">
                                        <asp:Label ID="lblGirosCama" runat="server" Font-Bold="True" />
                                    </td>
                                    <td class="myLabel" align="center">
                                        <asp:Label ID="lblTasaMortalidad" runat="server" Font-Bold="True" />
                                    </td>
                                </tr>
                            </table>
                            <br />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="left" colspan="3">&nbsp;
            </td>
            <td align="right" colspan="5">
                <asp:ImageButton ID="imgExcel" runat="server" ImageUrl="~/App_Themes/default/images/excelPeq.gif" OnClick="imgExcel_Click" />
                &nbsp;&nbsp;
                <asp:ImageButton ID="imgExportar" runat="server" ImageUrl="~/App_Themes/default/images/pdf.jpg"
                    OnClick="imgExportar_Click" />
            </td>
        </tr>
    </table>
    <br />
</asp:Content>

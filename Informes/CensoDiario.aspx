<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CensoDiario.aspx.cs" Inherits="WebInternacion2.Informes.CensoDiario"
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
            $("#<%=txtFecha.ClientID %>").datepicker({
                showOn: 'button',
                buttonImage: '../App_Themes/default/images/calend1.jpg',
                buttonImageOnly: true
            });
        });


    </script>
    <script type="text/javascript" src="../script/Mascara.js"></script>
    <script type="text/javascript" src="../script/ValidaFecha.js"></script>
</asp:Content>
<asp:Content ID="content2" ContentPlaceHolderID="cuerpo" runat="server">
    <table align="center" style="margin-left: auto; margin-right: auto;" cellpadding="1"
        cellspacing="1" width="1000px">
        <tr>
            <td colspan="6">
                <b class="mytituloTabla">CENSO DIARIO </b>
                <hr />
            </td>
        </tr>
        <tr>
            <td class="myLabelIzquierda">Servicio:
            </td>
            <td class="style3">
                <asp:DropDownList ID="ddlServicio" runat="server" ToolTip="Seleccione el servicio"
                    TabIndex="1" CssClass="myList" DataTextField="nombre" DataValueField="idServicio" >
                </asp:DropDownList>
                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="ddlServicio"
                    ErrorMessage="Seleccione" MaximumValue="999999" MinimumValue="1" Type="Integer"
                    ValidationGroup="0">*</asp:RangeValidator>
            </td>
            <td class="myLabelIzquierda" colspan="2">Fecha:
            </td>
            <td class="style4">
                <input id="txtFecha" runat="server" type="text" maxlength="10" onblur="valFecha(this)"
                    onkeyup="mascara(this,'/',patron,true)" tabindex="2" class="myTexto" style="width: 70px" /><asp:RequiredFieldValidator
                        ID="rfvFecha" runat="server" ControlToValidate="txtFecha" ErrorMessage="Fecha"
                        ValidationGroup="0">*</asp:RequiredFieldValidator>
            </td>
            <td class="style5" align="right">
                <asp:Button ID="btnBuscar" runat="server" OnClick="btnRegenerarCenso_Click"
                    TabIndex="3" Text="Censo Diario" ValidationGroup="0" Width="150px" />
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <hr />
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <table style="width: 100%;">
                    <tr>
                        <td colspan="2">
                            <asp:GridView ID="gvLista" runat="server" BorderColor="#666666" BorderStyle="Solid" CssClass="table table-striped table-bordered table-hover"
                                BorderWidth="1px" CellPadding="2" EmptyDataText="No se encontraron internaciones para los parametros de busqueda ingresados"
                                Font-Size="9pt" ForeColor="Black" PageSize="20" Width="100%"
                                AutoGenerateColumns="False">
                                <RowStyle BackColor="White" Font-Names="Arial" Font-Size="8pt" ForeColor="Black"
                                    Height="25px" />
                                <PagerSettings Mode="NumericFirstLast" Position="Top" />
                                <Columns>
                                    <asp:BoundField DataField="numeroDocumento" HeaderText="Documento" />
                                    <asp:BoundField DataField="Paciente" HeaderText="Apellidos y Nombres" />
                                    <asp:BoundField DataField="Historia" HeaderText="HC" />
                                    <asp:BoundField DataField="Habitacion" HeaderText="Hab." />
                                    <asp:BoundField DataField="Cama" HeaderText="Cama" />
                                    <asp:BoundField DataField="fechaDesde" HeaderText="Desde" htmlencode="false" DataFormatString="{0:dd/MM/yyyy}"/>                                  
                                    <asp:BoundField DataField="Movimiento" HeaderText="Movimiento" />
                                    <asp:BoundField DataField="TipoEgreso" HeaderText="Tipo Egreso" />
                                    <asp:BoundField DataField="Pasede" HeaderText="Pase de" />
                                    <asp:BoundField DataField="Pasea" HeaderText="Pase a" />
                                    <asp:BoundField DataField="Observaciones" HeaderText="Hora"/>
                                    <asp:BoundField DataField="diasEstada" HeaderText="Estada">
                                    <ItemStyle Font-Italic="True" Font-Size="8pt" />
                                    </asp:BoundField>
                                </Columns>
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#E6E6E6" ForeColor="Black" HorizontalAlign="Right" />
                                <SelectedRowStyle BackColor="White" Font-Bold="True" ForeColor="#333333" />
                                <HeaderStyle BackColor="#CCCCCC" Font-Bold="False" Font-Names="Arial" Font-Size="8pt"
                                    ForeColor="Black" BorderStyle="None" />
                                <EditRowStyle BackColor="#999999" />
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">&nbsp;<br />
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <table class="#table table-striped table-bordered table-hover" style="width: 100%;">
                                <tr>
                                    <td class="myLabelLitlle" align="center" style="background-color: #CCCCCC; border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #000000;"
                                        rowspan="2">Exist. 0hs.
                                    </td>
                                    <td class="myLabelLitlle" align="center" style="background-color: #CCCCCC; border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #000000;"
                                        rowspan="2">&nbsp;Ingr.
                                    </td>
                                    <td class="myLabelLitlle" align="center" style="background-color: #CCCCCC; border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #000000;"
                                        rowspan="2">Pases de
                                    </td>
                                    <td class="myLabelLitlle" align="center" style="background-color: #CCCCCC; border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #000000;"
                                        colspan="2">Egresos
                                    </td>
                                    <td class="myLabelLitlle" align="center" style="background-color: #CCCCCC; border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #000000;"
                                        rowspan="2">Pases a
                                    </td>
                                    <td class="myLabelLitlle" align="center" style="background-color: #CCCCCC; border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #000000;"
                                        rowspan="2">Exist. 24hs.
                                    </td>
                                    <td class="myLabelLitlle" align="center" style="background-color: #CCCCCC; border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #000000;"
                                        rowspan="2">Ingr/Egr día
                                    </td>
                                    <td class="myLabelLitlle" align="center" style="background-color: #CCCCCC; border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #000000;"
                                        rowspan="2">Pacientes día
                                    </td>
                                    <td class="myLabelLitlle" align="center" style="background-color: #CCCCCC; border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #000000;"
                                        rowspan="2">Camas Disp.
                                    </td>
                                    <td class="myLabelLitlle" align="center" style="background-color: #CCCCCC; border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #000000;"
                                        rowspan="2">Camas Bloq.
                                    </td>
                                    <td class="myLabelLitlle" align="center" style="background-color: #CCCCCC; border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #000000;"
                                        rowspan="2">Tot Estada.
                                    </td>
                                </tr>
                                <tr>
                                    <td class="myLabelLitlle" align="center" style="background-color: #CCCCCC; border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #000000;">&nbsp;Egresos Vivos
                                    </td>
                                    <td class="myLabelLitlle" align="center" style="background-color: #CCCCCC; border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #000000;">Egresos Defunción
                                    </td>
                                </tr>
                                <tr>
                                    <td class="myLabel" align="center">
                                        <asp:Label ID="lblExistenciaCeroHoras" runat="server" Font-Bold="True" />
                                    </td>
                                    <td class="myLabel" align="center">
                                        <asp:Label ID="lblIngresos" runat="server" Font-Bold="True" />
                                    </td>
                                    <td class="myLabel" align="center">
                                        <asp:Label ID="lblPasede" runat="server" Font-Bold="True" />
                                    </td>
                                    <td class="myLabel" align="center">
                                        <asp:Label ID="lblEgresos" runat="server" Font-Bold="True" />
                                    </td>
                                    <td class="myLabel" align="center">
                                        <asp:Label ID="lblEgresosDefuncion" runat="server" Font-Bold="True" />
                                    </td>
                                    <td class="myLabel" align="center">
                                        <asp:Label ID="lblPasea" runat="server" Font-Bold="True" />
                                    </td>
                                    <td class="myLabel" align="center">
                                        <asp:Label ID="lblExistencia24Horas" runat="server" Font-Bold="True" />
                                    </td>
                                    <td class="myLabel" align="center">
                                        <asp:Label ID="lblIEDia" runat="server" Font-Bold="True" />
                                    </td>
                                    <td class="myLabel" align="center">
                                        <asp:Label ID="lblPacientesDia" runat="server" Font-Bold="True" />
                                    </td>
                                    <td class="myLabel" align="center">
                                        <asp:Label ID="lblCamasDisponibles" runat="server" Font-Bold="True" />
                                    </td>
                                    <td class="myLabel" align="center">
                                        <asp:Label ID="lblCamasBloqueadas" runat="server" Font-Bold="True" />
                                    </td>
                                    <td class="myLabel" align="center">
                                        <asp:Label ID="lblDiasEstada" runat="server" Font-Bold="True" />
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
            <td align="left" colspan="3">
                <asp:Button ID="btnRegenerarCenso" runat="server" CssClass="myButton" OnClientClick="return Pregunto();"
                    OnClick="btnRegenerarCenso_Click" Text="Regenerar Censo" ValidationGroup="0" visible="false"/>
            </td>
            <td align="right" colspan="3">
                <asp:ImageButton ID="imgExcel" runat="server" ImageUrl="~/App_Themes/default/images/excelPeq.gif"
                    OnClick="imgExcel_Click" />
                &nbsp;&nbsp;
                <asp:ImageButton ID="imgExportar" runat="server" ImageUrl="~/App_Themes/default/images/pdf.jpg"
                    OnClick="imgExportar_Click" />
            </td>
        </tr>
    </table>
    <br />
    <script language="javascript" type="text/javascript">

        function Pregunto() {
            if (confirm('¿Está seguro de regenerar el censo diario?'))
                return true;
            else
                return false;
        }
    </script>
</asp:Content>

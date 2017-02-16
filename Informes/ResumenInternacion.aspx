<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResumenInternacion.aspx.cs"
    Inherits="WebInternacion2.Informes.ResumenInternacion" MasterPageFile="~/Site1.Master" %>

<asp:Content ID="content1" ContentPlaceHolderID="head" runat="server">
    <link type="text/css" rel="stylesheet" href="../script/jquery-ui-1.7.1.custom.css" />
    <script type="text/javascript" src="../script/jquery.min.js"></script>
    <script type="text/javascript" src="../script/jquery-ui.min.js"></script>
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
</asp:Content>
<asp:Content ID="content2" ContentPlaceHolderID="cuerpo" runat="server">
    <table align="center" cellpadding="1" cellspacing="1" class="myTabla" style="width: 800px">
        <tr>
            <td colspan="5">
                <b class="mytituloTabla">RESUMEN ESTADISTICO </b>
                <hr />
            </td>
        </tr>
        <tr>
            <td class="myLabelIzquierda">
                Fecha Desde:
            </td>
            <td>
                <input id="txtFechaDesde" runat="server" type="text" maxlength="10" onblur="valFecha(this)"
                    onkeyup="mascara(this,'/',patron,true)" tabindex="3" class="myTexto" style="width: 70px" />
            </td>
            <td class="myLabelIzquierda">
                Fecha Hasta:
            </td>
            <td colspan="2">
                <input id="txtFechaHasta" runat="server" type="text" maxlength="10" onblur="valFecha(this)"
                    onkeyup="mascara(this,'/',patron,true)" tabindex="3" class="myTexto" style="width: 70px" />
            </td>
        </tr>
        <tr>
            <td class="myLabelIzquierda">
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
            <td class="myLabelIzquierda">
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
            <td align="right">
                <asp:Button ID="btnBuscar" runat="server" CssClass="myButton" TabIndex="15" Text="Ver Informe"
                    ValidationGroup="0" Width="110px" OnClick="btnBuscar_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="5">
                <hr />
            </td>
        </tr>
        <tr>
            <td colspan="5">
                <table style="width: 100%;">
                    <tr>
                        <td colspan="3" align="right">
                            &nbsp;
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td style="vertical-align: top" colspan="3">
                            <asp:GridView ID="gvLista" runat="server" BorderColor="#666666" BorderStyle="Solid" CssClass="table table-striped table-bordered table-hover" 
                                BorderWidth="1px" CellPadding="0" EmptyDataText="No se encontraron datos para los parametros de busqueda ingresados"
                                Font-Size="9pt" ForeColor="Black" PageSize="20" Width="100%" CaptionAlign="Top"
                                OnRowDataBound="gvLista_RowDataBound" ShowFooter="True" AutoGenerateColumns="False">
                                <RowStyle BackColor="White" Font-Names="Arial" Font-Size="9pt" ForeColor="Black"
                                    HorizontalAlign="Center" />
                                <PagerSettings Mode="NumericFirstLast" Position="Top" />
                                <Columns>
                                    <asp:BoundField DataField="tipoIngreso" HeaderText="Tipo Ingreso">
                                        <ItemStyle HorizontalAlign="Left" Width="40%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="CANTIDAD" HeaderText="Cantidad">
                                        <ItemStyle HorizontalAlign="Left" Width="10%" />
                                    </asp:BoundField>
                                    <%--   <asp:BoundField HeaderText="Ver Pacientes" >
                                                                        <ItemStyle Width="10%" />
                                                                    </asp:BoundField>--%>
                                </Columns>
                                <FooterStyle BackColor="#CCCCCC" Font-Bold="True" ForeColor="Black" Font-Size="9pt"
                                    HorizontalAlign="Center" />
                                <PagerStyle BackColor="#E6E6E6" ForeColor="Black" HorizontalAlign="Right" />
                                <SelectedRowStyle BackColor="White" Font-Bold="True" ForeColor="#333333" />
                                <HeaderStyle BackColor="#CCCCCC" Font-Bold="False" Font-Names="Arial" Font-Size="8pt"
                                    ForeColor="Black" />
                                <EditRowStyle BackColor="#999999" />
                            </asp:GridView>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td style="vertical-align: top" colspan="3">
                            <asp:GridView ID="gvLista2" runat="server" BorderColor="#666666" BorderStyle="Solid" CssClass="table table-striped table-bordered table-hover" 
                                BorderWidth="1px" CellPadding="0" EmptyDataText="No se encontraron datos para los parametros de busqueda ingresados"
                                Font-Size="9pt" ForeColor="Black" PageSize="20" Width="100%" CaptionAlign="Top"
                                OnRowDataBound="gvLista2_RowDataBound" ShowFooter="True" AutoGenerateColumns="False">
                                <RowStyle BackColor="White" Font-Names="Arial" Font-Size="9pt" ForeColor="Black"
                                    HorizontalAlign="Center" />
                                <PagerSettings Mode="NumericFirstLast" Position="Top" />
                                <Columns>
                                    <asp:BoundField DataField="servicioIngreso" HeaderText="Servicio de Ingreso">
                                        <ItemStyle HorizontalAlign="Left" Width="40%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="CANTIDAD" HeaderText="Cantidad">
                                        <ItemStyle HorizontalAlign="Left" Width="10%" />
                                    </asp:BoundField>
                                    <%--   <asp:BoundField HeaderText="Ver Pacientes" >
                                                                        <ItemStyle Width="10%" />
                                                                    </asp:BoundField>--%>
                                </Columns>
                                <FooterStyle BackColor="#CCCCCC" Font-Bold="True" ForeColor="Black" Font-Size="9pt"
                                    HorizontalAlign="Center" />
                                <PagerStyle BackColor="#E6E6E6" ForeColor="Black" HorizontalAlign="Right" />
                                <SelectedRowStyle BackColor="White" Font-Bold="True" ForeColor="#333333" />
                                <HeaderStyle BackColor="#CCCCCC" Font-Bold="False" Font-Names="Arial" Font-Size="8pt"
                                    ForeColor="Black" />
                                <EditRowStyle BackColor="#999999" />
                            </asp:GridView>
                            <br />
                            <hr />
                        </td>
                    </tr>
                    <tr>
                        <td style="vertical-align: top" colspan="3">
                            <asp:GridView ID="gvLista1" runat="server" BorderColor="#666666" BorderStyle="Solid" CssClass="table table-striped table-bordered table-hover" 
                                BorderWidth="1px" CellPadding="0" EmptyDataText="No se encontraron datos para los parametros de busqueda ingresados"
                                Font-Size="10pt" ForeColor="Black" PageSize="20" Width="100%" CaptionAlign="Top"
                                OnRowDataBound="gvLista1_RowDataBound" ShowFooter="True" AutoGenerateColumns="False">
                                <RowStyle BackColor="White" Font-Names="Arial" Font-Size="9pt" ForeColor="Black"
                                    HorizontalAlign="Center" />
                                <PagerSettings Mode="NumericFirstLast" Position="Top" />
                                <Columns>
                                    <asp:BoundField DataField="motivoEgreso" HeaderText="Motivo Egreso">
                                        <ItemStyle HorizontalAlign="Left" Width="40%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="CANTIDAD" HeaderText="Cantidad">
                                        <ItemStyle HorizontalAlign="Left" Width="10%" />
                                    </asp:BoundField>
                                    <%--   <asp:BoundField HeaderText="Ver Pacientes" >
                                                                        <ItemStyle Width="10%" />
                                                                    </asp:BoundField>--%>
                                </Columns>
                                <FooterStyle BackColor="#CCCCCC" Font-Bold="True" ForeColor="Black" Font-Size="9pt"
                                    HorizontalAlign="Center" />
                                <PagerStyle BackColor="#E6E6E6" ForeColor="Black" HorizontalAlign="Right" />
                                <SelectedRowStyle BackColor="White" Font-Bold="True" ForeColor="#333333" />
                                <HeaderStyle BackColor="#CCCCCC" Font-Bold="False" Font-Names="Arial" Font-Size="8pt"
                                    ForeColor="Black" />
                                <EditRowStyle BackColor="#999999" />
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <br />
</asp:Content>

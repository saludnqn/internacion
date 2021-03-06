﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PorDiagnostico.aspx.cs"
    Inherits="WebInternacion2.Informes.PorDiagnostico" MasterPageFile="~/Site1.Master" %>

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
</asp:Content>
<asp:Content ID="content2" ContentPlaceHolderID="cuerpo" runat="server">
    <table cellpadding="2" cellspacing="2" style="width: 1000px; margin: 0 auto;">
        <tr>
            <td colspan="7">
                <b class="mytituloTabla">INFORME DE DIAGNOSTICOS </b>
                <hr />
            </td>
        </tr>
        <tr>
            <td class="myLabelIzquierda" style="width: 240px">Servicio:
            </td>
            <td colspan="6">
                <asp:DropDownList ID="ddlServicio" runat="server" ToolTip="Seleccione el servicio" DataTextField="nombre" DataValueField="idServicio"
                    TabIndex="1" CssClass="myList">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="myLabelIzquierda" style="width: 240px">Fecha Desde:
            </td>
            <td style="width: 185px">
                <input id="txtFechaDesde" runat="server" type="text" maxlength="10" onblur="valFecha(this)"
                    onkeyup="mascara(this,'/',patron,true)" tabindex="2" class="myTexto" style="width: 70px" />
            </td>
            <td class="myLabelIzquierda" colspan="3">Fecha Hasta:
            </td>
            <td style="width: 134px">
                <input id="txtFechaHasta" runat="server" type="text" maxlength="10" onblur="valFecha(this)"
                    onkeyup="mascara(this,'/',patron,true)" tabindex="3" class="myTexto" style="width: 70px" />
            </td>
            <td style="width: 466px" align="right">&nbsp;
            </td>
        </tr>
        <tr>
            <td class="myLabelIzquierda" style="width: 240px">Capítulo:
            </td>
            <td colspan="3">
                <asp:DropDownList ID="ddlCapitulo" runat="server" ToolTip="Seleccione el capitulo del CIE10"
                    TabIndex="4" CssClass="myList" Width="400px">
                </asp:DropDownList>
            </td>
            <td colspan="3">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="myLabelIzquierda" style="width: 240px">&nbsp;
            </td>
            <td colspan="6" align="right">
                <asp:Button ID="btnBuscar" runat="server"  TabIndex="5" Text="Ver Informe"
                    ValidationGroup="0" Width="110px" OnClick="btnBuscar_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="7">
                <hr />
            </td>
        </tr>
        <tr>
            <td colspan="7">
                <table style="width: 100%;">
                    <tr>
                        <td colspan="2" align="right">
                            <asp:ImageButton ID="imgExportar" runat="server" ImageUrl="~/App_Themes/default/images/pdf.jpg"
                                OnClick="imgExportar_Click" ToolTip="Exportar a Pdf" />
                            &nbsp;
                            <asp:ImageButton ID="imgExcel" runat="server" ImageUrl="~/App_Themes/default/images/excelPeq.gif"
                                OnClick="imgExcel_Click" ToolTip="Exportar a Excel" />
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:GridView ID="gvLista" runat="server" BorderColor="#666666" BorderStyle="Solid" CssClass="table table-striped table-bordered table-hover"
                                BorderWidth="1px" CellPadding="0" EmptyDataText="No se encontraron internaciones para los parametros de busqueda ingresados"
                                Font-Size="9pt" ForeColor="Black" PageSize="20" Width="100%" CaptionAlign="Top"
                                OnRowDataBound="gvLista_RowDataBound" ShowFooter="True" AutoGenerateColumns="False">
                                <RowStyle BackColor="White" Font-Names="Arial" Font-Size="9pt" ForeColor="Black"
                                    HorizontalAlign="Center" />
                                <PagerSettings Mode="NumericFirstLast" Position="Top" />
                                <Columns>
                                    <asp:BoundField DataField="capitulo" HeaderText="Capítulo">
                                        <ItemStyle HorizontalAlign="Left" Width="40%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="codigo" HeaderText="Código CIE10">
                                        <ItemStyle HorizontalAlign="Left" Width="10%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="nombre" HeaderText="Descripción">
                                        <ItemStyle HorizontalAlign="Left" Width="40%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="cantidad" HeaderText="Cantidad Casos">
                                        <ItemStyle HorizontalAlign="Center" Font-Bold="true" Width="10%" />
                                    </asp:BoundField>
                                    <%--  <asp:BoundField HeaderText="Ver Pacientes" >
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
                </table>
            </td>
        </tr>
        <tr>
            <td align="left" colspan="7">
                <hr />
            </td>
        </tr>
        <tr>
            <td align="left" colspan="7">
                <asp:Panel ID="pnlDetallePacientes" Visible="false" runat="server">
                    <asp:ImageButton ID="imgExportarDetallado" runat="server" ImageUrl="~/App_Themes/default/images/pdf.jpg"
                        OnClick="imgExportarDetallado_Click" ToolTip="Exportar a Pdf" />
                    &nbsp;
                    <asp:ImageButton ID="imgDetalladoPaciente" runat="server" ImageUrl="~/App_Themes/default/images/excelPeq.gif"
                        OnClick="imgDetalladoPaciente_Click" ToolTip="Exportar a Excel" />
                    &nbsp;Descargar Informe detallado por paciente&nbsp;&nbsp;
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td align="left" colspan="3">&nbsp;
            </td>
            <td align="right" colspan="4">&nbsp;
            </td>
        </tr>
    </table>
    <br />
</asp:Content>

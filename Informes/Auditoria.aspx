<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Auditoria.aspx.cs" Inherits="WebInternacion2.Informes.Auditoria"
    MasterPageFile="~/Site1.Master" %>

<asp:Content ID="content1" ContentPlaceHolderID="head" runat="server">
    <%--<link rel="stylesheet" type="text/css" href="../App_Themes/default/style.css" />--%>
    <style type="text/css">
        .style1
        {
            width: 800px;
        }
        .style2
        {
            border-style: none;
            font-size: 14pt;
            font-family: Calibri;
            color: #333333;
            font-weight: bold;
            width: 189px;
        }
        .style3
        {
            width: 336px;
        }
    </style>
</asp:Content>
<asp:Content ID="content2" ContentPlaceHolderID="cuerpo" runat="server">
    <asp:Panel ID="Panel1" runat="server" DefaultButton="btnBuscar">
        <table style="margin: 0 auto;" cellpadding="1" cellspacing="1" width="800px" class="style1">
            <tr>
                <td colspan="4">
                    <b class="mytituloTabla">AUDITORIA DE INTERNACION</b>
                    <hr />
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="lblNumeroInternacion" runat="server" Text="Número de Internación"></asp:Label>
                </td>
                <td class="style3">
                    <asp:TextBox ID="txtNumero" runat="server" Font-Size="14"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNumero"
                        ErrorMessage="*" ValidationGroup="0"></asp:RequiredFieldValidator>
                </td>
                <td class="myLabelIzquierda" colspan="2" align="right">
                    <asp:Button ID="btnBuscar" runat="server" CssClass="myButton" OnClick="btnBuscar_Click"
                        TabIndex="15" Text="Ver Informe" ValidationGroup="0" Width="150px" />
                </td>
            </tr>
            <tr>
                <td colspan="4">
                    <hr />
                </td>
            </tr>
            <tr>
                <td colspan="4">
                    <table style="width: 100%;">
                        <tr>
                            <td colspan="2">
                                <asp:GridView ID="gvLista" runat="server" BorderColor="#666666" BorderStyle="Solid" CssClass="table table-striped table-bordered table-hover" 
                                    BorderWidth="1px" CellPadding="2" EmptyDataText="No se encontraron internaciones para los parametros de busqueda ingresados"
                                    Font-Size="9pt" ForeColor="Black" PageSize="20" Width="100%">
                                    <RowStyle BackColor="White" Font-Names="Arial" Font-Size="8pt" ForeColor="Black"
                                        Height="25px" />
                                    <PagerSettings Mode="NumericFirstLast" Position="Top" />
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
                            <td colspan="2">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="right">
                                <asp:ImageButton ID="imgExcel" runat="server" ImageUrl="~/App_Themes/default/images/excelPeq.gif"
                                    OnClick="imgExcel_Click" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="left" colspan="3">
                    &nbsp;
                </td>
                <td align="right">
                    &nbsp;&nbsp;
                </td>
            </tr>
        </table>
    </asp:Panel>
    <br />
</asp:Content>

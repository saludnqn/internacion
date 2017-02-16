<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Catastro.aspx.cs" Inherits="WebInternacion.Administracion.Catastro"
    MasterPageFile="~/Site1.Master" %>

<asp:Content ID="content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="../App_Themes/default/style.css" />
</asp:Content>
<asp:Content ID="content2" ContentPlaceHolderID="cuerpo" runat="server">
    <div style="width: 850px; margin-left: 3%;">
        <br />
        &nbsp; &nbsp; &nbsp;
        <br />
        <table width="600px">
            <tr>
                <td colspan="3" class="mytituloTabla">Configuración de Dotación de Camas
                </td>
            </tr>
            <tr>
                <td colspan="3" class="mytituloTabla">
                    <hr class="hrTitulo" />
                </td>
            </tr>
            <tr>
                <td style="vertical-align: top">
                    <asp:Button ID="btnExpander" runat="server" CssClass="myButtonRojo" OnClick="btnExpander_Click"
                        Text="Expander Todo" Width="100px" />
                    &nbsp;&nbsp;
                    <asp:Button ID="btnContraer" runat="server" CssClass="myButtonRojo" OnClick="btnContraer_Click"
                        Text="Contraer Todo" Width="100px" />
                    &nbsp;
                    <asp:Button ID="btnMapaCamas" runat="server" CssClass="myButtonRojo" OnClick="btnMapaCamas_Click"
                        Text="Ver Mapa de Camas" Width="120px" />
                </td>
                <td style="vertical-align: top">&nbsp;
                </td>
                <td style="vertical-align: top">&nbsp;
                </td>
            </tr>
            <tr>
                <td colspan="3" class="mytituloGris">
                    <asp:Label ID="lblDotacion" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="vertical-align: top">
                    <div style="border: 1px solid #999999; color: #FFFFFF; height: 600px; width: 350px; overflow: scroll;">
                        <asp:TreeView ID="TreeView1" runat="server" BorderStyle="Solid" BorderWidth="2px"
                            Width="95%" Font-Bold="False" BackColor="White" SkipLinkText="" ShowLines="True"
                            ExpandDepth="0">
                            <RootNodeStyle Font-Bold="True" ForeColor="Black" />
                            <NodeStyle Font-Bold="False" ForeColor="Black" />
                        </asp:TreeView>
                    </div>
                </td>
                <td style="vertical-align: top">&nbsp; &nbsp;&nbsp;
                </td>
                <td style="vertical-align: top">
                    <asp:Panel ID="pnlPiso" runat="server" Visible="False">
                        <table style="width: 350px;" class="myLabelIzquierda">
                            <tr>
                                <td class="mytituloTabla" colspan="2">
                                    <asp:Label ID="lblTituloPiso" runat="server" Text="Label"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <hr />
                                </td>
                            </tr>
                            <tr>
                                <td>Nombre:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtPiso" runat="server" CssClass="myTexto" Width="200px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvPiso" runat="server" ControlToValidate="txtPiso"
                                        ErrorMessage="Nombre del Piso" ValidationGroup="Piso">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <hr />
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;
                                </td>
                                <td align="right">
                                    <asp:Button ID="btnEliminarPiso" runat="server" Text="Eliminar" OnClientClick="return PreguntoEliminar();"
                                        OnClick="btnEliminarPiso_Click" CssClass="myButton" />
                                    &nbsp;<asp:Button ID="btnAgregarPiso" runat="server" CssClass="myButton" OnClick="btnAgregarPiso_Click"
                                        Text="Guardar" ValidationGroup="Piso" />
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;
                                </td>
                                <td align="right">
                                    <asp:CustomValidator ID="cvPiso" runat="server" ErrorMessage=" " OnServerValidate="cvPiso_ServerValidate"
                                        ValidationGroup="Piso"></asp:CustomValidator>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="Debe completar datos obligatorios"
                                        ShowMessageBox="True" ShowSummary="False" ValidationGroup="Piso" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <asp:Panel ID="pnlHabitacion" runat="server" Visible="False">
                        <table style="width: 350px;">
                            <tr>
                                <td class="mytituloTabla" colspan="2">
                                    <asp:Label ID="lblTituloHabitacion" runat="server" Text="Label"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <hr />
                                </td>
                            </tr>
                            <tr>
                                <td class="myLabelIzquierda">Piso:
                                </td>
                                <td>
                                    <asp:Label ID="lblPiso" runat="server" Text="Label" CssClass="myLabelIzquierda"></asp:Label>
                                    <asp:Label ID="lblIdPiso" runat="server" CssClass="myLabelIzquierda" Text="Label"
                                        Visible="False"></asp:Label>
                                </td>
                            </tr>
                            <%--<tr>
                                <td class="myLabelIzquierda">Servicio:
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlServicio" runat="server" DataTextField="nombre" DataValueField="idServicio">
                                    </asp:DropDownList>
                                    <asp:RangeValidator ID="rvServicioHabitacion" runat="server" ControlToValidate="ddlServicio"
                                        ErrorMessage="Servicio" MaximumValue="999999" MinimumValue="1" Type="Integer"
                                        ValidationGroup="Habitacion">*</asp:RangeValidator>
                                </td>
                            </tr>--%>
                            <tr>
                                <td class="myLabelIzquierda">Nombre:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtHabitacion" runat="server" CssClass="myTexto" Width="200px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvHabitacion" runat="server" ControlToValidate="txtHabitacion"
                                        ErrorMessage="Nombre de la habitación" ValidationGroup="Habitacion">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <hr />
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;
                                </td>
                                <td align="right">
                                    <asp:Button ID="btnEliminarHab" runat="server" OnClientClick="return PreguntoEliminar();"
                                        OnClick="btnEliminarHab_Click" Text="Eliminar" CssClass="myButton" />
                                    &nbsp;
                                    <asp:Button ID="btnAgregarHabitacion" runat="server" CssClass="myButton" OnClick="btnAgregarHabitacion_Click"
                                        Text="Guardar" ValidationGroup="Habitacion" />
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;
                                </td>
                                <td align="right">
                                    <asp:CustomValidator ID="cvhABITACION" runat="server" ErrorMessage=" " OnServerValidate="cvhABITACION_ServerValidate"
                                        ValidationGroup="Habitacion"></asp:CustomValidator>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:ValidationSummary ID="ValidationSummary2" runat="server" HeaderText="Debe completar datos obligatorios"
                                        ShowMessageBox="True" ShowSummary="False" ValidationGroup="Habitacion" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <asp:Panel ID="pnlCama" runat="server" Visible="False">
                        <table style="width: 450px;">
                            <tr>
                                <td class="mytituloTabla" colspan="2">
                                    <asp:Label ID="lblTituloCama" runat="server" Text="Label"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <hr />
                                </td>
                            </tr>
                            <tr>
                                <td class="myLabelIzquierda">Piso:
                                </td>
                                <td>
                                    <asp:Label ID="lblPiso2" runat="server" Text="Label" CssClass="myLabelIzquierda"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="myLabelIzquierda">Habitación:
                                </td>
                                <td>
                                    <asp:Label ID="lblHabitacion" runat="server" Text="Label" CssClass="myLabelIzquierda"></asp:Label>
                                    <asp:Label ID="lblIdHabitacion" runat="server" CssClass="myLabelIzquierda" Text="Label"
                                        Visible="False"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="myLabelIzquierda">Nombre/Nro.:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtCama" runat="server" CssClass="myTexto" Width="200px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvCama" runat="server" ControlToValidate="txtCama"
                                        ErrorMessage="Nombre de la cama" ValidationGroup="Cama">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="myLabelIzquierda">Servicio de la Cama:
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlServicioCama" runat="server" DataTextField="nombre" DataValueField="idServicio" Width="200px">
                                    </asp:DropDownList>
                                    <asp:RangeValidator ID="rvServicioCama" runat="server" ControlToValidate="ddlServicioCama"
                                        ErrorMessage="Servicio" MaximumValue="999999" MinimumValue="1" Type="Integer"
                                        ValidationGroup="Cama">*</asp:RangeValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="myLabelIzquierda">Tipo:
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlTipoCama" runat="server" Width="200px">
                                    </asp:DropDownList>
                                    <asp:RangeValidator ID="rvTipoCama" runat="server" ControlToValidate="ddlTipoCama"
                                        ErrorMessage="Tipo de cama" MaximumValue="999999" MinimumValue="1" Type="Integer"
                                        ValidationGroup="Cama">*</asp:RangeValidator>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <hr />
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;
                                </td>
                                <td align="right">
                                    <asp:Button ID="btnEliminarCama" runat="server" CssClass="myButton" OnClientClick="return PreguntoEliminar();"
                                        OnClick="btnEliminarCama_Click" Text="Eliminar" />
                                    &nbsp;
                                    <asp:Button ID="btnAgregarCama" runat="server" CssClass="myButton" OnClick="btnAgregarCama_Click"
                                        Text="Guardar" ValidationGroup="Cama" />
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;
                                </td>
                                <td align="right">
                                    <asp:CustomValidator ID="cvCama" runat="server" ErrorMessage=" " OnServerValidate="cvCama_ServerValidate"
                                        ValidationGroup="Cama"></asp:CustomValidator>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:ValidationSummary ID="ValidationSummary3" runat="server" HeaderText="Debe completar datos obligatorios"
                                        ShowMessageBox="True" ShowSummary="False" ValidationGroup="Cama" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
        <br />
        &nbsp; &nbsp; &nbsp;
        <br />
    </div>
    <script language="javascript" type="text/javascript">

        function PreguntoEliminar() {
            if (confirm('¿Está seguro de eliminar?'))
                return true;
            else
                return false;
        }
    </script>
</asp:Content>

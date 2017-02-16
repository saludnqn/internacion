<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IngresoCama.aspx.cs" Inherits="WebInternacion2.Ingresos.IngresoCama"
    MasterPageFile="~/Site1.Master" %>

<%@ Register Src="~/UserControls/PacienteInternacion.ascx" TagName="PacInternacion"
    TagPrefix="uc1" %>
<%@ Register Assembly="Anthem" Namespace="Anthem" TagPrefix="anthem" %>
<asp:Content ID="content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="../App_Themes/default/style.css" />
    <link type="text/css" rel="stylesheet" href="../script/jquery-ui-1.7.1.custom.css" />
    <script type="text/javascript" src="../script/jquery.min.js"></script>
    <script type="text/javascript" src="../script/jquery-ui.min.js"></script>
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
<asp:Content ID="content" ContentPlaceHolderID="cuerpo" runat="server">
    <table style="width: 800px;" align="center">
        <tr>
            <td colspan="10" class="mytituloTabla">
                INGRESO<br />
            </td>
        </tr>
        <tr>
            <td colspan="10" class="mytituloGris">
                Asignación de Cama
            </td>
        </tr>
        <tr>
            <td colspan="10">
                <hr class="hrTitulo" />
            </td>
        </tr>
        <tr>
            <td colspan="10">
                <table width="100%">
                    <tr>
                        <td class="myLabelIzquierda" colspan="2">
                            <uc1:PacInternacion ID="DatosPaciente" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="myLabelIzquierda">
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="myLabelIzquierda">
                            Fecha:
                        </td>
                        <td>
                            <input id="txtFecha" runat="server" type="text" maxlength="10" onblur="valFecha(this)"
                                onkeyup="mascara(this,'/',patron,true)" tabindex="2" class="myTexto" style="width: 70px" />
                        </td>
                    </tr>
                    <tr>
                        <td class="myLabelIzquierda">
                            Hora:
                        </td>
                        <td>
                            <input id="txtHora" runat="server" class="myTexto" maxlength="5" onblur="valHora(this)"
                                onkeyup="mascara(this,':',patron,true)" style="width: 50px" tabindex="7" title="Ingrese la hora"
                                type="text" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="myLabelIzquierda" colspan="10">
                <hr />
            </td>
        </tr>
        <tr>
            <td class="myLabelIzquierda">
                Servicio:
            </td>
            <td style="width: 117px">
                <asp:DropDownList ID="ddlServicio" runat="server" OnSelectedIndexChanged="ddlServicio_SelectedIndexChanged2"
                    DataTextField="nombre" DataValueField="idServicio" AutoPostBack="True">
                </asp:DropDownList>
            </td>
            <td style="width: 46px">
                Piso:
            </td>
            <td style="width: 117px">
                <anthem:DropDownList ID="ddlPiso" runat="server" ToolTip="Seleccione una habitacion" DataTextField="nombre" DataValueField="idPiso"
                    TabIndex="4" CssClass="myList" AutoCallBack="True" OnSelectedIndexChanged="ddlPiso_SelectedIndexChanged1">
                </anthem:DropDownList>
            </td>
            <td colspan="2">
                &nbsp;
            </td>
            <td style="width: 103px">
                Habitación:
            </td>
            <td style="width: 116px">
                <anthem:DropDownList ID="ddlHabitacion" runat="server" ToolTip="Seleccione una habitacion"
                    TabIndex="4" CssClass="myList" OnSelectedIndexChanged="ddlHabitacion_SelectedIndexChanged2">
                </anthem:DropDownList>
            </td>
            <td style="width: 8px">
                &nbsp;
            </td>
            <td style="width: 179px">
                <asp:Button ID="btnBuscar" runat="server" Text="Buscar Cama" CssClass="myButton"
                    OnClick="btnBuscar_Click" />
            </td>
        </tr>
        <tr>
            <td class="myLabelIzquierda" style="width: 68px">
                &nbsp;
            </td>
            <td align="right" colspan="9" style="width: 572px">
                <asp:CustomValidator ID="cvCama" runat="server" ErrorMessage="Debe seleccionar una cama para internación"
                    OnServerValidate="cvCama_ServerValidate" ValidationGroup="0"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td class="mytituloGris" colspan="10">
                Camas disponibles<hr />
            </td>
        </tr>
        <tr>
            <td class="myLabelIzquierda" colspan="10">
                <asp:GridView ID="gvLista" runat="server" AutoGenerateColumns="False" BorderColor="#333333"
                    BorderStyle="Solid" BorderWidth="1px" CellPadding="1" DataKeyNames="idCama" EmptyDataText="La internacion no tiene pases"
                    Font-Size="9pt" ForeColor="#666666" PageSize="20" Width="100%" OnRowCommand="gvLista_RowCommand"
                    OnRowDataBound="gvLista_RowDataBound">
                    <RowStyle BackColor="White" Font-Names="Arial" Font-Size="8pt" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="piso" HeaderText="Piso">
                            <ItemStyle Width="25%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="habitacion" HeaderText="Habitacion">
                            <ItemStyle HorizontalAlign="Center" Width="25%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="servicio" HeaderText="Servicio">
                            <ItemStyle Width="25%" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="Cama" DataField="cama">
                            <ItemStyle Width="25%" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:Button ID="btnAsignar" CssClass="myButtonRojo" runat="server" Text="Asignar"
                                    OnClientClick="return Pregunto();" />
                                <%--<asp:CheckBox ID="CheckBox1" runat="server" EnableViewState="true" />--%>
                            </ItemTemplate>
                            <ItemStyle Width="5%" HorizontalAlign="Center" />
                        </asp:TemplateField>
                    </Columns>
                    <PagerSettings Mode="NumericFirstLast" Position="Top" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#E6E6E6" ForeColor="Black" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="White" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#CCCCCC" Font-Bold="False" Font-Names="Arial" Font-Size="8pt"
                        ForeColor="Black" />
                    <EditRowStyle BackColor="#999999" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td colspan="10" align="right">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="10" align="right">
                <asp:Button ID="btnAsignar" runat="server" Text="Asignar Cama Seleccionada" CssClass="myButton"
                    OnClick="btnGuardar_Click" ValidationGroup="0" Visible="False" />
            </td>
        </tr>
        <tr>
            <td style="width: 68px">
                &nbsp;
            </td>
            <td align="right" colspan="9" style="width: 572px">
                &nbsp;
            </td>
        </tr>
    </table>
    <script language="javascript" type="text/javascript">



        function Pregunto() {
            if (confirm('¿Está seguro de asignar la cama seleccionada?'))
                return true;
            else
                return false;
        }
    </script>
</asp:Content>

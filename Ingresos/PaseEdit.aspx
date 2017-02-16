<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaseEdit.aspx.cs" Inherits="WebInternacion2.Ingresos.PaseEdit" MasterPageFile="~/Site1.Master" %>

<%@ Register Src="~/UserControls/PacienteInternacion.ascx" TagName="PacInternacion" TagPrefix="uc1" %>
<%@ Register Assembly="Anthem" Namespace="Anthem" TagPrefix="anthem" %>
<asp:Content ID="content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="../App_Themes/default/style.css" />
    <link type="text/css" rel="stylesheet" href="../script/jquery-ui-1.7.1.custom.css" />
    <script type="text/javascript" src="../script/autocomplete/jquery-1.8.2.js"></script>
    <script type="text/javascript" src="../script/autocomplete/jquery-ui.js"></script>
    <script type="text/javascript" src="../script/jquery.ui.datepicker-es.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#<%=txtFechaPase.ClientID %>").datepicker({
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
    <table class="myTabla" style="width: 900px;">
        <tr>
            <td class="mytituloTabla"> MOVIMIENTOS
            </td>
        </tr>
        <tr>
            <td>
                <hr />
            </td>
        </tr>
        <tr>
            <td class="myLabelIzquierda">
                <uc1:PacInternacion ID="DatosPaciente" runat="server" />
            </td>
        </tr>
        
        <tr>
            <td>
                <table style="width: 100%;">
                    <tr>
                        <td style="vertical-align: top; width: 300px;">
                            <table>
                                <tr>
                                    <td colspan="2" class="mytituloGris">Nuevo Movimiento<hr />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="myLabelIzquierda" style="width: 68px">Fecha:
                                    </td>
                                    <td style="width: 222px">
                                        <input id="txtFechaPase" runat="server" type="text" maxlength="10" onblur="valFecha(this)"
                                            onkeyup="mascara(this,'/',patron,true)" tabindex="1" class="myTexto" style="width: 70px" /><asp:RequiredFieldValidator
                                                ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFechaPase" ErrorMessage="Fecha del Pase"
                                                ValidationGroup="0">*</asp:RequiredFieldValidator>
                                        <asp:CustomValidator ID="cvFecha" runat="server" ControlToValidate="txtFechaPase" ErrorMessage="La fecha del pase no 
                                        puede ser inferior a la del último movimiento ni superior a la fecha de hoy."
                                            OnServerValidate="cvFecha_Server" ValidationGroup="0"></asp:CustomValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="myLabelIzquierda" style="width: 68px">Hora:
                                    </td>
                                    <td style="width: 222px">
                                        <input id="txtHora" runat="server" class="myTexto" maxlength="5" onblur="valHora(this)"
                                            onkeyup="mascara(this,':',patron,true)" style="width: 50px" tabindex="2" title="Ingrese la hora"
                                            type="text" /><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                                ControlToValidate="txtHora" ErrorMessage="Hora del Pase" ValidationGroup="0">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="myLabelIzquierda" style="width: 68px">Servicio:
                                    </td>
                                    <td style="width: 222px">
                                        <anthem:DropDownList ID="ddlServicio" runat="server" ToolTip="Seleccione el servicio" DataTextField="nombre" DataValueField="idServicio"
                                            TabIndex="3" CssClass="myList" OnSelectedIndexChanged="ddlServicio_SelectedIndexChanged"
                                            AutoCallBack="True">
                                        </anthem:DropDownList>
                                        <asp:RangeValidator ID="rvServicio" runat="server" ControlToValidate="ddlServicio"
                                            ErrorMessage="Servicio" MaximumValue="99999999" MinimumValue="1" Type="Integer"
                                            ValidationGroup="0">*</asp:RangeValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="myLabelIzquierda" style="width: 68px">Especialidad:
                                    </td>
                                    <td style="width: 222px">
                                        <anthem:DropDownList ID="ddlEspecialidad" runat="server" ToolTip="Seleccione la Especialidad" DataTextField="nombre" DataValueField="idEspecialidad"
                                            TabIndex="4" CssClass="myList" AutoCallBack="True" Width="200px">
                                        </anthem:DropDownList>
                                        <asp:RangeValidator ID="rvEspecialidad" runat="server" ControlToValidate="ddlEspecialidad"
                                            ErrorMessage="Especialidad" MaximumValue="99999999" MinimumValue="1" Type="Integer"
                                            ValidationGroup="0">*</asp:RangeValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="myLabelIzquierda" style="width: 68px">Habitación:
                                    </td>
                                    <td style="width: 222px">
                                        <anthem:DropDownList ID="ddlHabitacion" runat="server" ToolTip="Seleccione una habitacion"
                                            TabIndex="5" CssClass="myList" AutoCallBack="True" DataValueField="idHabitacion" DataTextField="nombre" OnSelectedIndexChanged="ddlHabitacion_SelectedIndexChanged">
                                        </anthem:DropDownList>
                                        <asp:RangeValidator ID="rvHabitacion" runat="server" ControlToValidate="ddlHabitacion"
                                            ErrorMessage="Habitacion" MaximumValue="99999999" MinimumValue="1" Type="Integer"
                                            ValidationGroup="0">*</asp:RangeValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="myLabelIzquierda" style="width: 68px">Cama:
                                    </td>
                                    <td style="width: 222px">
                                        <anthem:DropDownList ID="ddlCama" runat="server" ToolTip="Seleccione una cama" TabIndex="6" DataValueField="idCama" DataTextField="nombre"
                                            CssClass="myList">
                                        </anthem:DropDownList>
                                        <asp:RangeValidator ID="rvCama" runat="server" ControlToValidate="ddlCama" ErrorMessage="Cama"
                                            MaximumValue="99999999" MinimumValue="1" Type="Integer" ValidationGroup="0">*</asp:RangeValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 68px">
                                        <asp:Button ID="btnVolver" runat="server" Text="Volver" CssClass="myButton" OnClick="btnVolver_Click" TabIndex="8" />
                                    </td>
                                    <td style="width: 222px">
                                        <asp:Button ID="btnGuardar" runat="server" Text="Guardar" OnClientClick="return PreguntoGuardar();"
                                            CssClass="myButton" OnClick="btnGuardar_Click" ValidationGroup="0" TabIndex="7" />
                                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="Debe completar los datos requeridos para el pase:"
                                            ShowMessageBox="True" ValidationGroup="0" ShowSummary="False" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td align="right" style="height: 25px; width: 54px;" colspan="2">&nbsp;&nbsp;
                        </td>
                        <td style="vertical-align: top; width: 506px;">
                            <table style="width: 100%;">
                                <tr>
                                    <td class="mytituloGris">Movimientos realizados
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:GridView ID="gvLista" runat="server" AutoGenerateColumns="False" BorderColor="#333333"
                                            CssClass="table table-striped table-bordered table-hover" BorderStyle="Solid"
                                            BorderWidth="1px" CellPadding="2" DataKeyNames="idPase" EmptyDataText="La internacion no tiene pases"
                                            Font-Size="9pt" ForeColor="#666666" PageSize="20" Width="500px">
                                            <RowStyle BackColor="White" Font-Names="Arial" Font-Size="8pt" ForeColor="#333333" />
                                            <Columns>
                                                <asp:BoundField DataField="fecha" HeaderText="Fecha Mov.">
                                                    <ItemStyle HorizontalAlign="Center" Width="20%" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="hora" HeaderText="Hora">
                                                    <ItemStyle HorizontalAlign="Center" Width="10%" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="nomServicio" HeaderText="Servicio">
                                                    <ItemStyle Width="15%" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="habitacion" HeaderText="Habitacion">
                                                    <ItemStyle HorizontalAlign="Center" Width="15%" />
                                                </asp:BoundField>
                                                <asp:BoundField HeaderText="Cama" DataField="cama">
                                                    <ItemStyle Width="15%" />
                                                </asp:BoundField>
                                                <%--<asp:BoundField DataField="fechaRegistro" HeaderText="Fecha Act.">
                                                    <ItemStyle Font-Size="8pt" Width="20%" />
                                                </asp:BoundField>--%>
                                                <%-- <asp:TemplateField>
                    <ItemTemplate>
                        <asp:ImageButton ID="Eliminar" runat="server" CommandName="Eliminar" 
                            ImageUrl="~/App_Themes/default/images/eliminar.jpg" 
                            OnClientClick="return PreguntoEliminar();" />
                    </ItemTemplate>
                    <ItemStyle Height="20px" HorizontalAlign="Center" Width="20px" />
                </asp:TemplateField>--%>
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
                                    <td>&nbsp;
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="mytituloGris">&nbsp;
            </td>
        </tr>
        <tr>
            <td class="myLabelIzquierda">&nbsp;
            </td>
        </tr>
        <tr>
            <td>&nbsp;
            </td>
        </tr>
    </table>
    <script lang="javascript" type="text/javascript">
        function PreguntoGuardar() {
            if (confirm('¿Está seguro de generar este Movimiento?. No podrá revertirlo.'))
                return true;
            else
                return false;
        }

        function PreguntoEliminar() {
            if (confirm('¿Está seguro de eliminar?'))
                return true;
            else
                return false;
        }
    </script>
</asp:Content>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProcQuirurgicoEdit.aspx.cs"
    EnableEventValidation="false" Inherits="WebInternacion2.Ingresos.ProcQuirurgicoEdit"
    MasterPageFile="~/Site1.Master" %>

<%@ Register Src="~/UserControls/PacienteInternacion.ascx" TagName="PacInternacion"
    TagPrefix="uc1" %>
<%@ Register Assembly="Anthem" Namespace="Anthem" TagPrefix="anthem" %>
<asp:Content ID="content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="../App_Themes/default/style.css" />
    <link type="text/css" rel="stylesheet" href="../script/jquery-ui-1.7.1.custom.css" />
    <script type="text/javascript" src="../script/autocomplete/jquery-1.8.2.js"></script>
    <script type="text/javascript" src="../script/autocomplete/jquery-ui.js"></script>
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
    <style type="text/css">
        .style10
        {
            font-size: 10pt;
            font-family: Calibri;
            color: #333333;
            font-weight: bold;
            width: 91px;
            border-style: none;
            background-color: #FFFFFF;
        }
        .style11
        {
            font-size: 10pt;
            font-family: Calibri;
            color: #333333;
            font-weight: bold;
            width: 749px;
            border-style: none;
            background-color: #FFFFFF;
        }
        .style12
        {
            width: 91px;
        }
    </style>
</asp:Content>
<asp:Content ID="content" ContentPlaceHolderID="cuerpo" runat="server">
    <%--<div align="left" style="width: 850px">--%>
        <br />
        &nbsp; &nbsp; &nbsp;
        <br />
        <table class="myTabla" width="850px;">
            <tr>
                <td colspan="2" class="mytituloTabla">
                    PROCEDIMIENTOS QUIRURGICOS
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <hr />
                </td>
            </tr>
            <tr>
                <td class="myLabelIzquierda" colspan="2">
                    <uc1:PacInternacion ID="DatosPaciente" runat="server" />
                </td>
            </tr>

            <tr>
                <td class="myLabelIzquierda" colspan="2">
                    <asp:GridView ID="gvLista" runat="server" AutoGenerateColumns="False" CellPadding="4" CssClass="table table-striped table-bordered table-hover" 
                        DataKeyNames="idIngresoProcedimiento" EmptyDataText="No hay procedimiento quirurgicos cargados"
                        Font-Size="9pt" ForeColor="#333333" OnRowCommand="gvLista_RowCommand" OnRowDataBound="gvLista_RowDataBound"
                        PageSize="20" Width="100%" GridLines="None" AutoUpdateAfterCallBack="True">
                        <RowStyle BackColor="#F7F6F3" Font-Names="Arial" Font-Size="8pt" ForeColor="#333333" />
                        <Columns>
                            <asp:BoundField DataField="fecha" HeaderText="Fecha y Hora">
                                <ItemStyle Width="10%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="nombre" HeaderText="Procedimiento">
                                <ItemStyle Width="40%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="observaciones" HeaderText="Observaciones">
                                <ItemStyle Width="30%" />
                            </asp:BoundField>
                            <%--<asp:BoundField DataField="username" HeaderText="Usuario">
                                <ItemStyle Width="5%" />
                            </asp:BoundField>--%>
                            <asp:BoundField DataField="fechaRegistro" HeaderText="Fecha Act.">
                                <ItemStyle Font-Size="7pt" Width="20%" />
                            </asp:BoundField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:ImageButton ID="Eliminar" runat="server" CommandName="Eliminar" ImageUrl="~/App_Themes/default/images/eliminar.jpg"
                                        OnClientClick="return PreguntoEliminar();" />
                                </ItemTemplate>
                                <ItemStyle Height="20px" HorizontalAlign="Center" Width="20px" />
                            </asp:TemplateField>
                        </Columns>
                        <PagerSettings Position="Top" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#999999" Font-Bold="True" ForeColor="white" />
                        <EditRowStyle BackColor="#999999" />
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    </asp:GridView>
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <hr />
                </td>
            </tr>  

            <tr>
                <td class="style10">
                    NUEVO:
                </td>
                <td align="right" class="style11">
                    &nbsp;
                </td>
            </tr>
            
            <tr>
                <td></td>
            </tr>

            <tr>
                <td class="style10">
                    Fecha y hora:
                </td>
                <td class="style11">
                    <input id="txtFecha" runat="server" type="text" maxlength="10" onblur="valFecha(this)"
                        onkeyup="mascara(this,'/',patron,true)" tabindex="1" class="myTexto" style="width: 70px" />
                    <input id="txtHora" runat="server" type="text" maxlength="5" style="width: 50px"
                        onblur="valHora(this)" onkeyup="mascara(this,':',patron,true)" tabindex="2" class="myTexto"
                        title="Ingrese la hora" />&nbsp;
                    <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="txtFecha"
                        ErrorMessage="La fecha del procedimiento no puede ser inferior a la fecha de internación"
                        OnServerValidate="CustomValidator1_ServerValidate" ValidationGroup="0">La 
                fecha del procedimiento no puede ser inferior a la fecha de internación</asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td class="style10">
                    Capítulo:
                </td>
                <td class="style11">
                    <anthem:DropDownList ID="ddlCapitulo" runat="server" OnSelectedIndexChanged="ddlCapitulo_SelectedIndexChanged" TabIndex="3"
                        AutoCallBack="True" Width="400px">
                    </anthem:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style10">
                    Procedimiento:<asp:RangeValidator ID="rvProcedimiento" runat="server" ControlToValidate="ddlProcedimiento"
                        ErrorMessage="Procedimiento" MaximumValue="999999" MinimumValue="1" Type="Integer"
                        ValidationGroup="0">*</asp:RangeValidator>
                </td>
                <td class="style11">
                    <anthem:TextBox ID="txtCodigoProcedimiento" runat="server" AutoCallBack="True" OnTextChanged="txtCodigoProcedimiento_TextChanged"  TabIndex="4"
                        Width="100px" CssClass="myTexto"></anthem:TextBox>
                    <anthem:DropDownList ID="ddlProcedimiento" runat="server" OnSelectedIndexChanged="ddlProcedimiento_SelectedIndexChanged" TabIndex="5"
                        AutoCallBack="True" Width="400px">
                    </anthem:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style10" style="vertical-align: top;">
                    Observaciones:
                </td>
                <td class="style11">
                    <asp:TextBox ID="txtObservaciones" runat="server" Rows="2" TextMode="MultiLine" Width="500px" CssClass="myTexto" TabIndex="6"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style12">
                    <asp:Button ID="btnVolver" runat="server" Text="Volver" CssClass="myButton"  TabIndex="10"
                                            onclick="btnVolver_Click"  />
                </td>
                <td class="style11">
                    <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="myButton" OnClick="btnGuardar_Click" TabIndex="7"
                        ValidationGroup="0" />
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="Debe completar los datos requeridos:"
                        ShowMessageBox="True" ShowSummary="False" ValidationGroup="0" />
                </td>
            </tr>            
            <tr>
                <td colspan="2">
                    <hr />
                </td>
            </tr>            
        </table>
    <%--</div>--%>
    <script language="javascript" type="text/javascript">

        function PreguntoGuardar() {
            if (confirm('¿Está seguro de generar este pase?. No podrá revertirlo.'))
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

<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true"
    CodeBehind="PrestarCama.aspx.cs" Inherits="WebInternacion2.Administracion.PrestarCama" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Superior" runat="server">
    <div align="left" style="width: 1000px">
        <br />
        &nbsp; &nbsp; &nbsp;
        <br />
        <table class="style1">
            <tr>
                <td class="myLabelIzquierda" rowspan="10" style="vertical-align: top">
                    <img alt="" src="../App_Themes/default/images/icono_cama_bloqueo.jpg" />
                </td>
                <td class="myLabelIzquierda" colspan="2">
                    PRESTAMO DE CAMA<hr />
                </td>
            </tr>
            <tr>
                <td class="style5">
                    Piso:
                </td>
                <td class="style6">
                    <asp:Label ID="lblPiso" runat="server" Text="Label" CssClass="myLabelIzquierda"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style5">
                    Habitación:
                </td>
                <td class="style6">
                    <asp:Label ID="lblHabitacion" runat="server" Text="Label" CssClass="myLabelIzquierda"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style5">
                    Servicio:
                </td>
                <td class="style6">
                    <asp:Label ID="lblServicio" runat="server" Text="Label" CssClass="myLabelIzquierda"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style5">
                    Nombre:
                </td>
                <td class="style6">
                    <asp:Label ID="lblCama" runat="server" Text="Label" CssClass="myLabelIzquierda"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <hr />
                </td>
            </tr>
            <tr>
                <td align="left" class="style5">
                    Servicio:
                </td>
                <td align="left" class="style6">
                    <asp:DropDownList ID="ddlServicio" runat="server" DataTextField="nombre" DataValueField="idServicio">
                    </asp:DropDownList>
                    <asp:RangeValidator ID="rvServicio" runat="server" ControlToValidate="ddlServicio"
                        ErrorMessage="Elija un servicio" MaximumValue="99999" MinimumValue="1" Type="Integer"
                        ValidationGroup="0">*</asp:RangeValidator>
                </td>
            </tr>
            <tr>
                <td align="left" class="myLabelIzquierda" colspan="2">
                    <hr />
                </td>
            </tr>
            <tr>
                <td class="style7">
                    &nbsp;
                </td>
                <td align="right" class="style6">
                    <asp:Button ID="btnVolver" runat="server" Text="Volver" CssClass="myButton" OnClick="btnVolver_Click" />
                    <asp:Button ID="btnGuardar" runat="server" CssClass="myButton" Text="Guardar" OnClick="btnGuardar_Click"
                        ValidationGroup="0" OnClientClick="return PreguntoGuardar();" />
                </td>
            </tr>
            <tr>
                <td class="style7">
                    &nbsp;
                </td>
                <td class="style6">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="Debe completar los datos requeridos:"
                        ShowMessageBox="True" ValidationGroup="0" />
                </td>
            </tr>
        </table>
        <script language="javascript" type="text/javascript">

            function PreguntoGuardar() {
                if (confirm('¿Está seguro que quiere prestar la cama al servicio seleccionado?'))
                    return true;
                else
                    return false;
            }
 
        </script>
    </div>
</asp:Content>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BloqueoCamaEdit.aspx.cs"
    Inherits="WebInternacion.Administracion.BloqueoCamaEdit" MasterPageFile="~/Site1.Master" %>

<asp:Content ID="content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 350px;
        }
        .style5
        {
            border-style: none;
            font-size: 10pt;
            font-family: Calibri;
            color: #333333;
            font-weight: bold;
            width: 61px;
        }
        .style6
        {
            width: 279px;
        }
        .style7
        {
            width: 61px;
        }
    </style>
</asp:Content>
<asp:Content ID="content2" ContentPlaceHolderID="cuerpo" runat="server">
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
                    BLOQUEO DE CAMA<hr />
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
                    Motivo:
                </td>
                <td align="left" class="style6">
                    <asp:DropDownList ID="ddlMotivoBloqueo" runat="server" DataTextField="nombre" DataValueField="idMotivoBloqueo">
                    </asp:DropDownList>
                    <asp:RangeValidator ID="rvMotivoBloqueo" runat="server" ControlToValidate="ddlMotivoBloqueo"
                        ErrorMessage="Motivo de Bloqueo" MaximumValue="99999" MinimumValue="1" Type="Integer"
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
                if (confirm('¿Está seguro de bloquear la cama seleccionada?'))
                    return true;
                else
                    return false;
            }
 
        </script>
    </div>
</asp:Content>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IngresoInforme.aspx.cs"
    Inherits="WebInternacion2.Ingresos.IngresoInforme" MasterPageFile="~/Site1.Master" %>

<asp:Content ID="content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="../App_Themes/default/style.css" />
</asp:Content>
<asp:Content ID="content" ContentPlaceHolderID="cuerpo" runat="server">
    <table style="width: 650px; margin: 0 auto;">
        <tr>
            <td colspan="2" class="mytituloTabla">INGRESO
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <hr />
            </td>
        </tr>
        <tr>
            <td colspan="2">Se ha registrado los cambios en la internación número:&nbsp;
                <asp:Label CssClass="myLabelIzquierda" ID="lblNumeroIngreso" runat="server" Text="Label"
                    Font-Size="14pt"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">Paciente:&nbsp;<asp:Label CssClass="myLabelIzquierda" ID="lblPaciente" runat="server"
                Text="Label" Font-Size="14pt"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <hr />
            </td>
        </tr>
        <tr>
            <td class="myLabelIzquierda">
                <%--<asp:LinkButton ID="lnkHojaIngreso" runat="server" onclick="LinkButton3_Click" 
                    Font-Bold="True">Descargar Hoja 
                de Ingreso</asp:LinkButton>--%>
            </td>
            <td>&nbsp;
            </td>
        </tr>
        <tr>
            <td class="myLabelIzquierda">
                <asp:LinkButton ID="lnkHospitalizacion" runat="server" Font-Bold="True" CausesValidation="False"
                    OnClick="lnkHospitalizacion_Click">Descargar Informe de Hospitalización</asp:LinkButton>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btnVolver" runat="server" Text="Volver" CssClass="myButton"
                    OnClick="btnVolver_Click" />
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
            <td align="right">&nbsp;
            </td>
        </tr>
    </table>
</asp:Content>

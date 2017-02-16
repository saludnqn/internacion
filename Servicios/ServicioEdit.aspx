<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ServicioEdit.aspx.cs" Inherits="WebLab.Sectores.SectorEdit"
    MasterPageFile="~/Site1.Master" %>

<asp:Content ID="content2" ContentPlaceHolderID="cuerpo" runat="server">
    <table width="500px" align="center" class="myTabla">
        <tr>
            <td class="myLabelIzquierda">
                <b class="mytituloTabla">SERVICIO</b>
            </td>
            <td colspan="2" align="right">
                <%--<a href="../Help/Documentos/Servicios.htm" target="_blank">
                    <img style="border: none;" alt="Ayuda" src="../App_Themes/default/images/information.png" /></a>--%>
            </td>
        </tr>
        <tr>
            <td class="myLabelIzquierda" colspan="3">
                <hr class="hrTitulo" />
            </td>
        </tr>
        <tr>
            <td class="myLabelIzquierda">
                Nombre:
            </td>
            <td colspan="2">
                <asp:TextBox ID="txtNombre" runat="server" Width="284px" CssClass="myTexto" TabIndex="1"
                    ToolTip="Ingrese el nombre del sector" MaxLength="50"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre"
                    ErrorMessage="Nombre" ValidationGroup="0">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <hr />
            </td>
        </tr>
        <tr>
            <td>
                <asp:LinkButton ID="lnkRegresar" runat="server" CssClass="myLink" PostBackUrl="ServicioList.aspx"
                    CausesValidation="False">Regresar</asp:LinkButton>
            </td>
            <td align="right" colspan="2">
                <asp:Button ID="btnGuardar" runat="server" OnClick="btnGuardar_Click" Text="Guardar"
                    CssClass="myButton" TabIndex="4" ToolTip="Haga clic aquí para guardar los datos"
                    ValidationGroup="0" />
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            <td align="right" colspan="2">
                <asp:ValidationSummary ID="vs" runat="server" HeaderText="Debe completar los datos marcados como requeridos:"
                    ShowMessageBox="True" ShowSummary="False" ValidationGroup="0" />
            </td>
        </tr>
    </table>
</asp:Content>

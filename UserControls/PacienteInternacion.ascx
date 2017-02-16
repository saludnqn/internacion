<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PacienteInternacion.ascx.cs"
    Inherits="WebInternacion2.UserControls.PacienteInternacion" %>
<link rel="stylesheet" type="text/css" href="../App_Themes/default/style.css" />
<table style="width: 900px; background-color: #FCFCFC;">
    <tr>
        <td rowspan="13" style="vertical-align: top;" class="style3" align="center">
            <img alt="" src="../App_Themes/default/images/icono_cama_rojo.png" /><br />
            <br />
            <asp:Image ID="imgPaciente" runat="server" />
        </td>        
        <tr>
            <td class="style7">
                Internación Nro.:
            </td>
            <td class="style7">
                <asp:Label ID="lblNumeroIngreso" runat="server" Text="Label" Font-Bold="True" Font-Size="10pt"></asp:Label>
            </td>
        </tr>
    <tr>
        <td class="style7">
            Historia Clinica:
        </td>
        <td class="style7">
            <asp:Label ID="lblHC" runat="server" Text="Label" Font-Bold="True" Font-Size="10pt"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="style7">
            Paciente:
        </td>
        <td class="style7">
            <asp:Label ID="lblPaciente" runat="server" Text="Label" Font-Bold="True" Font-Size="10pt"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="style7">
            Fecha de Nac.:
        </td>
        <td class="style7">
            <asp:Label ID="lblFechaNacimiento" runat="server" Text="Label" Font-Bold="True"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="style7">
            Edad al ingreso:
        </td>
        <td class="style7">
            <asp:Label ID="lblEdad" runat="server" Text="Label" Font-Bold="True"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="style7">
            Sexo:
        </td>
        <td class="style7">
            <asp:Label ID="lblSexo" runat="server" Text="Label" Font-Bold="True"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="style7">
            Obra Social:
        </td>
        <td style="vertical-align: top;" class="style7">
            <asp:Label ID="lblObraSocial" runat="server" Text="Label" Font-Bold="True"></asp:Label>
        </td>
    </tr>
  
    <tr>
        <td class="style7">
            Fecha Internación:
        </td>
        <td style="vertical-align: top;" class="style7">
            <asp:Label ID="lblFechaInternacion" runat="server" Text="Label" Font-Bold="True"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="style7">
            Tipo de Ingreso:
        </td>
        <td style="vertical-align: top;" class="style7">
            <asp:Label ID="lblTipoIngreso" runat="server" Text="Label" Font-Bold="True"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="style7">
            Médico Solicitante:
        </td>
        <td style="vertical-align: top;" class="style7">
            <asp:Label ID="lblMedicoSolicitante" runat="server" Text="Label" Font-Bold="True"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="style7">
            &nbsp;
        </td>
        <td class="style7">
            &nbsp;
        </td>
    </tr>
    <tr>
        <td class="style7">
            &nbsp;
        </td>
        <td style="vertical-align: top;" class="style7">
            <asp:HyperLink ID="hypInfoInternacion" runat="server">Editar Ficha de Ingreso</asp:HyperLink>
        </td>
    </tr>
</table>

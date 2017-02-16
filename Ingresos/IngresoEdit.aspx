 <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IngresoEdit.aspx.cs" Inherits="WebInternacion2.Ingresos.IngresoEdit"
    MasterPageFile="~/Site1.Master" %>

<%@ Register Src="~/UserControls/ObrasSociales.ascx" TagName="oSocial" TagPrefix="uc1" %>
<%@ Register Assembly="Anthem" Namespace="Anthem" TagPrefix="anthem" %>
<asp:Content ID="content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="../App_Themes/default/style.css" />
    <link type="text/css" rel="stylesheet" href="../script/jquery-ui-1.7.1.custom.css" />
    <script type="text/javascript" src="../script/jquery.min.js"></script>
    <script type="text/javascript" src="../script/jquery-ui.min.js"></script>
    <%--<link type="text/css" rel="stylesheet" href="../script/jquery.ui.autocomplete.css" />
    <link rel="stylesheet" href="../script/autocomplete/jquery-ui.css" />--%>
    <script type="text/javascript" src="../script/autocomplete/jquery-1.8.2.js"></script>
    <script type="text/javascript" src="../script/autocomplete/jquery-ui.js"></script>
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
    <%--<div align="center" style="width: 1000px">--%>
    <br />
    &nbsp; &nbsp; &nbsp;
    <br />
    <table style="width: 800px; margin-left: auto; margin-right: auto; margin-bottom: 15px;
        border: 2px solid #666666;">
        <tr>
            <td colspan="2" class="mytituloTabla" style="vertical-align: top">
                INGRESO
            </td>
        </tr>
        <tr>
            <td colspan="2" class="mytituloGris">
                Ficha de Ingreso
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <hr class="hrTitulo" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="lblPaciente" runat="server" Text="Label" Font-Bold="True" Font-Size="12pt"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="myLabelIzquierda">
                Historia Clinica:
            </td>
            <td>
                <asp:TextBox ID="txtHistoriaClinica" Enabled="false" runat="server" BorderColor="#666633"
                    BorderStyle="None" ReadOnly="True" Width="53px"></asp:TextBox>
                <asp:HyperLink ID="hlkHClinica" Visible="false" runat="server" ForeColor="DarkGreen">Registrar Nro. de Historia Clínica</asp:HyperLink>
                <asp:RequiredFieldValidator ID="rfvHistoriaClinica" ControlToValidate="txtHistoriaClinica"
                    runat="server" ErrorMessage="Debe asignar un número de Historia Clínica" ValidationGroup="0">
                </asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="myLabelIzquierda" style="width: 136px">
                Fecha de Nacimiento:
            </td>
            <td style="width: 504px">
                <asp:Label ID="lblFechaNacimiento" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="myLabelIzquierda">
                Edad al ingreso:
            </td>
            <td>
                <asp:Label ID="lblEdad" runat="server" Text="Label"></asp:Label>
                <asp:Label ID="lblEdadAnios" runat="server" Text="Label" Visible="False"></asp:Label>
                <asp:Label ID="lblEdadMeses" runat="server" Text="Label" Visible="False"></asp:Label>
                <asp:Label ID="lblEdadDias" runat="server" Text="Label" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="myLabelIzquierda" style="width: 136px">
                Sexo:
            </td>
            <td>
                <asp:Label ID="lblSexo" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="myLabelIzquierda" style="vertical-align: top;" colspan="2">
                <hr />
            </td>
        </tr>
        <tr>
            <td class="myLabelIzquierda" style="width: 136px; vertical-align: top;">
                Cobertura Social:
            </td>
            <td style="width: 504px">
                <uc1:oSocial ID="idObraS" runat="server" />
                <%--  <asp:DropDownList ID="ddlObraSocial" runat="server" Width="450px">
                </asp:DropDownList>--%>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <hr />
            </td>
        </tr>
        <tr>
            <td class="myLabelIzquierda" style="width: 136px">
                Fecha Ingreso:
            </td>
            <td style="width: 504px">
                <input id="txtFecha" runat="server" type="text" maxlength="10" onblur="valFecha(this)"
                    onkeyup="mascara(this,'/',patron,true)" format="dd/MM/yyyy" tabindex="2" class="myTexto"
                    style="width: 70px" />
                <asp:CustomValidator ID="cvFecha" runat="server" ControlToValidate="txtFecha" ErrorMessage="La fecha de internación no puede ser superior al día de hoy"
                    OnServerValidate="cvFecha_Server" ValidationGroup="0"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td class="myLabelIzquierda" style="width: 136px">
                Hora Ingreso:<asp:RequiredFieldValidator ID="rfvHora" runat="server" ControlToValidate="txtHora"
                    ErrorMessage="Hora ingreso" ValidationGroup="0">*</asp:RequiredFieldValidator>
            </td>
            <td style="width: 504px">
                <input id="txtHora" runat="server" type="text" maxlength="5" style="width: 50px"
                    onblur="valHora(this)" onkeyup="mascara(this,':',patron,true)" tabindex="7" class="myTexto"
                    title="Ingrese la hora" />&nbsp;
            </td>
        </tr>
        <tr>
            <td class="myLabelIzquierda" style="width: 136px">
                Tipo de Ingreso:<anthem:RequiredFieldValidator ID="rfvTipoIngreso" runat="server"
                    ControlToValidate="rdbTipoIngreso" ErrorMessage="Tipo de Ingreso" ValidationGroup="0">*</anthem:RequiredFieldValidator>
            </td>
            <td class="myLabelIzquierda" style="width: 504px">
                <anthem:RadioButtonList ID="rdbTipoIngreso" runat="server" RepeatDirection="Horizontal"
                    DataTextField="nombre" DataValueField="idTipoIngreso" AutoCallBack="True" OnSelectedIndexChanged="rdbTipoIngreso_SelectedIndexChanged">
                </anthem:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="myLabelIzquierda" style="width: 136px">
                Efector de Origen:<anthem:RangeValidator ID="rvEfectorOrigen" runat="server" ControlToValidate="ddlEfectorOrigen"
                    ErrorMessage="Servicio" MaximumValue="999999" MinimumValue="1" Type="Integer"
                    ValidationGroup="0" Enabled="False">*</anthem:RangeValidator>
            </td>
            <td class="myLabelIzquierda" style="width: 504px">
                <anthem:DropDownList ID="ddlEfectorOrigen" runat="server" AutoCallBack="True" DataTextField="nombre"
                    DataValueField="idEfector">
                </anthem:DropDownList>
                <%--<anthem:TextBox ID="txtOtroEfectorOrigen" runat="server" Enabled="False"></anthem:TextBox>--%>
            </td>
        </tr>
        <tr>
            <td class="myLabelIzquierda" style="width: 136px">
                &nbsp;
            </td>
            <td class="myLabelIzquierda2" style="width: 504px; font-size: 9px;">
                Seleccionar efector de origen en caso de traslado
            </td>
        </tr>
        <tr>
            <td class="myLabelIzquierda" style="width: 136px">
                Servicio que interna:<asp:RangeValidator ID="rvServicio" runat="server" ControlToValidate="ddlServicio"
                    ErrorMessage="Servicio" MaximumValue="999999" MinimumValue="1" Type="Integer"
                    ValidationGroup="0">*</asp:RangeValidator>
            </td>
            <td class="myLabelIzquierda" style="width: 504px">
                <asp:DropDownList ID="ddlServicio" Enabled="false" runat="server" DataTextField="nombre"
                    DataValueField="idServicio">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="myLabelIzquierda">
                Especialidad:
                <asp:RangeValidator ID="rvEspecialidad" runat="server" ControlToValidate="ddlEspecialidad"
                    ErrorMessage="Agregar Especialidad" MaximumValue="999999" MinimumValue="1" Type="Integer"
                    ValidationGroup="0">*</asp:RangeValidator>
            </td>
            <td>
                <asp:DropDownList ID="ddlEspecialidad" runat="server" DataTextField="nombre" DataValueField="idEspecialidad">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="myLabelIzquierda" style="width: 136px; vertical-align: top;">
                Diagnóstico al Ingreso:
            </td>
            <td style="width: 504px">
                <asp:TextBox ID="txtMotivoIngreso" runat="server" Rows="2" TextMode="MultiLine" Width="400px"
                    CssClass="myTexto" MaxLength="450"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="myLabelIzquierda" style="width: 136px">
                Medico solicitante:
                <asp:RangeValidator ID="rvMedicoSolicitante" runat="server" ControlToValidate="ddlMedicoSolicitante"
                    ErrorMessage="Médico Solicitante" MaximumValue="999999" MinimumValue="1" Type="Integer"
                    ValidationGroup="0">*</asp:RangeValidator>
            </td>
            <td style="width: 504px">
                <asp:DropDownList ID="ddlMedicoSolicitante" runat="server" DataTextField="ApellidoyNombre"
                    DataValueField="idProfesional">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <hr />
            </td>
        </tr>
        <tr>
            <td class="myLabelIzquierda" style="width: 136px">
                Nivel de Instrucción: <asp:RangeValidator ID="rvNivelInstruccion" runat="server" ControlToValidate="ddlNivelInstruccion"
                    ErrorMessage="Nivel de Instrucción" MaximumValue="999999" MinimumValue="1" Type="Integer"
                    ValidationGroup="0">*</asp:RangeValidator>
            </td>
            <td style="width: 504px">
                <asp:DropDownList ID="ddlNivelInstruccion" runat="server" DataTextField="nombre"
                    DataValueField="idNivelInstruccion">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="myLabelIzquierda" style="width: 136px">
                &nbsp;
            </td>
            <td class="myLabelIzquierda2" style="width: 504px">
                Ultimo nivel de instrucción alcanzado. Para menores de 14 años consignar nivel de
                instrucción del tutor.
            </td>
        </tr>
        <tr>
            <td class="myLabelIzquierda" colspan="2">
                <hr />
            </td>
        </tr>
        <tr>
            <td class="myLabelIzquierda" style="width: 136px">
                Situación Laboral: <asp:RangeValidator ID="rvSituacionLaboral" runat="server" ControlToValidate="ddlSituacionLaboral"
                    ErrorMessage="Situacion Laboral" MaximumValue="999999" MinimumValue="1" Type="Integer"
                    ValidationGroup="0">*</asp:RangeValidator>
            </td>
            <td style="width: 504px">
                <asp:DropDownList ID="ddlSituacionLaboral" runat="server" DataTextField="nombre"
                    DataValueField="idSituacionLaboral">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="myLabelIzquierda" style="width: 136px">
                &nbsp;
            </td>
            <td class="myLabelIzquierda2" style="width: 504px">
                &nbsp;Para menores de 14 años consignar nivel de instrucción del tutor.
            </td>
        </tr>
        <tr>
            <td class="myLabelIzquierda" colspan="2">
                <hr />
            </td>
        </tr>
        <tr>
            <td class="myLabelIzquierda" style="width: 136px">
                Ocupación:
            </td>
            <td style="width: 504px">
                <asp:DropDownList ID="ddlOcupacion" runat="server" DataTextField="nombre" DataValueField="idOcupacion">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="myLabelIzquierda" style="width: 136px">
                &nbsp;
            </td>
            <td class="myLabelIzquierda2" style="width: 504px">
                &nbsp;Para menores de 14 años consignar nivel de instrucción del tutor.
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <hr />
            </td>
        </tr>
        <%-- <tr>
            <td colspan="2">
              <hr /></td>
        </tr>--%>
        <%-- <tr>
            <td colspan="2">
              <hr /></td>
        </tr>--%>
        <tr>
            <td style="width: 136px">
                &nbsp;
            </td>
            <td align="right" style="width: 504px">
                <asp:Button ID="btnVolver" runat="server" Text="Volver" CssClass="myButton" OnClick="btnVolver_Click" />
                <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="myButton" OnClick="btnGuardar_Click"
                    ValidationGroup="0" />
            </td>
        </tr>
        <tr>
            <td style="width: 136px">
                &nbsp;
            </td>
            <td align="right" style="width: 504px">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="Debe completar los siguientes datos obligatorios:"
                    ShowMessageBox="True" ShowSummary="False" ValidationGroup="0" />
            </td>
        </tr>
    </table>
    <%-- </div>--%>
</asp:Content>

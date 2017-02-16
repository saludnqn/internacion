<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EgresoEdit.aspx.cs" Inherits="WebInternacion2.Ingresos.EgresoEdit"
    MasterPageFile="~/Site1.Master" %>

<%@ Register Src="~/UserControls/PacienteInternacion.ascx" TagName="PacInternacion"
    TagPrefix="uc1" %>
<%@ Register Src="~/UserControls/Cie10.ascx" TagName="DiagnosticoPrincipal" TagPrefix="uc1" %>
<%@ Register Assembly="Anthem" Namespace="Anthem" TagPrefix="anthem" %>
<asp:Content ID="content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="../App_Themes/default/style.css" />
    <link type="text/css" rel="stylesheet" href="../script/jquery-ui-1.7.1.custom.css" />
    <script type="text/javascript" src="../script/autocomplete/jquery-1.8.2.js"></script>
    <script type="text/javascript" src="../script/autocomplete/jquery-ui.js"></script>
    <%-- <script type="text/javascript"      src="../script/jquery.min.js"></script> 
  <script type="text/javascript"      src="../script/jquery-ui.min.js"></script> --%>
    <script type="text/javascript" src="../script/jquery.ui.datepicker-es.js"></script>
    <script type="text/javascript">

        $(document).ready(function () {
            $(".tab_content").hide();
            $("ul.tabs li:first").addClass("active").show();
            $(".tab_content:first").show();

            $("ul.tabs li").click(function () {
                $("ul.tabs li").removeClass("active");
                $(this).addClass("active");
                $(".tab_content").hide();

                var activeTab = $(this).find("a").attr("href");
                $(activeTab).fadeIn();
                return false;
            });
        });



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
    <table class="myTabla">
        <tr>
            <td colspan="2" class="mytituloTabla">
                EGRESO
                <hr />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <uc1:PacInternacion ID="DatosPaciente" runat="server" />
            </td>
        </tr>        
        <tr>
            <td class="myLabelIzquierda">
                <asp:Label ID="lblFechaEgreso" runat="server" Text="Fecha de Egreso:"></asp:Label>
                <asp:RequiredFieldValidator ID="rfvFecha" runat="server" ControlToValidate="txtFecha"
                    ErrorMessage="Fecha Egreso" ValidationGroup="0">*</asp:RequiredFieldValidator>
            </td>
            <td>
                <input id="txtFecha" runat="server" type="text" maxlength="10" onblur="valFecha(this)"
                    onkeyup="mascara(this,'/',patron,true)" tabindex="1" class="myTexto" style="width: 70px" />
                
                &nbsp;<asp:CustomValidator ID="cvFecha" runat="server" ControlToValidate="txtFecha"
                    OnServerValidate="cvFecha_Server" ValidationGroup="0"></asp:CustomValidator>
                <%--<asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="txtFecha"
                    OnServerValidate="CustomValidator1_ServerValidate" ValidationGroup="0"></asp:CustomValidator>--%>
            </td>
        </tr>
        <tr>
            <td class="myLabelIzquierda">
                <asp:Label ID="Label1" runat="server" Text="Hora de Egreso"></asp:Label>
                <asp:RequiredFieldValidator ID="rfvHora" runat="server" ControlToValidate="txtHora"
                    ErrorMessage="Hora egreso" ValidationGroup="0">*</asp:RequiredFieldValidator>
            </td>
            <td>
                <input id="txtHora" runat="server" type="text" maxlength="5" style="width: 50px"
                    onblur="valHora(this)" onkeyup="mascara(this,':',patron,true)" tabindex="2" class="myTexto"
                    title="Ingrese la hora" />&nbsp;
                
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <hr style="height: 4px" />
            </td>
        </tr>
        <tr>
            <td class="myLabelIzquierda" style="vertical-align: top;">
                <asp:Label ID="lblTipoEgreso" runat="server" Text="Tipo de Egreso:"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="rdbTipoEgreso"
                    ErrorMessage="Tipo de Egreso" ValidationGroup="0">*</asp:RequiredFieldValidator>
            </td>
            <td class="myLabel">
                <anthem:RadioButtonList ID="rdbTipoEgreso" runat="server" RepeatDirection="Horizontal" TabIndex="3"
                    DataTextField="nombre" DataValueField="idTipoEgreso" OnSelectedIndexChanged="rdbTipoEgreso_SelectedIndexChanged"
                    AutoCallBack="True">
                </anthem:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="myLabelIzquierda">
                <asp:Label ID="lblEfectorDestino" runat="server" Text="Efector de Destino:"></asp:Label>
                <anthem:RangeValidator ID="rvEfectorOrigen" runat="server" ControlToValidate="ddlEfectorDestino"
                    ErrorMessage="Efector Destino" MaximumValue="999999" MinimumValue="1" Type="Integer"
                    ValidationGroup="0" Enabled="False">*</anthem:RangeValidator>
            </td>
            <td class="myLabelIzquierda">
                <anthem:DropDownList ID="ddlEfectorDestino" runat="server" AutoCallBack="True" OnSelectedIndexChanged="ddlEfectorDestino_SelectedIndexChanged" TabIndex="4"
                    DataTextField="nombre" DataValueField="idEfector">
                </anthem:DropDownList>
                <%--<anthem:TextBox ID="txtOtroEfectorDestino" runat="server" Enabled="False"></anthem:TextBox>--%>
            </td>
        </tr>
       <%-- <tr>
            <td class="myLabelIzquierda" style="vertical-align: top;">
                <asp:Label ID="lblObservaciones" runat="server" Text="Observaciones:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtObservacionesEgreso" runat="server" Rows="4" TextMode="MultiLine" TabIndex="5"
                    Width="400px" CssClass="myTexto"></asp:TextBox>
            </td>
        </tr>--%>

        <tr>
            <td colspan="2">
                <anthem:Panel runat="server" ID="pnlProlongaInternacion">
                    <table>
                        <tr>
            <td class="myLabelIzquierda" style="vertical-align: top;">
                <asp:Label ID="lblProlongaInternacion" runat="server" Text="Prolonga la Internación (ocupacion de la cama)"></asp:Label>
            </td>
            <td>
                <anthem:RadioButtonList ID="rdbProlongaInternacion" runat="server" RepeatDirection="Horizontal" TabIndex="6"
                    OnSelectedIndexChanged="rdbProlongaInternacion_SelectedIndexChanged" AutoUpdateAfterCallBack="true" AutoPostBack="true">
                    <Items>
                        <asp:ListItem>Si</asp:ListItem>
                        <asp:ListItem Selected="True">No</asp:ListItem>
                    </Items>
                </anthem:RadioButtonList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="rdbProlongaInternacion"
                    ErrorMessage="Prolonga internación" ValidationGroup="0">*</asp:RequiredFieldValidator>
            </td>
        </tr>

                        <tr>
            <td id="motivoProlongaInternacion" runat="server" visible="false" class="myLabelIzquierda" style="vertical-align: top;">
                <asp:Label ID="lblMotivoProlongaInternacion" runat="server" Text="Motivo por el que prolonga la internación:"></asp:Label>
            </td>
            <td id="prolongaInternacion" runat="server" visible="false">
                <%--<anthem:TextBox ID="txtCodigoProlongaInternacion" Enabled="false" runat="server"
                    OnTextChanged="txtCodigoProlongaInternacion_TextChanged" Width="55px" CssClass="myTextoGde"
                    TabIndex="3" ToolTip="Codigo Cie10" AutoCallBack="True"></anthem:TextBox>--%>
                <uc1:DiagnosticoPrincipal ID="txtCodigoProlongaInternacion" runat="server"    />
                <anthem:Label ID="lblDiagnosticoProlongaInternacion" runat="server" Font-Bold="True"
                    ForeColor="#CC3300" TabIndex="100" Font-Italic="True"></anthem:Label>
                <anthem:Label ID="lblError" runat="server" Font-Bold="True" ForeColor="#CC0000" TabIndex="100"
                    Font-Italic="True"></anthem:Label>
                <anthem:Label ID="lblIdDiagnosticoProlongaInternacion" runat="server" Font-Bold="True"
                    ForeColor="#CC3300" TabIndex="100" Font-Italic="True" Visible="False"></anthem:Label>
                <%--<anthem:RequiredFieldValidator ID="rfvdiag" runat="server" ControlToValidate="txtCodigoProlongaInternacion"
                    ErrorMessage="Motivo que prolonga la internacion" ValidationGroup="0">*</anthem:RequiredFieldValidator>--%>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
                    </table>

                </anthem:Panel>
            </td>
        </tr>
        
        
        <%--<tr>
            <td class="myLabelIzquierda2" style="vertical-align: top; " colspan="3">
                Si el paciente no desocupa la cama ingresar el diagnostico por el cual se 
                prolonga la internación</td>
        </tr>--%>
        <%--<tr>
            <td class="myLabelIzquierda2" style="vertical-align: top; " colspan="3">
                Motivo que prolonga la internación. 
                       
                                    </td>
        </tr>--%>
        
        <%--<tr>
            <td class="myLabelIzquierda" colspan="3">
                <hr />
              
               
                </td>
        </tr>--%>
        <tr>
            <td>
                &nbsp;
            </td>
            <td align="right" style="padding-bottom: 10px">
                <asp:Button ID="btnVolver" runat="server" Text="Volver" CssClass="myButton"  TabIndex="7"
                                            onclick="btnVolver_Click"  />
                <asp:Button ID="btnGuardar" runat="server" Text="Guardar y terminar" CssClass="myButton" OnClick="btnGuardar_Click" TabIndex="7"
                    ValidationGroup="0" />
                  &nbsp;  &nbsp;
                <asp:Button ID="btnGuardarySeguir" runat="server" Text="Guardar y seguir" CssClass="myButton" OnClick="btnGuardarySeguir_Click" TabIndex="7"
                    ValidationGroup="0" />
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="De completar los datos obligatorios:"
                    ShowMessageBox="True" ShowSummary="False" ValidationGroup="0" />
            </td>
        </tr>
    </table>
</asp:Content>

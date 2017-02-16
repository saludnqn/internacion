<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ObrasSociales.ascx.cs" Inherits="WebInternacion2.UserControls.ObrasSociales" %>

 <style type="text/css">
     .style1
     {
         width: 624px;
     }
     .style2
     {
         width: 488px;
     }
     .style3
     {
         width: 126px;
     }
 </style>

 <%-- <link type="text/css" rel="stylesheet" href="../script/jquery-ui-1.7.1.custom.css"/>
  <script type="text/javascript" src="../script/jquery.min.js"></script>
  <script type="text/javascript" src="../script/jquery-ui.min.js"></script>--%>
 

<script type="text/javascript">
    $(function () {
        $('#<%= txtAutoOs.ClientID %>').autocomplete({ source: '<%= ResolveUrl("~/Services/ObraSocialServices.aspx") %>', minlenght: 3,
            focus: function (event, ui) {
                $("#<%= txtAutoOs.ClientID %>").val(ui.item.nombre);
                return false;
            },
            select: function (event, ui) {
                if (ui.item.id != -1) {
                    $("#<%= txtAutoOs.ClientID %>").val(ui.item.nombre);
                    $('#<%= lblNombre.ClientID %>').text(ui.item.nombre);
                    $('#<%= lblSigla.ClientID %>').text("(" + ui.item.sigla + ")");
                    $('#<%= lblCodigoNacion.ClientID %>').text(ui.item.codigoNacion);
                    $("#<%= idOS.ClientID %>").val(ui.item.id);
                }
                return false;
            }
        }).data("autocomplete")._renderItem = function (ul, item) {
            return $("<li></li>")
				.data("item.autocomplete", item)
				.append("<a><strong>" + item.nombre + "</strong> (" + item.sigla + ") &nbsp; [" + item.codigoNacion + "]</a>")
				.appendTo(ul);
        };

        $('#hlLimpiar').button();
    });

    function LimpiarPrincipal() {
        $("#<%= txtAutoOs.ClientID %>").val('');
        $('#<%= lblNombre.ClientID %>').text('Ingrese nombre, código o sigla de la Obra Social.');
        $('#<%= lblSigla.ClientID %>').text('');
        $('#<%= lblCodigoNacion.ClientID %>').text('');
        $("#<%= idOS.ClientID %>").val('');
    }
</script>

<table class="style1">
     <tr>
        <td class="style2" style="vertical-align: top">
            <asp:TextBox runat="server" ID="txtAutoOs" Columns="80" 
                ToolTip="Ingresar la Obra Social"></asp:TextBox>
        </td>
        <td align="left" class="style3" style="vertical-align: top">
            <a href="javascript:LimpiarPrincipal();" id="hlLimpiar" style="float: left;" title="Eliminar Item actual">
                <asp:Image ToolTip="Eliminar" runat="server" ID="imgLimpiar" ImageAlign="AbsMiddle" ImageUrl="~/App_Themes/default/images/eliminar.jpg" AlternateText="Borrar valor" /></a>
        </td>
        </tr>
      <tr>  
        <td colspan="2">
            <div id="acResult">
                <asp:HiddenField ID="idOS" runat="server" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtAutoOs" 
                    ErrorMessage="Indique la cobertrura social del paciente." ValidationGroup="0">*</asp:RequiredFieldValidator>
                <asp:Label runat="server" ID="lblNombre" 
                    Text="Ingrese nombre, código o sigla de la Obra Social." Font-Size="7pt"></asp:Label> &nbsp; <asp:Label runat="server" ID="lblSigla" Text=""></asp:Label> &nbsp;<asp:Label runat="server" ID="lblCodigoNacion" Text=""></asp:Label>
            </div>
        </td>
    </tr>
</table>
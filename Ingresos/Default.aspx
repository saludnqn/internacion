<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebInternacion2.Ingresos.Default"
    MasterPageFile="~/Site1.Master" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
    <link rel="stylesheet" type="text/css" href="../App_Themes/default/style.css" />
</asp:Content>
<asp:Content ID="content" ContentPlaceHolderID="cuerpo" runat="server">
    <asp:HiddenField ID="HFurlPaciente" runat="server" />
    <script type="text/javascript" src="../script/Mascara.js"></script>
    <script type="text/javascript" src="../script/ValidaFecha.js"></script>
    <asp:Panel ID="Panel1" runat="server" DefaultButton="btnBuscar">
        <table width="1000px" style="margin: 0 auto;">
            <tr>
                <%--<td rowspan="10" style="vertical-align: top">
                &nbsp;
            </td>
            <td rowspan="10" style="vertical-align: top">
                &nbsp;
            </td>--%>
                <td rowspan="10" style="vertical-align: top">
                    <table class="myTabla" width="650px" style="padding-left: 10px; padding-right: 10px;">
                        <tr>
                            <td colspan="2">
                                &nbsp;
                            </td>
                            <td colspan="2" align="right">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" class="mytituloTabla">
                                INGRESO
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" class="mytituloGris">
                                Paso 1: Identificación del Paciente
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <hr />
                            </td>
                        </tr>
                        <tr>
                            <td class="myLabelIzquierda">
                                DNI/LE/LC:
                            </td>
                            <td align="left" colspan="3">
                                <input id="txtDni" type="text" runat="server" class="myTexto" onblur="valNumeroSinPunto(this)"
                                    maxlength="8" style="width: 200px;" />
                                <asp:CompareValidator ID="cvDni" runat="server" ControlToValidate="txtDni" ErrorMessage="Debe ingresar solo numeros"
                                    Operator="DataTypeCheck" Type="Integer" ValueToCompare="0">Debe ingresar solo numeros</asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="myLabelIzquierda">
                                Apellido/s:
                            </td>
                            <td align="left" colspan="3">
                                <asp:TextBox ID="txtApellido" runat="server" CssClass="myTexto" TabIndex="2" ValidationGroup="1"
                                    Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="myLabelIzquierda">
                                Nombres/s:
                            </td>
                            <td align="left" colspan="3">
                                <asp:TextBox ID="txtNombre" runat="server" CssClass="myTexto" TabIndex="3" Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <hr />
                                <asp:LinkButton ID="lbFiltroDatosMadre" CssClass="linkMadre" runat="server" OnClick="lbFiltroDatosMadre_Click">Filtro Avanzado</asp:LinkButton>
                            </td>
                        </tr>
                        <tr>
                            <td class="style1" colspan="4">
                                <hr />
                            </td>
                        </tr>
                        <asp:Panel ID="panelDatosMadre" runat="server" Visible="false">
                            <tr>
                                <td class="myLabelIzquierda">
                                    <asp:Label ID="lblNombreMadre" runat="server" Text="Nombre de la Madre"></asp:Label>
                                </td>
                                <td align="left" colspan="2">
                                    <asp:TextBox ID="txtNomMadre" runat="server" CssClass="myTexto" Width="200px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="myLabelIzquierda">
                                    <asp:Label ID="lblApellidoMadre" runat="server" Text="Apellido de la Madre"></asp:Label>
                                </td>
                                <td align="left" colspan="2">
                                    <asp:TextBox ID="txtApeMadre" runat="server" CssClass="myTexto" Width="200px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="myLabelIzquierda">
                                    <asp:Label ID="lblDniMadre" runat="server" Text="DNI de la Madre"></asp:Label>
                                </td>
                                <td align="left" colspan="2">
                                    <input id="dniMadre" type="text" runat="server" class="myTexto" onblur="valNumero(this)"
                                        tabindex="11" /><asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="dniMadre"
                                            ErrorMessage="Debe ingresar solo numeros" Operator="DataTypeCheck" Type="Integer"
                                            ValueToCompare="0">Debe ingresar solo números</asp:CompareValidator>
                                </td>
                            </tr>
                        </asp:Panel>
                        <tr>
                            <td class="style1" colspan="4">
                                <hr />
                            </td>
                        </tr>
                        <tr>
                            <td class="style1">
                                <asp:Button ID="btnBuscar" runat="server" Text="Buscar" ValidationGroup="0" CssClass="myButton"
                                    TabIndex="4" OnClick="btnBuscar_Click" ToolTip="Buscar Pacientes en SGH" Width="80px" />
                            </td>
                            <td align="right" colspan="2">
                                <asp:CustomValidator ID="cvDatosEntrada" runat="server" ErrorMessage="Debe ingresar al menos un parametro de busqueda."
                                    OnServerValidate="cvDatosEntrada_ServerValidate" ValidationGroup="0"></asp:CustomValidator>
                            </td>
                            <td align="right">
                                <asp:Button ToolTip="Crear un nuevo paciente " CssClass="myButton" ID="btnSeleccionarPaciente"
                                    Width="150px" runat="server" Text="Nuevo Paciente" OnClick="btnSeleccionarPaciente_Click"
                                    TabIndex="100" UseSubmitBehavior="False" Visible="false" />
                            </td>
                        </tr>
                        <tr>
                            <td class="style1">
                                &nbsp;
                            </td>
                            <td align="right" colspan="3">
                                <input id="txtOculto" style="width: 1px; height: 1px" type="hidden" size="1" name="txtOculto"
                                    runat="server">
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-left: 10px; padding-right: 10px;" colspan="4">
                                <asp:GridView ID="gvLista" runat="server" AutoGenerateColumns="False" DataKeyNames="idPaciente"
                                    CssClass="table table-striped table-bordered table-hover" Font-Size="9pt" Width="100%"
                                    CellPadding="1" ForeColor="#666666" AllowPaging="True" PageSize="13" EmptyDataText="No se encontraron pacientes para los parametros de busqueda ingresados"
                                    OnRowCommand="gvLista_RowCommand" OnRowDataBound="gvLista_RowDataBound" BorderColor="#333333"
                                    BorderStyle="Solid" BorderWidth="1px" OnPageIndexChanging="gvLista_PageIndexChanging"
                                    Font-Underline="False">
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Font-Names="Arial" Font-Size="8pt" />
                                    <Columns>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="Editar" runat="server" ImageUrl="~/App_Themes/default/images/editar.jpg"
                                                    ommandName="Editar" />
                                            </ItemTemplate>
                                            <ItemStyle Width="18px" HorizontalAlign="Center" Height="18px" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="dni" HeaderText="DNI">
                                            <ItemStyle Width="20%" HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="paciente" HeaderText="Apellidos y Nombres">
                                            <ItemStyle Width="50%" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="sexo" HeaderText="Sexo">
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="fechaNacimiento" HeaderText="Fecha Nac.">
                                            <ItemStyle Width="20%" HorizontalAlign="Center" />
                                        </asp:BoundField>
                                         <asp:BoundField DataField="HC" HeaderText="HC">
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                         <asp:BoundField DataField="edad" HeaderText="Edad Actual">
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="Protocolo" runat="server" ImageUrl="~/App_Themes/default/images/flecha.jpg"
                                                    ommandName="Editar" />
                                            </ItemTemplate>
                                            <ItemStyle Width="18px" HorizontalAlign="Center" Height="18px" />
                                        </asp:TemplateField>
                                    </Columns>
                                    <FooterStyle BackColor="#CCCCCC" Font-Bold="True" ForeColor="#333333" />
                                    <PagerStyle BackColor="#CCCCCC" ForeColor="#333333" HorizontalAlign="Center" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    <HeaderStyle BackColor="#CCCCCC" Font-Bold="False" Font-Names="Arial" Font-Size="8pt"
                                        ForeColor="Black" />
                                    <EditRowStyle BackColor="#999999" />
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td class="style1" colspan="1" style="vertical-align: top">
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </asp:Panel>
    <script src="../script/Resources/jquery.min.js" type="text/javascript"></script>
    <link href="../script/Resources/jquery-ui-1.8.20.css" rel="stylesheet" type="text/css" />
    <script src="../script/Resources/jQuery-ui-1.8.18.min.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">

    var urlPaciente = $("#<%= HFurlPaciente.ClientID %>").val();


    function nuevoPaciente() {
        var dom = document.domain;
        var domArray = dom.split('.');
        for (var i = domArray.length - 1; i >= 0; i--) {
            try {
                var dom = '';
                for (var j = domArray.length - 1; j >= i; j--) {
                    dom = (j == domArray.length - 1) ? (domArray[j]) : domArray[j] + '.' + dom;
                }
                document.domain = dom;
                break;
            } catch (E) {
            }
        }

     alert(urlPaciente);
        var $this = $(this);
        $('<iframe src=' + urlPaciente+'" />').dialog({
            title: 'NUEVO PACIENTE',
            autoOpen: true,
            width: 800,
            height: 800,
            modal: true,
            resizable: false,
            autoResize: true,
            overlay: {
                opacity: 0.5,
                background: "black"
            }
        }).width(900);
    }

    function closeDialog(success, historia) {
    
    alert(historia);
   
        
        <%= GetPostBackEventReference(btnSeleccionarPaciente) %>
    }
    </script>
</asp:Content>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MapaCamas.aspx.cs" Inherits="WebInternacion.Administracion.MapaCamas"
    MasterPageFile="~/Site1.Master" %>

<%@ Register Assembly="Anthem" Namespace="Anthem" TagPrefix="anthem" %>
<asp:Content ID="content1" ContentPlaceHolderID="head" runat="server">
    <link href="../script/Resources/jquery-ui-1.8.20.css" rel="stylesheet" type="text/css" />
    <script src="../script/Resources/jquery.min.js" type="text/javascript"></script>
    <script src="../script/Resources/jQuery-ui-1.8.18.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        function printDiv(divName) {
            var printContents = document.getElementById(divName).innerHTML;
            var originalContents = document.body.outerHTML;
            document.body.innerHTML = printContents;
            window.print();
          
        }

    </script>
</asp:Content>
<asp:Content ID="content2" ContentPlaceHolderID="cuerpo" runat="server">
    <div align="center" style="width: 1070px; margin-left: auto; margin-right: auto; margin-bottom: 15px;">
        
        <table style="width: 1070px;">
            <tr>
                <td class="mytituloTabla" colspan="7">MAPA DE CAMAS<hr class="hrTitulo" />
                </td>
            </tr>
            <tr>
                <td class="myLabelIzquierda">Servicio:
                </td>
                <td>
                    <asp:DropDownList CssClass="myList" ID="ddlServicio" runat="server" DataTextField="nombre"
                        DataValueField="idServicio">
                    </asp:DropDownList>
                </td>
                <td class="myLabelIzquierda">Piso:
                </td>
                <td>
                    <anthem:DropDownList ID="ddlPiso" DataTextField="nombre" DataValueField="idPiso"
                        runat="server" ToolTip="Seleccione una habitacion" TabIndex="4" CssClass="myList"
                        AutoCallBack="True" OnSelectedIndexChanged="ddlPiso_SelectedIndexChanged">
                    </anthem:DropDownList>
                </td>
                <td class="myLabelIzquierda">Habitación:
                </td>
                <td class="myLabelIzquierda">
                    <anthem:DropDownList ID="ddlHabitacion" runat="server" DataTextField="nombre" DataValueField="idHabitacion"
                        ToolTip="Seleccione una habitacion" TabIndex="4" CssClass="myList">
                    </anthem:DropDownList>
                </td>
                <td align="right">&nbsp;
                </td>
            </tr>
            <tr>
                <td class="myLabelIzquierda">Tipo Cama:
                </td>
                <td>
                    <anthem:DropDownList ID="ddlTipoCama" runat="server" ToolTip="Seleccione un tipo de cama"
                        TabIndex="4" CssClass="myList" DataTextField="nombre" DataValueField="idTipoCama">
                    </anthem:DropDownList>
                </td>
                <td class="myLabelIzquierda">Estado Cama:
                </td>
                <td>
                    <anthem:DropDownList ID="ddlTipoCamaOcupacion" runat="server" TabIndex="4" CssClass="myList">
                        <asp:ListItem Value="0">Todas</asp:ListItem>
                        <asp:ListItem Value="1">Libres</asp:ListItem>
                        <asp:ListItem Value="2">Ocupadas</asp:ListItem>
                        <asp:ListItem Value="3">Bloqueadas</asp:ListItem>
                    </anthem:DropDownList>
                </td>
                <td class="myLabelIzquierda">&nbsp;
                </td>
                <td class="myLabelIzquierda">&nbsp;
                </td>
                <td align="right">
                    <asp:Button ID="btnBuscar" runat="server" Text="Mostrar Mapa" CssClass="myButton"
                        OnClick="btnBuscar_Click" />
                </td>
            </tr>
            <tr>
                <td class="mytituloTabla" colspan="7">
                    <hr />
                </td>
            </tr>
            <tr>
                <td class="mytituloTabla" colspan="7" align="left">
                    <asp:Button ToolTip="Ver Resumen de Ocupacion" Visible="true" CssClass="myButtonGris"
                        ID="btnSeleccionarPaciente" Width="100px" runat="server" Text="Ver Resumen" OnClientClick="popupcito(); return false;"
                        TabIndex="100" UseSubmitBehavior="False" />
                    <input class="myButtonGris" type="button" onclick="printMapa()" value="Imprimir Mapa" />
                </td>
            </tr>
            <tr>
                <td colspan="7" align="center">
                    <div title="Mapa de Camas" id="printableArea" style="border: 1px solid #999999; color: #FFFFFF; height: 600px; width: 1120px; overflow: scroll;">
                        <asp:DataList ID="DataList1" runat="server" Width="100%" RepeatColumns="1" RepeatDirection="Horizontal"
                            ShowHeader="False" DataKeyField="idHabitacion" OnItemDataBound="DataList1_ItemDataBound">
                            <ItemTemplate>
                                <asp:Label Visible="false" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "idHabitacion") %>'
                                    ID="lblIdHabitacion"> </asp:Label>
                                <div style="border: 2px solid #E0E0E0; background-color: #993333; color: #FFFFFF;"
                                    class="myLabelIzquierda">
                                    <!-- aquí el contenido -->
                                    <b>&nbsp;Piso:&nbsp;
                                        <%# DataBinder.Eval(Container.DataItem, "piso") %>&nbsp;-&nbsp;Habitación:&nbsp;
                                        <%# DataBinder.Eval(Container.DataItem, "habitacion") %></b>
                                </div>
                                <asp:DataList ID="DataList3" runat="server" CellSpacing="0" Width="20%" RepeatColumns="5"
                                    RepeatDirection="Horizontal" ShowHeader="False" OnItemDataBound="DataList3_ItemDataBound"
                                    HorizontalAlign="Left">
                                    <FooterStyle Font-Bold="True" ForeColor="White" />
                                    <AlternatingItemStyle />
                                    <ItemStyle />
                                    <SelectedItemStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                    <ItemTemplate>
                                        <table style="border: 1px solid #666666; margin: 5px 5px 5px; width: 210px; height: 215px;"
                                            align="left" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td class="myLabelIzquierda" colspan="2" align="left" style="background-color: #E0E0E0;">
                                                    <%# DataBinder.Eval(Container.DataItem, "nombre") %>
                                                    <asp:Label ID="lblIdCama" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "idCama") %>'
                                                        Visible="false"></asp:Label>
                                                    <asp:Image ID="imgTipoCama" ToolTip="Cama con Oxígeno" runat="server" ImageUrl="../App_Themes/default/images/pendiente.png" />
                                                    <asp:Label ID="lblTipoCama" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tipoCama") %>'
                                                        Visible="false"></asp:Label>
                                                    <asp:Image ID="imgPrestamoCama" ToolTip="Cama Prestada" runat="server" Width="20px"
                                                        Height="20px" ImageUrl="../App_Themes/default/images/prestamoCama.png" Visible="false" />
                                                    <asp:Label ID="lblPrestamoCama" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "camaPrestada") %>'
                                                        Visible="false"></asp:Label>
                                                    <asp:HyperLink class="myLinkGris" ID="hlpPrestarCama" ToolTip="Prestar la cama a otro servicio"
                                                        runat="server" Visible="false">Prestar Cama</asp:HyperLink>
                                                    <asp:HyperLink class="myLinkGris" ID="hlpDevolverCama" ToolTip="Devolver la cama a su servicio original"
                                                        runat="server" Visible="false">Devolver Cama</asp:HyperLink>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td rowspan="2" style="vertical-align: top; padding-right: 5px; padding-left: 2px;">
                                                    <asp:Image ID="imgCama" runat="server" />
                                                </td>
                                                <td style="padding-right: 4px">
                                                    <asp:Label CssClass="myLabelIzquierda" ID="lblNumeroDocumento" runat="server" Text=""></asp:Label>
                                                    <br />
                                                    <asp:Label CssClass="myLabelIzquierda" ID="lblPaciente" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "paciente") %>'></asp:Label>
                                                    &nbsp;<asp:Image ID="imgSexo" runat="server" Visible="false" />
                                                    <asp:Label ID="lblSexo" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Sexo") %>'
                                                        Visible="false"></asp:Label></b>
                                                    <asp:Label ID="lblMotivoBloqueo" CssClass="myLabelIzquierda" runat="server" Text=""
                                                        Visible="true" ForeColor="#CC3300" Font-Bold="True" Font-Size="13"></asp:Label></b>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="padding-right: 4px">
                                                    <div class="myLabelLitlle">
                                                        Servicio:&nbsp;<%# DataBinder.Eval(Container.DataItem, "servicio") %>
                                                    </div>
                                                    <div class="myLabelLitlle">
                                                        <asp:Label CssClass="myLabelLitlle" ID="lblEspecialidad" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "especialidad") %>'></asp:Label>
                                                    </div>
                                                    <asp:Label CssClass="myLabelLitlle" ID="lblFechaIngreso" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fechaIngreso") %>'></asp:Label>
                                                    <asp:Label CssClass="myLabelLitlle" ID="lblDiasEstada" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "diasEstada") %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="background-color: #E0E0E0; font-weight: bold;">
                                                    <asp:Label ID="lblIdIngreso" Visible="false" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "idIngreso") %>'
                                                        ToolTip="Nro. Internacion" Font-Bold="True" BackColor="#E0E0E0" Font-Size="12"
                                                        ForeColor="Black"></asp:Label>
                                                    &nbsp;
                                                    <asp:HyperLink class="myLinkGris" ID="hplInfo" ToolTip="Información de la Internación"
                                                        runat="server">Info.</asp:HyperLink>
                                                    &nbsp;
                                                    <asp:HyperLink class="myLinkGris" ID="hplPase" ToolTip="Nuevo Movimiento" runat="server">Mover</asp:HyperLink>
                                                    &nbsp;
                                                    &nbsp;
                                                   <%-- <asp:HyperLink class="myLinkGris" ID="hplMov" ToolTip="Movimiento de cama" runat="server">Mov.</asp:HyperLink>
                                                    &nbsp;--%>
                                                    <asp:HyperLink class="myLinkGris" ID="hplEgreso" ToolTip="Registrar el egreso de la Internación"
                                                        runat="server">Egresar</asp:HyperLink>
                                                    &nbsp;
                                                    <asp:HyperLink class="myLinkGris" ID="hlpBloqueo" ToolTip="Bloquear la cama" runat="server">Bloquear</asp:HyperLink>
                                                    &nbsp;
                                                    <asp:HyperLink class="myLinkGris" ID="hlpNuevaInternacion" ToolTip="Registrar una nueva internación"
                                                        runat="server">Ocupar</asp:HyperLink>
                                                    &nbsp;
                                                    <asp:Image ID="imgLaboratorio" Visible="false" ToolTip="El paciente tiene un laboratorio de hoy"
                                                        runat="server" ImageUrl="~/App_Themes/default/images/lab.png" />
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:DataList>
                                <br />
                            </ItemTemplate>
                        </asp:DataList>
                    </div>
                </td>
            </tr>
        </table>
    </div>
    <script language="javascript" type="text/javascript">

        function popupcito() {
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


            var $this = $(this);
            $('<iframe src="../Ingresos/ResumenOcupacion.aspx" />').dialog({
                title: 'Ocupación de Camas',
                autoOpen: true,
                width: 850,
                height: 350,
                modal: true,
                resizable: false,
                autoResize: true,
                overlay: {
                    opacity: 0.5,
                    background: "black"
                }
            }).width(900);
        }


        function printMapa() {
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


            var $this = $(this);
            $('<iframe src="MapaCamasPrint.aspx" />').dialog({
                title: 'Mapa de Camas',
                autoOpen: true,
                width: 800,
                height: 500,
                modal: true,
                resizable: false,
                autoResize: true,
                overlay: {
                    opacity: 0.5,
                    background: "black"
                }
            }).width(800);
        }

    </script>
</asp:Content>

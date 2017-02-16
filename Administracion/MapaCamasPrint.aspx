<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MapaCamasPrint.aspx.cs" Inherits="WebInternacion2.Administracion.MapaCamasPrint" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="../stylehospital.css" media="screen">
    <link rel="stylesheet" type="text/css" href="../style.responsive.css" media="all">
    <link rel="stylesheet" type="text/css" href="../App_Themes/default/principal/style.css"
        media="screen" />
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
</head>
<body onload="printDiv('printableArea')">
    <form id="form1" runat="server">
    <div align="center" style="width: 1070px; margin-left: auto; margin-right: auto; margin-bottom: 15px;">
        
        <table style="width: 1070px;">
            <tr>
                <td>
                      <input class="myButtonGris" type="button" onclick="printDiv('printableArea')" value="Imprimir Mapa" />
                </td>
            </tr>
            <tr>
                <td colspan="7" align="center">
                    <div title="Mapa de Camas" id="printableArea" style="border: 1px solid #999999; color: #FFFFFF; height: 600px; width: 1120px; overflow: scroll;">
                        <b>MAPA DE CAMAS<br />
                        </b>&nbsp;<asp:DataList ID="DataList1" runat="server" Width="100%" RepeatColumns="1" RepeatDirection="Horizontal"
                            ShowHeader="False" DataKeyField="idHabitacion" OnItemDataBound="DataList1_ItemDataBound" OnSelectedIndexChanged="DataList1_SelectedIndexChanged">
                            <ItemTemplate>
                                <asp:Label Visible="false" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "idHabitacion") %>'
                                    ID="lblIdHabitacion"> </asp:Label>
                        <div class="myLabelIzquierda" style="border-style: solid; border-width: 1px; color: #000000" >
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
                                        <table style="border: 1px solid #666666; margin: 5px 5px 5px; width: 180px; height: 180px;"
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
                                                    <%--<asp:HyperLink class="myLinkGris" ID="hlpPrestarCama" ToolTip="Prestar la cama a otro servicio"
                                                        runat="server" Visible="false">Prestar Cama</asp:HyperLink>
                                                    <asp:HyperLink class="myLinkGris" ID="hlpDevolverCama" ToolTip="Devolver la cama a su servicio original"
                                                        runat="server" Visible="false">Devolver Cama</asp:HyperLink>--%>
                                                </td>
                                                
                                            </tr>
                                            <tr>
                                                <td rowspan="1" style="vertical-align: top; padding-right: 5px; padding-left: 2px;">
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
                                                <td style="padding-right: 4px" colspan="3">
                                                    <div class="myLabelLitlle">
                                                        Servicio:&nbsp;<%# DataBinder.Eval(Container.DataItem, "servicio") %></div>
                                                    <div class="myLabelLitlle">
                                                        <asp:Label CssClass="myLabelLitlle" ID="lblEspecialidad" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "especialidad") %>'></asp:Label>
                                                    </div>
                                                    <asp:Label CssClass="myLabelLitlle" ID="lblFechaIngreso" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fechaIngreso") %>'></asp:Label>
                                                    <asp:Label CssClass="myLabelLitlle" ID="lblDiasEstada" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "diasEstada") %>'></asp:Label>
                                                    <asp:Label ID="lblIdIngreso" Visible="false" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "idIngreso") %>'
                                                        ToolTip="Nro. Internacion" Font-Bold="True" BackColor="#E0E0E0" Font-Size="12"
                                                        ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                            
                                        </table>
                                    </ItemTemplate>
                                </asp:DataList>
                                <br />
                            </ItemTemplate>
                        </asp:DataList>
                        <br />
                        <br />
                        
                    </div>
                </td>
            </tr>
        </table>
    </div>
             
    </form>
</body>
</html>

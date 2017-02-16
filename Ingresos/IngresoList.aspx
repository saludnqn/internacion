<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IngresoList.aspx.cs" Inherits="WebInternacion2.Ingresos.IngresoList"
    MasterPageFile="~/Site1.Master" %>

<asp:Content ID="content1" ContentPlaceHolderID="head" runat="server">
    </style>
    <link rel="stylesheet" type="text/css" href="../App_Themes/default/style.css" />
    <link type="text/css" rel="stylesheet" href="../script/jquery-ui-1.7.1.custom.css" />
    <script type="text/javascript" src="../script/autocomplete/jquery-1.8.2.js"></script>
    <script type="text/javascript" src="../script/autocomplete/jquery-ui.js"></script>
    <script type="text/javascript" src="../script/jquery.ui.datepicker-es.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#<%=txtFechaDesde.ClientID %>").datepicker({
                showOn: 'button',
                buttonImage: '../App_Themes/default/images/calend1.jpg',
                buttonImageOnly: true
            });
            $("#<%=txtFechaHasta.ClientID %>").datepicker({
                showOn: 'button',
                buttonImage: '../App_Themes/default/images/calend1.jpg',
                buttonImageOnly: true
            });
        });     
    </script>
    <script type="text/javascript" src="../script/Mascara.js"></script>
    <script type="text/javascript" src="../script/ValidaFecha.js"></script>
</asp:Content>
<asp:Content ID="content2" ContentPlaceHolderID="cuerpo" runat="server">
    <asp:Panel ID="pnlInternacion" runat="server" DefaultButton="btnBuscar">
        <table width="1000px" align="center" cellpadding="1" cellspacing="1" class="myTabla">
            <tr>
                <td colspan="5">
                    <b class="mytituloTabla">LISTA DE INTERNACIONES </b>
                    <hr />
                </td>
            </tr>
            <tr>
                <td class="myLabelIzquierda">
                    Servicio:
                </td>
                <td>
                    <asp:DropDownList ID="ddlServicio" runat="server" ToolTip="Seleccione el servicio" DataTextField="nombre" DataValueField="idServicio"
                        TabIndex="1" CssClass="myList">
                    </asp:DropDownList>
                </td>
                <td class="myLabelIzquierda" colspan="2">
                    Nro. Internación:
                </td>
                <td>
                    <input id="txtNumero" runat="server" type="text" maxlength="10" tabindex="5" class="myTexto"
                        onblur="valNumero(this)" style="width: 70px" />
                </td>
            </tr>
            <tr>
                <td class="myLabelIzquierda">
                    Fecha Desde:
                </td>
                <td>
                    <input id="txtFechaDesde" runat="server" type="text" maxlength="10" onblur="valFecha(this)"
                        onkeyup="mascara(this,'/',patron,true)" tabindex="3" class="myTexto" style="width: 70px" />
                    <asp:CompareValidator ID="cvFechas" ValidationGroup="Date" ForeColor="Red" runat="server"
                        ControlToValidate="txtFechaDesde" ControlToCompare="txtFechaHasta" Operator="LessThan"
                        Type="Date" ErrorMessage="Fecha Desde debe ser menor a Fecha Hasta."></asp:CompareValidator>
                </td>
                <td class="myLabelIzquierda" colspan="2">
                    Fecha Hasta:
                </td>
                <td>
                    <input id="txtFechaHasta" runat="server" type="text" maxlength="10" style="width: 70px"
                        onblur="valFecha(this)" onkeyup="mascara(this,'/',patron,true)" tabindex="4"
                        class="myTexto" />
                </td>
            </tr>
            <tr>
                <td class="myLabelIzquierda">
                    DNI Paciente:
                </td>
                <td>
                    <input id="txtDni" type="text" runat="server" class="myTexto" onblur="valNumero(this)"
                        tabindex="11" /><asp:CompareValidator ID="cvDni" runat="server" ControlToValidate="txtDni"
                            ErrorMessage="Debe ingresar solo numeros" Operator="DataTypeCheck" Type="Integer"
                            ValueToCompare="0">Debe ingresar solo números</asp:CompareValidator>
                </td>
                <td class="myLabelIzquierda" colspan="2">
                    Estado:
                </td>
                <td>
                    <asp:DropDownList ID="ddlEstado" runat="server" CssClass="myList" TabIndex="12">
                        <asp:ListItem Value="0">Todas</asp:ListItem>
                        <asp:ListItem Value="1" Selected="True">Activas</asp:ListItem>
                        <asp:ListItem Value="2">Con Egreso</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="myLabelIzquierda">
                    Apellido/s:
                </td>
                <td align="left" colspan="4">
                    <asp:TextBox ID="txtApellido" runat="server" CssClass="myTexto" TabIndex="13" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="myLabelIzquierda">
                    Nombre/s:
                </td>
                <td align="left" colspan="2">
                    <asp:TextBox ID="txtNombre" runat="server" CssClass="myTexto" TabIndex="14" Width="200px"></asp:TextBox>
                </td>
                <td align="right" colspan="2">
                    <asp:CheckBox ID="chkRecordarFiltro" runat="server" CssClass="myLabelIzquierda2"
                        Text="Recordar filtros" Font-Italic="True" Visible="False" />
                </td>
            </tr>
            <tr>
                <td colspan="5">
                    <hr />
                </td>
            </tr>
            <tr>
                <td colspan="5">
                    <table style="width: 100%;">
                        <tr>
                            <td>
                            </td>
                            <td align="right">
                                <asp:Button ID="btnBuscar" runat="server" CssClass="myButton" OnClick="btnBuscar_Click"
                                    TabIndex="15" Text="Buscar" ValidationGroup="0" Width="77px" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;<asp:Label ID="CantidadRegistros" runat="server" ForeColor="Blue" />
                                &nbsp;
                                <asp:Label ID="CurrentPageLabel" runat="server" ForeColor="Blue" />
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:GridView ID="gvLista" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                    CssClass="table table-striped table-bordered table-hover" BorderColor="#666666"
                                    BorderStyle="Solid" BorderWidth="1px" CellPadding="2" DataKeyNames="numero" EmptyDataText="No se encontraron internaciones para los parametros de busqueda ingresados"
                                    Font-Size="9pt" ForeColor="Black" OnPageIndexChanging="gvLista_PageIndexChanging"
                                    OnRowCommand="gvLista_RowCommand" OnRowDataBound="gvLista_RowDataBound" PageSize="20"
                                    Width="100%">
                                    <RowStyle BackColor="White" Font-Names="Arial" Font-Size="8pt" ForeColor="Black" />
                                    <Columns>
                                        <asp:BoundField DataField="numero" HeaderText="Nro.">
                                            <ItemStyle Width="5%" Font-Bold="True" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="fecha" HeaderText="Fecha Ingreso">
                                            <ItemStyle HorizontalAlign="Center" Width="10%" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="dni" HeaderText="DNI">
                                            <ItemStyle HorizontalAlign="Center" Width="5%" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="apellido" HeaderText="Apellidos">
                                            <ItemStyle Width="15%" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="nombre" HeaderText="Nombre">
                                            <ItemStyle Width="15%" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="piso" HeaderText="Piso">
                                            <ItemStyle Width="5%" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="habitacion" HeaderText="Habitacion">
                                            <ItemStyle HorizontalAlign="Center" Width="10%" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="servicio" HeaderText="Servicio"></asp:BoundField>
                                        <asp:BoundField DataField="cama" HeaderText="Cama">
                                            <ItemStyle HorizontalAlign="Center" Width="5%" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="fechaRegistro" HeaderText="Fecha Act.">
                                            <ItemStyle Width="15%" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="estado" HeaderText="Estado">
                                            <ItemStyle Width="5%" />
                                        </asp:BoundField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="Editar" runat="server" ImageUrl="~/App_Themes/default/images/editar.jpg"
                                                    ommandName="Editar" />
                                            </ItemTemplate>
                                            <ItemStyle Height="20px" HorizontalAlign="Center" Width="20px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="Eliminar" runat="server" CommandName="Eliminar" ImageUrl="~/App_Themes/default/images/eliminar.jpg"
                                                    OnClientClick="return PreguntoEliminar();" />
                                            </ItemTemplate>
                                            <ItemStyle Height="20px" HorizontalAlign="Center" Width="20px" />
                                        </asp:TemplateField>
                                        <%-- <asp:TemplateField>
                                                                        <ItemTemplate>
                                                                            <asp:ImageButton ID="Pase" runat="server" CommandName="Pase" 
                                                                                ImageUrl="~/App_Themes/default/images/eliminar.jpg" 
                                                                                 />
                                                                        </ItemTemplate>
                                                                        <ItemStyle Height="20px" HorizontalAlign="Center" Width="20px" />
                                                                    </asp:TemplateField>--%>
                                    </Columns>
                                    <PagerSettings Mode="NumericFirstLast" Position="Top" />
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#E6E6E6" ForeColor="Black" HorizontalAlign="Right" />
                                    <SelectedRowStyle BackColor="White" Font-Bold="True" ForeColor="#333333" />
                                    <HeaderStyle BackColor="#CCCCCC" Font-Bold="False" Font-Names="Arial" Font-Size="8pt"
                                        ForeColor="Black" />
                                    <EditRowStyle BackColor="#999999" />
                                </asp:GridView>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="left" colspan="3">
                    &nbsp;
                </td>
                <td align="right" colspan="2">
                    &nbsp;
                </td>
            </tr>
        </table>
    </asp:Panel>
    <script language="javascript" type="text/javascript">
        function PreguntoEliminar() {
            if (confirm('¿Está seguro de anular el protocolo?'))
                return true;
            else
                return false;
        }
    </script>
</asp:Content>

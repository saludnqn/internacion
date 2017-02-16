<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProcQuirurgicoList.ascx.cs"
    Inherits="WebInternacion2.UserControls.ProcQuirurgicoList" %>
<%@ Register Assembly="Anthem" Namespace="Anthem" TagPrefix="anthem" %>
<table style="width: 100%;">
    <tr>
        <td>
            <anthem:GridView ID="gvLista" runat="server" AutoGenerateColumns="False" CellPadding="4" CssClass="table table-striped table-bordered table-hover" 
                DataKeyNames="idIngresoProcedimiento" EmptyDataText="No hay procedimiento quirurgicos cargados"
                Font-Size="9pt" OnRowCommand="gvLista_RowCommand" OnRowDataBound="gvLista_RowDataBound"
                PageSize="20" Width="800px" GridLines="None" AutoUpdateAfterCallBack="True" >
                <RowStyle BackColor="#F7F6F3" Font-Names="Arial" Font-Size="8pt" ForeColor="#333333"  />
                <Columns>
                    <asp:BoundField DataField="fecha" HeaderText="Fecha y Hora">
                        <ItemStyle Width="20%" />
                    </asp:BoundField>
                    <asp:BoundField DataField="nombre" HeaderText="Procedimiento">
                        <ItemStyle Width="30%" />
                    </asp:BoundField>
                    <asp:BoundField DataField="observaciones" HeaderText="Observaciones">
                        <ItemStyle Width="30%" />
                    </asp:BoundField>
                    <%-- <asp:BoundField DataField="username" HeaderText="Usuario">
                                    <ItemStyle Width="5%" />
                                </asp:BoundField>--%>
                    <asp:BoundField DataField="fechaRegistro" HeaderText="Fecha Act.">
                        <ItemStyle Font-Size="7pt" Width="20%" />
                    </asp:BoundField>
                    <asp:TemplateField Visible="false">
                        <ItemTemplate>
                            <asp:ImageButton ID="Eliminar" runat="server" CommandName="Eliminar" ImageUrl="~/App_Themes/default/images/eliminar.jpg"
                                OnClientClick="return PreguntoEliminar();" />
                        </ItemTemplate>
                        <ItemStyle Height="20px" HorizontalAlign="Center" Width="20px" />
                    </asp:TemplateField>
                </Columns>
                <PagerSettings Position="Top" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#999999" Font-Bold="True" ForeColor="#333333" />
                <EditRowStyle BackColor="#999999" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            </anthem:GridView>
        </td>
    </tr>
</table>

<script language="javascript" type="text/javascript">
    function PreguntoEliminar() {
        if (confirm('¿Está seguro de eliminar?'))
            return true;
        else
            return false;
    }
</script>

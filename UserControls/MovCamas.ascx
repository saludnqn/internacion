<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MovCamas.ascx.cs" Inherits="WebInternacion2.UserControls.MovCamas" %>
<asp:GridView ID="gvLista" runat="server" AutoGenerateColumns="False" CellPadding="4" CssClass="table table-striped table-bordered table-hover" 
    DataKeyNames="idPase" EmptyDataText="La internacion no tiene pases" Font-Size="9pt"
    ForeColor="DarkGray" PageSize="20" Width="800px">
    <RowStyle BackColor="#F7F6F3" Font-Names="Arial" Font-Size="8pt" ForeColor="#333333" />
    <Columns>
        <asp:BoundField DataField="fechaDesde" HeaderText="Fecha Desde">
            <ItemStyle HorizontalAlign="Center" Width="10%" />
        </asp:BoundField>
        <asp:BoundField DataField="Hora" HeaderText="Hora">
            <ItemStyle HorizontalAlign="Center" Width="10%" />
        </asp:BoundField>
        <%--<asp:BoundField DataField="diasEstada" HeaderText="Días Estada">
            <ItemStyle HorizontalAlign="Center" Width="5%" />
        </asp:BoundField>--%>
        <asp:BoundField DataField="servicio" HeaderText="Servicio">
            <ItemStyle Width="15%" />
        </asp:BoundField>
        <asp:BoundField DataField="especialidad" HeaderText="Especialidad">
            <ItemStyle Width="25%" />
        </asp:BoundField>
        <asp:BoundField DataField="habitacion" HeaderText="Habitacion">
            <ItemStyle HorizontalAlign="Center" Width="10%" />
        </asp:BoundField>
        <asp:BoundField HeaderText="Cama" DataField="cama">
            <ItemStyle Width="5%" />
        </asp:BoundField>
        <%-- <asp:BoundField DataField="usuario" HeaderText="Usuario">
                    <ItemStyle Width="10%" HorizontalAlign="Center" />
                </asp:BoundField>--%>
        <asp:BoundField DataField="fechaRegistro" HeaderText="Fecha Registro">
            <ItemStyle Font-Size="7pt" Width="15%" />
        </asp:BoundField>
        <%-- <asp:TemplateField>
                    <ItemTemplate>
                        <asp:ImageButton ID="Eliminar" runat="server" CommandName="Eliminar" 
                            ImageUrl="~/App_Themes/default/images/eliminar.jpg" 
                            OnClientClick="return PreguntoEliminar();" />
                    </ItemTemplate>
                    <ItemStyle Height="20px" HorizontalAlign="Center" Width="20px" />
                </asp:TemplateField>--%>
    </Columns>
    <PagerSettings Position="Top" />
    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
    <HeaderStyle BackColor="DarkGray" Font-Bold="True" ForeColor="Black" />
    <EditRowStyle BackColor="#999999" />
    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
</asp:GridView>

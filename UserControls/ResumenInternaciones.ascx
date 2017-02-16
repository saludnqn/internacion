<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ResumenInternaciones.ascx.cs"
    Inherits="WebInternacion2.UserControls.ResumenInternaciones" %>
<style type="text/css">
    .footer
    {
        background: rgba(212,228,239,1);
        background: -moz-linear-gradient(left, rgba(212,228,239,1) 0%, rgba(134,174,204,1) 100%);
        background: -webkit-gradient(left top, right top, color-stop(0%, rgba(212,228,239,1)), color-stop(100%, rgba(134,174,204,1)));
        background: -webkit-linear-gradient(left, rgba(212,228,239,1) 0%, rgba(134,174,204,1) 100%);
        background: -o-linear-gradient(left, rgba(212,228,239,1) 0%, rgba(134,174,204,1) 100%);
        background: -ms-linear-gradient(left, rgba(212,228,239,1) 0%, rgba(134,174,204,1) 100%);
        background: linear-gradient(to right, rgba(212,228,239,1) 0%, rgba(134,174,204,1) 100%);
        filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#d4e4ef', endColorstr='#86aecc', GradientType=1 );
    }
</style>

<asp:GridView ID="gvLista" runat="server" EmptyDataText="No se han configurado el sistema. Comience creando los servicios de internación y el catastro de camas."
    OnRowDataBound="gvLista_RowDataBound" ShowFooter="True"  CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" Font-Names="Verdana" Font-Size="10pt">
    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    <Columns>
        <asp:BoundField DataField="Servicio" HeaderText="Servicio">
        <ItemStyle Width="150px" />
        </asp:BoundField>
        <asp:BoundField DataField="Cantidad Camas" HeaderText="Cantidad Camas">
        <ItemStyle Width="120px" />
        </asp:BoundField>
        <asp:BoundField DataField="Camas Ocupadas" HeaderText="Camas Ocupadas">
        <ItemStyle Width="120px" />
        </asp:BoundField>
        <asp:BoundField DataField="Camas Bloqueadas" HeaderText="Camas Bloqueadas">
        <ItemStyle Width="120px" />
        </asp:BoundField>
        <asp:BoundField DataField="Camas Libres" HeaderText="Camas Libres">
        <ItemStyle Width="120px" />
        </asp:BoundField>
          <asp:BoundField DataField="CamasLibresConOxigeno" HeaderText="Camas Libres Con Oxigeno">
        <ItemStyle Width="120px" />
        </asp:BoundField>
        <asp:BoundField DataField="% Ocupación" HeaderText="% Ocupación">
        <ItemStyle Width="100px" />
        </asp:BoundField>
    </Columns>
    <EditRowStyle BackColor="#999999" />
    <FooterStyle  BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
    <RowStyle BackColor="#F7F6F3" Font-Size="9pt" ForeColor="#333333" />
    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
    <SortedAscendingCellStyle BackColor="#E9E7E2" />
    <SortedAscendingHeaderStyle BackColor="#506C8C" />
    <SortedDescendingCellStyle BackColor="#FFFDF8" />
    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
</asp:GridView>

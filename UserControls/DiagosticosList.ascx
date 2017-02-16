<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DiagosticosList.ascx.cs"
    Inherits="WebInternacion2.UserControls.DiagosticosList" %>
<asp:GridView ID="gvLista" runat="server" AutoGenerateColumns="False" CellPadding="4"
    DataKeyNames="idIngresoDiagnostico" EmptyDataText="La internacion no tiene diagnósticos cargados"
    Font-Size="9pt" ForeColor="#333333" PageSize="20" Width="100%" GridLines="None">
    <RowStyle BackColor="#F7F6F3" Font-Names="Arial" Font-Size="8pt" ForeColor="#333333" />
    <EmptyDataRowStyle CssClass="myLabelIzquierda2" Font-Italic="True" />
    <Columns>
        <asp:BoundField DataField="fecha" HeaderText="Fecha y Hora" />
        <asp:BoundField DataField="diagnostico" HeaderText="Diagnostico"></asp:BoundField>
        <asp:BoundField DataField="principal" HeaderText="Tipo">
            <ItemStyle Width="15%" />
        </asp:BoundField>
        <asp:BoundField DataField="causaExterna" HeaderText="Causa Externa"></asp:BoundField>
        <asp:BoundField DataField="lugarCausaExterna" HeaderText="Lugar Causa Externa"></asp:BoundField>
        <asp:BoundField DataField="diagnosticoCausaExterna" HeaderText="Diag. Causa Externa">
        </asp:BoundField>
        <asp:BoundField DataField="fechaFinProlongaInternacion" HeaderText="Fecha Fin Prol. Internacion">
        </asp:BoundField>
        <asp:BoundField DataField="fechaRegistro" HeaderText="Fecha Registro" />
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
</asp:GridView>

<script language="javascript" type="text/javascript">
    function PreguntoEliminar() {
        if (confirm('¿Está seguro de eliminar?'))
            return true;
        else
            return false;
    }
</script>

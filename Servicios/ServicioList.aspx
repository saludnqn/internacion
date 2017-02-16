<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ServicioList.aspx.cs" Inherits="WebInternacion2.Servicios.ServicioList"
    MasterPageFile="~/Site1.Master" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
    <link rel="stylesheet" type="text/css" href="../App_Themes/default/style.css" />
</asp:Content>
<asp:Content ID="content2" ContentPlaceHolderID="cuerpo" runat="server">
    <%--  <form id="form1" runat="server">--%>
    <table width="600px" style="margin: 0 auto;" class="myTabla">
        <tr>
            <td>
                <b class="mytituloTabla">LISTA DE SERVICIOS</b>
            </td>
            <td align="right">
                <%--EL ícono de ayuda queda oculto hasta que se pueda armar un documento de ayuda.--%>
                <a href="../Help/Documentos/Servicios.htm" target="_blank">
                    <img style="border: none; display: none;" alt="Ayuda" src="../App_Themes/default/images/information.png" /></a>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <hr class="hrTitulo" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="gvLista" runat="server" AutoGenerateColumns="False" CellPadding="1" CssClass="table table-striped table-bordered table-hover"
                    DataKeyNames="idServicio" ForeColor="#333333" OnRowCommand="gvLista_RowCommand1"
                    OnRowDataBound="gvLista_RowDataBound" Font-Size="8pt" Width="100%" EmptyDataText="No hay servicios de internación creados"
                    BorderColor="#666666" BorderStyle="Solid" BorderWidth="1px" GridLines="Horizontal">
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Font-Size="8pt" />
                    <Columns>
                        <asp:BoundField DataField="nombre" HeaderText="Servicio">
                            <ItemStyle Width="80%" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:ImageButton ID="Modificar" runat="server" ImageUrl="~/App_Themes/default/images/editar.jpg"
                                    CommandName="Modificar" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="5%" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:ImageButton ID="Eliminar" runat="server" ImageUrl="~/App_Themes/default/images/eliminar.jpg"
                                    OnClientClick="return PreguntoEliminar();" CommandName="Eliminar" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="5%" />
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#CCCCCC" Font-Bold="False" Font-Names="Arial" Font-Size="8pt"
                        ForeColor="Black" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <hr />
            </td>
        </tr>
        <tr>
            <td align="right" colspan="2">
                <asp:Button ID="btnAgregar" runat="server" OnClick="btnAgregar_Click" Text="Agregar"
                    Font-Size="10pt" CssClass="myButton" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;
            </td>
        </tr>
    </table>
    <%-- </form>--%>
    <script type="text/javascript" language="javascript">

        function PreguntoEliminar() {
            if (confirm('¿Está seguro de eliminar el registro?'))
                return true;
            else
                return false;
        }
    </script>
</asp:Content>

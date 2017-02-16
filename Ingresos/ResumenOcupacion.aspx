<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResumenOcupacion.aspx.cs"
    Inherits="WebInternacion2.Ingresos.ResumenOcupacion" %>

<%@ Register Src="../UserControls/ResumenInternaciones.ascx" TagName="ResumenInternaciones"
    TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Ocupación de Camas de Internaciones</title>
    <script type="text/javascript">
        function printDiv(divName) {
            var printContents = document.getElementById(divName).innerHTML;
            var originalContents = document.body.innerHTML;

            document.body.innerHTML = printContents;

            window.print();

            document.body.innerHTML = originalContents;
        }

        function cerrar() {
            self.close();
        }
    </script>
   
</head>
<body>
    <form id="form1" runat="server">
    <div align="left" style="width: 800px">
        <div id="printableArea" align="left" style="width: 800px">
            <asp:Label ID="lblFecha" runat="server" Text="Label"></asp:Label>
            <uc1:ResumenInternaciones ID="ResumenInternaciones1" runat="server" />
            <asp:Label ID="Label1" runat="server" Text="Presione Esc para salir" ForeColor="Red"></asp:Label>
            <br />
        </div>
        <img onclick="printDiv('printableArea')" src="../App_Themes/default/images/imprimir.jpg"
            title="Imprimir" />
    </div>
    </form>
</body>
</html>

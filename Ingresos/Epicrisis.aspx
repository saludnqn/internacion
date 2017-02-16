<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Epicrisis.aspx.cs" Inherits="WebInternacion2.Ingresos.Epicrisis" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Epicrisis</title>
    <link rel="stylesheet" type="text/css" href="../App_Themes/default/style.css" />
    <script type="text/javascript">        function cerrar() {
            window.close(); return
            false;
        } </script>
    <script type="text/javascript">
        function Confirmacion() {
            var seleccion = confirm("acepta el mensaje ?");
            confirm("acepta el mensaje ?");
            if (seleccion) {
                alert("probando");

            }
            else
                alert("NO se acepto el mensaje");
            //usado para que no haga postback el boton de asp.net cuando

            //no se acepte el confirm            
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table width="700px" style="margin: 0 auto;">
                <tr>
                    <td colspan="2" class="myLabelIzquierda">
                        <asp:Label ID="lblResumenInternacion" Font-Size="18" runat="server" Text="Epicrisis"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="myLabelIzquierda">
                        <asp:Label ID="lblSintesis" runat="server" Text="Síntesis"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtSintesis" runat="server" Rows="4" TextMode="MultiLine" Width="550px"
                            CssClass="myTexto"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="myLabelIzquierda">
                        <asp:Label ID="lblIntercurrencia" runat="server" Text="Intercurrencias - Complicaciones"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtIntercurrencias" runat="server" Rows="4" TextMode="MultiLine"
                            Width="550px" CssClass="myTexto"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="myLabelIzquierda">
                        <asp:Label ID="lblEstadoAlAlta" runat="server" Text="Estado al Alta"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtEstadoAlAlta" runat="server" Rows="1" TextMode="SingleLine" Width="400px"
                            CssClass="myTexto"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="myLabelIzquierda">
                        <asp:Label ID="lblPronosticoAlAlta" runat="server" Text="Pronóstico al Alta"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPronosticoAlAlta" runat="server" Rows="1" TextMode="SingleLine"
                            Width="400px" CssClass="myTexto"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <hr style="height: 4px; margin-bottom: 10px" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="myLabelIzquierda">
                        <asp:Label ID="lblTratamientoASeguir" Font-Size="14" runat="server" Text="Tratamiento a Seguir"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="myLabelIzquierda">
                        <asp:Label ID="lblTratamientoFarmacologico" runat="server" Text="Faramacológico"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtTratFarmacologico" runat="server" Rows="1" TextMode="SingleLine"
                            Width="400px" CssClass="myTexto"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="myLabelIzquierda">
                        <asp:Label ID="lblTratamientoNoFarmacologico" runat="server" Text="No Faramacológico"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtTratNoFarmacologico" runat="server" Rows="1" TextMode="SingleLine"
                            Width="400px" CssClass="myTexto"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <hr style="height: 4px; margin-bottom: 10px" />
                    </td>
                </tr>
                <tr>
                    <td class="myLabelIzquierda">
                        <asp:Label ID="lblSituacionPendiente" runat="server" Text="Situacion Pendiente"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtSituacionPendiente" runat="server" Rows="1" TextMode="SingleLine"
                            Width="400px" CssClass="myTexto"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="myLabelIzquierda" style="vertical-align: top;">
                        <asp:Label ID="lblObservaciones" runat="server" Text="Observaciones:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtObservacionesEgreso" runat="server" Rows="1" TextMode="SingleLine"
                            Width="400px" CssClass="myTexto"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="myButton" OnClick="btnGuardar_Click" />
                    </td>
                    <td>
                        <asp:Button ID="btnCancelar" runat="server" Text="Cerrar" CssClass="myButton" OnClientClick="cerrar();"
                            OnClick="btnCancelar_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>

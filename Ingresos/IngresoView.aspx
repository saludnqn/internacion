<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IngresoView.aspx.cs" ValidateRequest="false"
    EnableEventValidation="false" Inherits="WebInternacion2.Ingresos.IngresoView"
    MasterPageFile="~/Site1.Master" %>

<%@ Register Src="~/UserControls/PacienteInternacion.ascx" TagName="PacInternacion"
    TagPrefix="uc1" %>
<%@ Register Src="~/UserControls/ProcQuirurgicoList.ascx" TagName="oProcQui" TagPrefix="uc2" %>
<%@ Register Src="~/UserControls/MovCamas.ascx" TagName="oMovCama" TagPrefix="uc3" %>
<%@ Register Src="~/UserControls/DiagosticosList.ascx" TagName="oDiag" TagPrefix="uc4" %>
<asp:Content ID="content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="../App_Themes/default/style.css" />
    <link type="text/css" rel="stylesheet" href="../script/jquery-ui-1.7.1.custom.css" />
    <script type="text/javascript" src="../script/jquery.min.js"></script>
    <script type="text/javascript" src="../script/jquery-ui.min.js"></script>
    <script type="text/javascript" src="../script/jquery.ui.datepicker-es.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#<%=txtFecha.ClientID %>").datepicker({
                showOn: 'button',
                buttonImage: '../App_Themes/default/images/calend1.jpg',
                buttonImageOnly: true
            });
        });
    </script>
    <script type='text/javascript'>
            function ventana() {            
                var idIngreso = <%=Request["idIngreso"]%>
                window.open('Epicrisis.aspx?idIngreso=' + idIngreso, '', 'dialogHeight:750 px;dialogWidth:780px;center:Yes;help:No;resizable: Yes;status:No;toolbars:Yes');
            }
    </script>
    <script type="text/javascript" src="../script/Mascara.js"></script>
    <script type="text/javascript" src="../script/ValidaFecha.js"></script>
</asp:Content>
<asp:Content ID="content" ContentPlaceHolderID="cuerpo" runat="server">
    <%-- <div style="width: 1000px;" align="center" class="myTabla">--%>
    <br />
    &nbsp; &nbsp; &nbsp;
    <br />
    <table style="width: 1000px;" align="center" class="myTabla">
        <tr>
            <td class="mytituloTabla" colspan="3">
                INTERNACION
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <uc1:PacInternacion ID="DatosPaciente" runat="server" />
            </td>
        </tr>
        
        <tr>
            <td colspan="3">
                <table style="width: 100%;">
                    <tr>
                        <td class="mytituloGris">
                            MOVIMIENTOS DE CAMA
                        </td>
                    </tr>
                    <tr>
                        <td class="myLabelIzquierda2">
                            <asp:Label ID="lblCama" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="myLabelIzquierda2">
                            <uc3:oMovCama ID="ListaProcedimientos0" runat="server" />
                        </td>
                    </tr>
                    <%--<tr>
                        <td class="myLabelIzquierda2">
                            <asp:HyperLink ID="hplMov" runat="server" CssClass="myLink">Nuevo Cambio de Cama</asp:HyperLink>
                        </td>
                    </tr>
                    <tr>
                        <td class="myLabelIzquierda2">
                            <asp:HyperLink ID="hplPase" runat="server" CssClass="myLink">Nuevo Pase de Servicio</asp:HyperLink>
                        </td>
                    </tr>--%>
                    <tr>
                        <td class="myLabelIzquierda">
                            <hr class="hr2" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <table style="width: 100%;">
                    <tr>
                        <td class="myLabelIzquierda2">
                            PROCEDIMIENTOS QUIRURGICOS
                        </td>
                    </tr>
                    <tr>
                        <td class="myLabelIzquierda2">
                            <uc2:oProcQui ID="ListaProcedimientos" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="myLabelIzquierda">
                            <asp:HyperLink ID="hplQuirurjico" runat="server" CssClass="myLink">Administración</asp:HyperLink>
                        </td>
                    </tr>
                    <tr>
                        <td class="myLabelIzquierda">
                            <hr class="hr2" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <table style="width: 100%;">
                    <asp:Panel ID="diagnosticoPanel" runat="server" Visible="false">
                        <tr>
                            <td class="mytituloGris" colspan="2">
                                DIAGNOSTICOS
                            </td>
                        </tr>
                        <tr>
                            <td class="mytituloGris" colspan="2">
                                <uc4:oDiag ID="oDiagnosticos" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td class="mytituloGris" colspan="2">
                                <asp:HyperLink ID="hplDiagnostico" runat="server" CssClass="myLink">Administración</asp:HyperLink>
                                <hr class="hr2" />
                            </td>
                        </tr>
                        <tr>
                            <td class="mytituloGris" colspan="2">
                                EGRESO
                            </td>
                        </tr>
                    </asp:Panel>
                    <tr>                        
                        <td class="myLabelIzquierda2">
                         <asp:Label ID="lblEpicrisis" runat="server" Text="Completar Epicrisis"></asp:Label><br />
                            <asp:LinkButton ID="linkEpicrisis" runat="server" OnClientClick="ventana();">Epicrisis</asp:LinkButton>
                            <hr class="hr2" />
                        </td>
                    </tr>
                    <tr>
                        <td class="myLabelIzquierda2">
                            <asp:Label ID="lblEgreso" runat="server" Text="No tiene egreso registrado"></asp:Label>
                        </td>
                        <td class="myLabelIzquierda2" align="right">
                            <asp:Button ID="btnCancelarEgreso" runat="server" CssClass="myButtonGris" OnClick="btnCancelarEgreso_Click"
                                Text="Cancelar Egreso" OnClientClick="return PreguntoGuardar();" Width="120px" />
                        </td>
                    </tr>
                    <tr>
                        <td class="myLabelIzquierda" colspan="2">
                            <asp:HyperLink ID="hplEgreso" runat="server" CssClass="myLink">Agregar</asp:HyperLink>
                        </td>
                    </tr>
                    <tr>
                        <td class="myLabelIzquierda" colspan="2">
                            <asp:Panel ID="pnlFinInternacion" runat="server" Visible="false">
                                Fecha de Fin de Internación:
                                <input id="txtFecha" runat="server" type="text" maxlength="10" onblur="valFecha(this)"
                                    onkeyup="mascara(this,'/',patron,true)" tabindex="2" class="myTexto" style="width: 70px" />&nbsp;&nbsp;&nbsp;
                                <input id="txtHora" runat="server" class="myTexto" maxlength="5" onblur="valHora(this)"
                                    onkeyup="mascara(this,':',patron,true)" style="width: 50px" tabindex="7" title="Ingrese la hora"
                                    type="text" />
                                <asp:Button ID="btnFinInternacion" runat="server" CssClass="myButtonGris" OnClick="btnFinInternacion_Click"
                                    Text="Finalizar Internacion" Width="120px" />
                            </asp:Panel>
                            <hr class="hr2" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <%-- <tr>
            <td
               colspan="3">  
                <asp:LinkButton ID="lnkHojaIngreso" runat="server" onclick="LinkButton3_Click" 
                    Font-Bold="True" oncommand="lnkHojaIngreso_Command">Descargar Hoja 
                de Ingreso</asp:LinkButton>
            </td>
        </tr>--%>
        <tr>
            <td colspan="3">
                <asp:LinkButton ID="lnkHospitalizacion" runat="server" Font-Bold="True" CausesValidation="False"
                    OnClick="lnkHospitalizacion_Click">Descargar 
                Informe de Hospitalización</asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:LinkButton ID="lnkEpicrisis" runat="server" Font-Bold="True" CausesValidation="False"
                    OnClick="lnkEpicrisis_Click">Descargar 
                Epicrisis</asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
                <%--<asp:Image ID="imgLaboratorio" runat="server" Height="32px" ImageUrl="~/App_Themes/default/images/lab.png"
                    Width="32px" />
                <asp:LinkButton ID="lnkLaboratorio" runat="server">El paciente tiene pedidos de 
                laboratorio</asp:LinkButton>--%>
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
    <%--<br />
    </div>--%>
    <script language="javascript" type="text/javascript">

        function PreguntoGuardar() {
            if (confirm('¿Está seguro de cancelar el egreso?.'))
                return true;
            else
                return false;
        }
   
    </script>
</asp:Content>

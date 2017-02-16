<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DiagnosticoEdit.aspx.cs" Inherits="WebInternacion2.Ingresos.DiagnosticoEdit" MasterPageFile="~/Site1.Master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/UserControls/PacienteInternacion.ascx" TagName="PacInternacion" TagPrefix="uc1" %>
<%@ Register Src="~/UserControls/Cie10.ascx" TagName="DiagnosticoPrincipal" TagPrefix="uc1" %>
<%@ Register Src="~/UserControls/CausaExterna.ascx" TagName="CausaExterna" TagPrefix="uc2" %>
<%@ Register Assembly="Anthem" Namespace="Anthem" TagPrefix="anthem" %>
<asp:Content ID="content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="../App_Themes/default/style.css" />
    <link type="text/css" rel="stylesheet" href="../script/jquery-ui-1.7.1.custom.css" />
    <script type="text/javascript" src="../script/autocomplete/jquery-1.8.2.js"></script>
    <script type="text/javascript" src="../script/autocomplete/jquery-ui.js"></script>
    <script type="text/javascript" src='<%= ResolveUrl("../script/jquery-1.5.1.min.js") %>'></script>
    <script src="../script/jquery-ui-1.8.9.custom.min.js" type="text/javascript"></script>
    <script src="../script/jquery.ui.selectmenu.js" type="text/javascript"></script>
    <script src="../script/jquery-ui-1.8.9.custom.min.js" type="text/javascript"></script>


    <link rel="stylesheet" type="text/css" href="bootstrap.min.css">


    <%--<script type="text/javascript" src="../script/jquery.min.js"></script>
    <script type="text/javascript" src="../script/jquery-ui.min.js"></script>--%>
    <script type="text/javascript" src="../script/jquery.ui.datepicker-es.js"></script>
    <script type="text/javascript">

        $(document).ready(function () {
            $(".tab_content").hide();
            $("ul.tabs li:first").addClass("active").show();
            $(".tab_content:first").show();

            $("ul.tabs li").click(function () {
                $("ul.tabs li").removeClass("active");
                $(this).addClass("active");
                $(".tab_content").hide();

                var activeTab = $(this).find("a").attr("href");
                $(activeTab).fadeIn();
                return false;
            });
        });
    </script>
    <script type="text/javascript">
        $(function () {
            $("#<%=txtFecha.ClientID %>").datepicker({
                showOn: 'button',
                buttonImage: '../App_Themes/default/images/calend1.jpg',
                buttonImageOnly: true
            });
        });
    </script>
    <script type="text/javascript">
        $(function () {
            $("#<%=txtFecha1.ClientID %>").datepicker({
                showOn: 'button',
                buttonImage: '../App_Themes/default/images/calend1.jpg',
                buttonImageOnly: true
            });
        });
    </script>
    <script type="text/javascript" src="../script/Mascara.js"></script>
    <script type="text/javascript" src="../script/ValidaFecha.js"></script>
    <style type="text/css">
        body {
            background-color: #ddd !important;
        }

        .style7 {
            padding: 0px !important;
        }

        .style8 {
            width: 98px;
        }

        .style9 {
            width: 800px;
        }

        .style12 {
            width: 550px;
        }

        .style13 {
            font-size: 10pt;
            font-family: Calibri;
            color: #333333;
            font-weight: bold;
            width: 98px;
            border-style: none;
            background-color: #FFFFFF;
        }

        .style14 {
            border-style: none;
            font-size: 10pt;
            font-family: Calibri;
            background-color: #FFFFFF;
            color: #333333;
            font-weight: bold;
            width: 692px;
        }

        .auto-style1 {
            font-size: 10pt;
            font-family: Calibri;
            color: #333333;
            font-weight: bold;
            width: 134px;
            border-style: none;
            background-color: #ffffff;
        }

        .auto-style2 {
            width: 134px;
        }
    </style>
</asp:Content>
<asp:Content ID="content" ContentPlaceHolderID="cuerpo" runat="server">
    <%--<asp:HiddenField ID="hdIdIngreso" runat="server" />--%>

    <table style="width: 850px;" align="center" class="myTabla">
        <tr>
            <td colspan="2" class="mytituloTabla">DIAGNOSTICOS
            </td>
        </tr>

        <tr>
            <td class="myLabelIzquierda" colspan="2" style="height: 20px">
                <asp:Label ID="lblMensaje" runat="server" Font-Bold="True" Font-Size="12pt" ForeColor="Black"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="myLabelIzquierda" colspan="2">
                <uc1:PacInternacion ID="DatosPaciente" runat="server" />
            </td>
        </tr>
    </table>


    <div class="row">

        <asp:Panel ID="panelGrillas" runat="server" Width="100%">
            <div class="col-md-8 col-md-offset-2">
                <p class="mytituloTabla">DIAGNOSTICOS</p>
                <asp:Button ID="btnNuevoDiagnostico" runat="server" Text="Nuevo"
                    CssClass="myButton" OnClick="btnNuevoDiagnostico_Click" ValidationGroup="0" />
                <asp:GridView ID="gvLista" runat="server" AutoGenerateColumns="False" CellPadding="4" CssClass="table table-striped table-bordered table-hover"
                    DataKeyNames="idIngresoDiagnostico" EmptyDataText="La internacion no tiene diagnósticos cargados"
                    OnRowCommand="gvLista_RowCommand" OnRowDataBound="gvLista_RowDataBound" Font-Size="9pt"
                    ForeColor="#333333" PageSize="20" Width="100%" GridLines="None">
                    <RowStyle BackColor="#F7F6F3" Font-Names="Arial" Font-Size="8pt" ForeColor="#333333" />
                    <EmptyDataRowStyle CssClass="myLabelIzquierda2" Font-Italic="True" />
                    <Columns>
                        <asp:BoundField DataField="fecha" HeaderText="Fecha/Hora" />
                        <asp:BoundField DataField="diagnostico" HeaderText="Diagnostico"></asp:BoundField>
                        <asp:BoundField DataField="principal" HeaderText="Tipo">
                            <ItemStyle Width="15%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="causaExterna" HeaderText="Causa Externa"></asp:BoundField>
                        <asp:BoundField DataField="lugarCausaExterna" HeaderText="Lugar Causa Externa"></asp:BoundField>
                        <asp:BoundField DataField="diagnosticoCausaExterna" HeaderText="Diag. Causa Externa"></asp:BoundField>
                        <asp:BoundField DataField="fechaRegistro" HeaderText="Fecha Registro" />
                        <asp:TemplateField>
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
                    <HeaderStyle BackColor="DarkGray" Font-Bold="True" ForeColor="white" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
            </div>
            <div class="col-md-8 col-md-offset-2">
                <p class="mytituloTabla">EVENTOS OBSTETRICOS</p>
                <asp:Button ID="btnNuevoEvento" runat="server" Text="Nuevo"
                    CssClass="myButton" OnClick="btnNuevoEvento_Click" ValidationGroup="0" />
                <asp:GridView ID="gvEventosObstetricos" runat="server" AutoGenerateColumns="False" CellPadding="4" CssClass="table table-striped table-bordered table-hover"
                    DataKeyNames="idEventoObstetrico" EmptyDataText="La internacion no tiene eventos obstetricos cargados" Font-Size="9pt"
                    ForeColor="#333333" PageSize="20" Width="100%" GridLines="None" OnRowCommand="gvEventosObstetricos_RowCommand" OnRowDataBound="gvEventosObstetricos_RowDataBound">
                    <Columns>
                        <asp:BoundField DataField="fechaTerminacionEmbarazo" HeaderText="Fecha Terminación Embarazo" />
                        <asp:BoundField DataField="edadGestacional" HeaderText="Edad Gestacional" />
                        <asp:BoundField DataField="paridad" HeaderText="Paridad" />
                        <asp:BoundField DataField="tipoDeParto" HeaderText="Tipo Parto" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:ImageButton ID="EliminarEventoOb" runat="server" CommandName="EliminarEventoOb" ImageUrl="~/App_Themes/default/images/eliminar.jpg"
                                    OnClientClick="return PreguntoEliminar();" />
                            </ItemTemplate>
                            <ItemStyle Height="20px" HorizontalAlign="Center" Width="20px" />
                        </asp:TemplateField>
                    </Columns>
                    <PagerSettings Position="Top" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="DarkGray" Font-Bold="True" ForeColor="white" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
            </div>
        </asp:Panel>

        <asp:Panel ID="panelEventos" runat="server" Width="100%">
            <div class="col-md-8 col-md-offset-2" style="background-color: white; padding: 20px; border: initial">


                <asp:Panel ID="panelDiagnostico" runat="server" Width="100%">
                    <strong>DATOS NUEVO DIAGNOSTICO:</strong>
                    <div class="form-control">
                        <label>Fecha</label>
                        <input id="txtFecha" runat="server" type="text" maxlength="10" onblur="valFecha(this)"
                            onkeyup="mascara(this,'/',patron,true)" tabindex="2" class="myTexto" style="width: 70px" required />&nbsp;&nbsp;&nbsp;                                
                     <%--<asp:RequiredFieldValidator ID="rfvFecha" runat="server" ControlToValidate="txtFecha"
                         ErrorMessage="Fecha del Diagnostico" ValidationGroup="0">Complete la fecha</asp:RequiredFieldValidator>--%>


                        <label>Hora</label>
                        <input id="txtHora" runat="server" class="myTexto" maxlength="5" onblur="valHora(this)"
                            onkeyup="mascara(this,':',patron,true)" style="width: 50px" tabindex="7" title="Ingrese la hora"
                            type="text" required />
                        <%-- <asp:RequiredFieldValidator ID="rfvHora" runat="server" ControlToValidate="txtHora"
                            ErrorMessage="Hora del Diagnostico" ValidationGroup="0">Complete la hora</asp:RequiredFieldValidator>--%>

                        <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="txtFecha"
                            ErrorMessage="La fecha del diagnóstico no puede ser inferior a la fecha de internación"
                            OnServerValidate="CustomValidator1_ServerValidate" ValidationGroup="0">La 
                                  fecha del diagnóstico no puede ser inferior a la fecha de internación</asp:CustomValidator>

                        <anthem:Label ID="lblError" runat="server" Font-Bold="True" ForeColor="#CC0000" TabIndex="100"
                            Font-Italic="True"></anthem:Label>
                    </div>
                    <br />
                    <div class="label-control">
                        <anthem:Label ID="Label9" runat="server" Text="Buscar Diagnóstico:" Width="200px"></anthem:Label>
                    </div>
                    <uc1:DiagnosticoPrincipal ID="cie10Codigo" runat="server" />

                    <anthem:Label ID="lblDiagnostico" runat="server" Font-Bold="True" ForeColor="#CC3300"
                        TabIndex="100" Font-Italic="True"></anthem:Label>
                    <anthem:Label ID="lblIdDiagnostico" runat="server" Font-Bold="True" ForeColor="#CC3300"
                        TabIndex="100" Font-Italic="True" Visible="False"></anthem:Label>

                    <anthem:RadioButtonList ID="rdbTipoDiagnostico" runat="server" RepeatDirection="Vertical"
                        CssClass="myLabelIzquierda">
                        <Items>
                            <asp:ListItem Value="true" Selected="True">Principal (de Egreso)</asp:ListItem> 
                            <asp:ListItem Value="false" Enabled="false">De Evolución (Secundario)</asp:ListItem>
                        </Items>
                    </anthem:RadioButtonList>                    
                </asp:Panel>
                <anthem:Panel ID="panelCausa" runat="server" Width="100%">
                    <strong>Causa Externa del Traumatismo, envenamiento y otros efectos adversos</strong>
                    <br />
                    <anthem:Label ID="Label10" runat="server" Text="Producido por:"></anthem:Label>
                    <anthem:RequiredFieldValidator ID="rfvProducidoPor" runat="server" ControlToValidate="rdbCausaExterna"
                        Enabled="False" ErrorMessage="Producido Por" ValidationGroup="0">*</anthem:RequiredFieldValidator>

                    <asp:RadioButtonList ID="rdbCausaExterna" runat="server" RepeatDirection="Vertical"
                        DataTextField="nombre" DataValueField="idCausaExterna">
                    </asp:RadioButtonList>


                    <anthem:Label ID="Label11" runat="server" Text="Lugar Dónde Ocurrío: "></anthem:Label>
                    <anthem:RequiredFieldValidator ID="rfvLugarCausaExterna" runat="server" ControlToValidate="rdbLugarCausaExterna"
                        Enabled="False" ErrorMessage="Lugar donde ocurrió" ValidationGroup="0">*</anthem:RequiredFieldValidator>

                    <asp:RadioButtonList ID="rdbLugarCausaExterna" runat="server" RepeatDirection="Vertical"
                        DataTextField="nombre" DataValueField="idLugarCausaExterna">
                    </asp:RadioButtonList>
                    <br />
                    Cómo se produjo:                          
                            <uc2:CausaExterna ID="codigoCausaExterna" runat="server" />
                    <anthem:Label ID="lblDiagnosticoCausaExterna" runat="server" Font-Bold="True" ForeColor="#CC3300"
                        TabIndex="100" Font-Italic="True"></anthem:Label>
                    <anthem:Label ID="lblIdDiagnosticoCausaExterna" runat="server" Font-Bold="True" ForeColor="#CC3300"
                        TabIndex="100" Font-Italic="True" Visible="False"></anthem:Label>
                </anthem:Panel>
                <hr />
                <asp:Button ID="btnAgregarDiagnostico" runat="server" Text="Guardar"
                    CssClass="myButton" OnClick="btnAgregarDiagnostico_Click" ValidationGroup="0" />
                <a class="myButton" onclick="NoMostrarEventos()">Cancelar</a>
               <%-- <asp:Button ID="btnCancelarDiagnostico" runat="server" Text="Cancelar"
                    CssClass="myButton" OnClick="btnCancelarDiagnostico_Click" />--%>
            </div>
        </asp:Panel>


        <asp:Panel ID="panelEventosObstetricos" runat="server" Width="100%">
            <div class="col-md-8 col-md-offset-2" style="background-color: white;">

                <br />
                <p><strong>DATOS DEL NUEVO EVENTO OBSTETRICO:</strong></p>

                <div class="col-md-6">
                    <div class="form-group">
                        <label class="control-label col-md-5">Fec. Terminación:</label>
                        <div class="col-md-5">
                            <input id="txtFecha1" runat="server" type="text" maxlength="10" onblur="valFecha(this)"
                                onkeyup="mascara(this,'/',patron,true)" tabindex="2" class="myTexto" style="width: 70px; margin-bottom: 8px;" required />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-5">Edad Gestacional:</label>
                        <div class="col-md-5">
                            <anthem:TextBox ID="txtEdadGestacionl" runat="server" class="myTexto" AutoCallBack="True"
                                Width="55px" TabIndex="3" ToolTip="Edad Gestacional" Style="width: 70px; margin-bottom: 8px;" required></anthem:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-5">Paridad:</label>
                        <div class="col-md-5">
                            <anthem:TextBox ID="txtParidad" runat="server" class="myTexto" AutoCallBack="True"
                                Width="55px" TabIndex="3" ToolTip="Paridad" Style="width: 70px; margin-bottom: 8px" required></anthem:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-5">Tipo de Parto:</label>
                        <div class="col-md-5">
                            <anthem:DropDownList ID="ddlTipoDeParto" runat="server" Style="width: 110px; margin-bottom: 8px">
                                <asp:ListItem Value="0" Text="Seleccionar"></asp:ListItem>
                                <asp:ListItem Value="1" Text="Simple"></asp:ListItem>
                                <asp:ListItem Value="2" Text="Múltiple"></asp:ListItem>
                            </anthem:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvType" runat="server" ControlToValidate="ddlTipoDeParto" Font-Size="Smaller" Display="Dynamic"
                        InitialValue="0" ErrorMessage="Req." ValidationGroup="ddlValidation"></asp:RequiredFieldValidator>
                        </div>
                    </div>                    
               </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="control-label col-md-5">Peso al Nacer:</label>
                        <div class="col-md-5">
                            <anthem:TextBox ID="txtPesoAlNacer" runat="server" class="myTexto" AutoCallBack="True"
                                Width="55px" TabIndex="3" ToolTip="Peso al Nacer"
                                Style="width: 70px; margin-bottom: 8px" required></anthem:TextBox>
                            gr.
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-5">Condición al Nacer:</label>
                        <div class="col-md-5">
                            <anthem:DropDownList ID="ddlCondAlNacer" runat="server" Style="width: 110px; margin-bottom: 8px" >
                                <asp:ListItem Value="Seleccionar"></asp:ListItem>
                                <asp:ListItem Value="1- Nac. Vivo"></asp:ListItem>
                                <asp:ListItem Value="2- Def. Natal"></asp:ListItem>
                            </anthem:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlCondAlNacer" Font-Size="Smaller" Display="Dynamic"
                        InitialValue="Seleccionar" ErrorMessage="Req." ValidationGroup="ddlValidation"></asp:RequiredFieldValidator>
                        </div>
                    </div>                    
                    <div class="form-group">
                        <label class="control-label col-md-5">Terminación:</label>
                        <div class="col-md-5">
                            <anthem:DropDownList ID="ddlTerminacion" runat="server" Style="width: 110px; margin-bottom: 8px">
                                <asp:ListItem Value="Seleccionar"></asp:ListItem>
                                <asp:ListItem Value="1- Vaginal"></asp:ListItem>
                                <asp:ListItem Value="2- Cesárea"></asp:ListItem>
                            </anthem:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlTerminacion" Font-Size="Smaller" Display="Dynamic"
                        InitialValue="Seleccionar" ErrorMessage="Req." ValidationGroup="ddlValidation"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-5">Sexo:</label>
                        <div class="col-md-5">
                            <anthem:DropDownList ID="ddlSexo" runat="server" Style="width: 110px; margin-bottom: 8px">
                                <asp:ListItem Value="0" Text="Seleccionar"></asp:ListItem>
                                <asp:ListItem Value="1" Text="1- Indefinido"></asp:ListItem>
                                <asp:ListItem Value="2" Text="2- Femenino"></asp:ListItem>
                                <asp:ListItem Value="3" Text="3- Masculino"></asp:ListItem>
                            </anthem:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlSexo" Font-Size="Smaller" Display="Dynamic"
                        InitialValue="0" ErrorMessage="Req." ValidationGroup="ddlValidation"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>

                <hr />
                <div class="col-md-8">
                    <asp:Button ID="btnAgregarEventoObstetrico" CssClass="myButton" runat="server"
                        Text="Guardar" OnClick="btnAgregarEventoObstetrico_Click" ValidationGroup="ddlValidation" />
                    <a class="myButton" onclick="NoMostrarParto()">Cancelar</a>
                </div>
                <br />
            </div>
        </asp:Panel>


        <div class="col-md-8 col-md-offset-2">
            <hr />
            <asp:Button ID="btnVolver" runat="server" Text="Volver" CssClass="myButton" OnClick="btnVolver_Click" />
        </div>

    </div>




    <script lang="javascript" type="text/javascript">
        function PreguntoGuardar() {
            if (confirm('¿Está seguro de generar este pase?. No podrá revertirlo.'))
                return true;
            else
                return false;
        }

        function PreguntoEliminar() {
            if (confirm('¿Está seguro de eliminar el registro?'))
                return true;
            else
                return false;
        }

        function MostrarNuevoDiagnostico() {
            alert('puto');
            $('#<%= panelDiagnostico.ClientID %>').css('display', 'block');

        }

        function NoMostrarEventos() {
            $('#<%= panelEventos.ClientID %>').css('display', 'none');
            $('#<%= panelGrillas.ClientID %>').css('display', 'online');
        }

        function NoMostrarParto() {
            $('#<%= panelEventosObstetricos.ClientID %>').css('display', 'none');
            $('#<%= panelGrillas.ClientID %>').css('display', 'block');

        }

        function colocarElFocoEnParto() {
            $("#<%=txtFecha1.ClientID %>").focus();
        }

    </script>


</asp:Content>

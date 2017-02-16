<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EventoObstetricoEdit.aspx.cs" Inherits="WebInternacion.Ingresos.EventoObstetricoEdit" MasterPageFile="~/Site1.Master" %>
<%@ Register assembly="Anthem" namespace="Anthem" tagprefix="anthem" %>
<asp:Content ID="content1" ContentPlaceHolderID="head" runat="server">

  
    <link type="text/css"rel="stylesheet"      href="../script/jquery-ui-1.7.1.custom.css" />  

  <script type="text/javascript"      src="../script/jquery.min.js"></script> 
  <script type="text/javascript"      src="../script/jquery-ui.min.js"></script> 
    
      <script type="text/javascript"     src="../script/jquery.ui.datepicker-es.js"></script>   
      
      <script type="text/javascript"> 
    
    $(document).ready(function()   
{   
    $(".tab_content").hide();   
    $("ul.tabs li:first").addClass("active").show();   
    $(".tab_content:first").show();   
  
    $("ul.tabs li").click(function()   
       {   
        $("ul.tabs li").removeClass("active");   
        $(this).addClass("active");   
        $(".tab_content").hide();   
 
        var activeTab = $(this).find("a").attr("href");   
        $(activeTab).fadeIn();   
        return false;   
    });   
});  

    

	$(function() {
		$("#<%=txtFecha.ClientID %>").datepicker({
			showOn: 'button',
			buttonImage: '../App_Themes/default/images/calend1.jpg',
			buttonImageOnly: true
		});
	});

      

     
  </script>  
  
  
   	 <script type="text/javascript" src="../script/Mascara.js"></script>
    <script type="text/javascript" src="../script/ValidaFecha.js"></script>   
 

   
    </asp:Content>
<asp:Content ID="content" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">    

 

    <table style="width:750px;" align="center">
        <tr>
            <td colspan="2" class="mytituloTabla">
                EVENTOS OBSTETRICOS</td>
        </tr>
        <tr>
            <td colspan="2">
               <hr />
            </td>
        </tr>
          <tr>
            <td  colspan="2">
            
                     <table style="width: 100%;">
                       <tr>
                           <td class="myLabelIzquierda" style="width: 132px">
                               Nro. Internación:</td>
                           <td class="myLabelIzquierda" style="width: 78%">
                               <asp:Label ID="lblNumero" runat="server" CssClass="myLabel" 
                                   Text="Label"></asp:Label>
                           </td>
        </tr>
                         <tr>
                             <td class="myLabelIzquierda" style="width: 132px">
                                 Fecha:</td>
                             <td class="myLabelIzquierda" style="width: 78%">
                                 <asp:Label ID="lblFecha" runat="server" CssClass="myLabel" 
                                     Text="Label"></asp:Label>
                             </td>
                         </tr>
                         <tr>
                             <td class="myLabelIzquierda" style="width: 132px">
                                 Paciente:</td>
                             <td class="myLabelIzquierda" style="width: 78%">
                                 <asp:Label ID="lblPaciente" runat="server" Text="Label"></asp:Label>
                             </td>
                         </tr>
                         <tr>
                             <td class="myLabelIzquierda" style="width: 132px">
                                 Fecha de Nacimiento:</td>
                             <td class="myLabelIzquierda" style="width: 78%">
                                 <asp:Label ID="lblFechaNacimiento" runat="server" CssClass="myLabel" 
                                     Text="Label"></asp:Label>
                             </td>
                         </tr>
        <tr>
            <td class="myLabelIzquierda" style="width: 132px">
                Edad:</td>
            <td style="width: 78%">
              <asp:Label ID="lblEdad" CssClass="myLabel" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="myLabelIzquierda" style="width: 132px">
                Sexo:</td>
            <td style="width: 78%">
              <asp:Label ID="lblSexo" CssClass="myLabel" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="myLabelIzquierda" style="width: 132px">
                Obra Social:</td>
            <td style="vertical-align: top; width: 78%;">
                &nbsp;</td>
        </tr>
                     </table>
                 
   
                                    </td>
        </tr>

        <tr>
            <td class="myLabelIzquierda" colspan="2">
               <hr /></td>
        </tr>
        <tr>
            <td class="myLabelIzquierda" style="width: 103px">
                Fecha Parto:</td>
            <td style="width: 537px">
              <input id="txtFecha" runat="server" type="text" maxlength="10" 
                         onblur="valFecha(this)" 
                        onkeyup="mascara(this,'/',patron,true)" tabindex="2" class="myTexto" 
                                style="width: 70px"  />
            </td>
        </tr>
        <tr>
              <td class="myLabelIzquierda" style="width: 103px">
                  Edad Gestional:<asp:RequiredFieldValidator 
                         ID="rfvHora" runat="server" ControlToValidate="txtHora" 
                         ErrorMessage="Hora ingreso" ValidationGroup="0">*</asp:RequiredFieldValidator></td>
            <td style="width: 537px">
                  <input id="txtHora" runat="server" type="text" maxlength="5" 
                        style="width: 50px"   onblur="valHora(this)"              
                        onkeyup="mascara(this,':',patron,true)" tabindex="7" class="myTexto" 
                                title="Ingrese la hora"  />&nbsp;
            </td>
        </tr>
        <tr>
            <td class="myLabelIzquierda" style="width: 103px">
                Tipo de Parto:<asp:RequiredFieldValidator 
                         ID="rfvTipoEgreso" runat="server" ControlToValidate="ddlTipoParto" 
                         ErrorMessage="Tipo de Ingreso" ValidationGroup="0">*</asp:RequiredFieldValidator></td>
              <td class="myLabelIzquierda" style="width: 537px">
                  <asp:DropDownList ID="ddlTipoParto" runat="server">
                      <asp:ListItem Value="0">--Seleccione--</asp:ListItem>
                      <asp:ListItem Value="1">Simple</asp:ListItem>
                      <asp:ListItem Value="2">Múltiple</asp:ListItem>
                  </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="myLabelIzquierda" style="width: 103px">
                Paridad:</td>
            <td style="width: 537px">
                  <input id="txtHora0" runat="server" type="text" maxlength="5" 
                        style="width: 50px"   onblur="valHora(this)"              
                        onkeyup="mascara(this,':',patron,true)" tabindex="7" class="myTexto" 
                                title="Ingrese la hora"  /></td>
        </tr>
       
        <tr>
            <td class="myLabelIzquierda" style="width: 103px">
                &nbsp;</td>
            <td style="width: 537px">
                        <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="myButton" />
                    </td>
        </tr>
       
        <tr>
            <td class="myLabelIzquierda" style="width: 103px">
                &nbsp;</td>
            <td style="width: 537px">
                        &nbsp;</td>
        </tr>
       
        <tr>
            <td class="myLabelIzquierda" colspan="2">
                <table class="myLabelLitlle" style="width:100%;" cellpadding="1" 
                    cellspacing="0">
                    <tr>
                        <td style="background-color: #CCCCCC">
                            Peso al Nacer en Gramos</td>
                           <td style="background-color: #CCCCCC">
                            Condición al Nacer</td>
                           <td style="background-color: #CCCCCC">
                            Terminación</td>
                           <td style="background-color: #CCCCCC">
                            Sexo</td>
                           <td style="background-color: #CCCCCC">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                  <input id="txtHora1" runat="server" type="text" maxlength="5" 
                        style="width: 50px"   onblur="valHora(this)"              
                        onkeyup="mascara(this,':',patron,true)" tabindex="7" class="myTexto" 
                                title="Ingrese la hora"  /></td>
                        <td>
                            <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                                RepeatDirection="Horizontal">
                                <asp:ListItem>Nacido Vivo</asp:ListItem>
                                <asp:ListItem>Def. Fetal</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td>
                            <asp:RadioButtonList ID="RadioButtonList2" runat="server" 
                                RepeatDirection="Horizontal">
                                <asp:ListItem>Vaginal</asp:ListItem>
                                <asp:ListItem>Cesárea</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td>
                            <asp:RadioButtonList ID="RadioButtonList3" runat="server" 
                                RepeatDirection="Horizontal">
                                <asp:ListItem>Masculino</asp:ListItem>
                                <asp:ListItem>Femenino</asp:ListItem>
                                <asp:ListItem>Indeterminado</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td>
                        <asp:Button ID="btnGuardar0" runat="server" Text="Agregar" CssClass="myButton" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
       
        <tr>
            <td colspan="2">
                &nbsp;</td>
        </tr>
      
    
       
       
        <tr>
              <td class="myLabelIzquierda" colspan="2">
                  
               
                  
                                                            <asp:GridView ID="gvLista" 
                      runat="server" 
                                                                AutoGenerateColumns="False" 
                      BorderColor="#3A93D2" BorderStyle="Solid" 
                                                                BorderWidth="1px" 
                      CellPadding="2" DataKeyNames="idIngreso" 
                                                                EmptyDataText="No hay eventos obstetricos cargados" 
                                                                Font-Size="9pt" 
                      ForeColor="#666666" GridLines="Horizontal" 
                                                                PageSize="1" Width="100%">
                                                                <RowStyle BackColor="White" Font-Names="Arial" Font-Size="8pt" 
                                                                    ForeColor="#333333" />
                                                                <Columns>
                                                                    <asp:BoundField DataField="fechaParto" HeaderText="Fecha Parto" >
                                                                        <ItemStyle Width="15%" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="edadGestacional" HeaderText="Edad Gestacional" >
                                                                        <ItemStyle Width="10%" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="tipoParto" HeaderText="Tipo Parto">
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="pesoNacer" HeaderText="Peso al Nacer">
                                                                        <ItemStyle Width="15%" HorizontalAlign="Center" />
                                                                        <ItemStyle Width="15%" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="username" HeaderText="Usuario">
                                                                        <ItemStyle Width="5%" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="fechaRegistro" HeaderText="Fecha Act.">
                                                                        <ItemStyle Font-Size="7pt" Width="10%" />
                                                                    </asp:BoundField>
                                                                    <asp:TemplateField>
                                                                        <ItemTemplate>
                                                                            <asp:ImageButton ID="Eliminar" runat="server" CommandName="Eliminar" 
                                                                                ImageUrl="~/App_Themes/default/images/eliminar.jpg" 
                                                                                OnClientClick="return PreguntoEliminar();" />
                                                                        </ItemTemplate>
                                                                        <ItemStyle Height="20px" HorizontalAlign="Center" Width="20px" />
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                                <PagerSettings Mode="NumericFirstLast" Position="Top" />
                                                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                                <PagerStyle BackColor="#E6E6E6" ForeColor="Black" HorizontalAlign="Right" />
                                                                <SelectedRowStyle BackColor="White" Font-Bold="True" ForeColor="#333333" />
                                                                <HeaderStyle BackColor="#3A93D2" Font-Bold="False" Font-Names="Arial" 
                                                                    Font-Size="8pt" ForeColor="White" />
                                                                <EditRowStyle BackColor="#999999" />
                                                            </asp:GridView>
                  
               
                  
                  </td>
        </tr>
        <tr>
            <td class="myLabelIzquierda" style="width: 103px">
                &nbsp;</td>
            <td align="left" style="width: 537px">
                        &nbsp;</td>
        </tr>
        <tr>
             <td class="myLabelIzquierda" style="width: 103px">
                 &nbsp;</td>
            <td align="left" style="width: 537px">
                        &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
              <hr /></td>
        </tr>
        <tr>
            <td style="width: 103px">
                &nbsp;</td>
            <td align="right" style="width: 537px">
                        &nbsp;</td>
        </tr>
    </table>

			
 </asp:Content>
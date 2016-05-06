<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Start/GisRI.Master"
    CodeBehind="Smaltiti.aspx.vb" Inherits="GisRI_Web.fSmaltiti" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Src="../Controls/rTextBox.ascx" TagName="rTextBox" TagPrefix="cc" %>
<%@ Register Src="../Controls/rTextData.ascx" TagName="rTextData" TagPrefix="cc" %>
<%@ Register Src="../Controls/rDropDown.ascx" TagName="rDropDown" TagPrefix="cc" %>
<%@ Register Src="../Controls/rCheckBox.ascx" TagName="rCheckBox" TagPrefix="cc" %>
<%@ Register Src="../Controls/rRadioButton.ascx" TagName="rRadioButton" TagPrefix="cc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function grid_search(sender, eventArgs, uniqueName) {
            eventArgs.cancelBubble = true;
            eventArgs.returnValue = false;
            if (eventArgs.stopPropagation) {
                eventArgs.stopPropagation();
                eventArgs.preventDefault();
            }
            var masterTableView = $find("<%= RGSmaltimenti.ClientID %>").get_masterTableView();

            //alert(sender.value);
            masterTableView.filter(uniqueName, sender.value, Telerik.Web.UI.GridFilterFunction.Contains);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body_up" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <div class="content-panel">
                <h3 style="margin:0px!Important;">
                    <a href="../Start/Home_Sito.aspx">
                        <i class="fa fa-home"></i>&nbsp;<asp:Literal ID="ltl_st_denominazione" runat="server"></asp:Literal>
                    </a>
                </h3>
            </div> 
        </div> 
        <div class="col-md-12">
            <div class="content-panel" id="panel_elenco" runat="server" visible="true">
                <div class="row" style="height:40px!Important;">
					<div class="gisri_panel_title gisri_title_margin">
                        <div class="gisri_title_left">
                            <asp:LinkButton ID="btn_filtri" runat="server" CssClass="btn btn-default"
                                ToolTip="Visualizza maschera dei filtri" Style="padding-top:6px; padding-left:10px;">
                                <i class="fa fa-filter"></i>
                            </asp:LinkButton>
                        </div> 
						<div class="gisri_title_left">
                            <h3 style="padding-left: 10px; margin-top: 0px!Important;">
                                ELENCO RIFIUTI A DESTINO</h3>
						</div>
						<div class="gisri_button_right" id="div_nuovo" runat="server">
						</div>
					</div>
				</div>
                <div class="row" id="div_filtri_boh" runat="server" visible="true">
                </div> 
                <div class="row" id="div_filtri" runat="server" visible="false">
                    <div class="form-body" style="margin-left: 30px!Important; margin-right: 35px!Important; margin-bottom:10px;">
                        <div class="row">
                            <div class="col-xs-1 gisri_row_filter">
                                <div class="input-group" style="width:100%">
                                    <div>
                                        <asp:TextBox ID="txt_filter_cer" runat="server" CssClass="form-control gisri_form_filter"
                                            placeholder="CER" onChange="grid_search(this, event, 'rs_codici_cer_cod');" ></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-3 gisri_row_filter">
                                <div class="input-group" style="width:100%">
                                    <div>
                                        <asp:TextBox ID="txt_filter_produttore" runat="server" CssClass="form-control gisri_form_filter"
                                            placeholder="Produttore" onChange="grid_search(this, event, 'rs_proprietario_desc');" ></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-2 gisri_row_filter">
                                <div class="input-group" style="width:100%">
                                    <div>
                                        <asp:TextBox ID="txt_filter_smaltitore" runat="server" CssClass="form-control gisri_form_filter"
                                            placeholder="Smaltitore" onChange="grid_search(this, event, 'rs_destinatario_desc');" ></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-2 gisri_row_filter">
                                <div class="input-group" style="width:100%">
                                    <div>
                                        <asp:TextBox ID="txt_filter_trasportatore" runat="server" CssClass="form-control gisri_form_filter"
                                            placeholder="Trasportatore" onChange="grid_search(this, event, 'rs_trasportatore_desc');" ></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-1 gisri_row_filter">
                                <div class="input-group" style="width:100%">
                                    <div>
                                        <asp:TextBox ID="txt_filter_fir" runat="server" CssClass="form-control gisri_form_filter"
                                            placeholder="Numero Fir" onChange="grid_search(this, event, 'rs_formulario_numero');" ></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-2 gisri_row_filter">
                                <div class="input-group" style="width:100%">
                                    <div>
                                        <asp:DropDownList ID="ddl_filter_stati" runat="server" CssClass="form-control gisri_form_filter" onChange="grid_search(this, event, 'rs_stato_attuale');">
                                            <asp:ListItem Text="Tutti gli stati" Value=""></asp:ListItem>
                                            <asp:ListItem Text="Ricevuta 4° Copia" Value="ricevuta 4° copia"></asp:ListItem>
                                            <asp:ListItem Text="Da Registrare" Value="da registrare"></asp:ListItem>
                                            <asp:ListItem Text="Registrato" Value="registrato"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-1 gisri_row_filter gisri_row_filter_right">
                                <asp:LinkButton ID="btn_reset_filter" runat="server" CssClass="btn btn-default btn-xs gisri_button_ws"
                                    ToolTip="Pulisce Filtri" Height="25" Style="padding-top:6px; padding-left:1px;">
                                    <i class="fa fa-eraser"></i>  
                                </asp:LinkButton>
                            </div> 
                        </div>
                    </div>                            
                </div> 
                <div class="alert alert-danger alert-dismissable" id="div_message_ko" runat="server"
                    visible="false">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">
                        x
                    </button>
                    <i class="fa-lg fa fa-warning"></i><strong>Attenzione!</strong>
                    <asp:Literal ID="ltl_messaggio_ko" runat="server"></asp:Literal>
                </div>
                <div class="alert alert-success alert-dismissable" id="div_message_ok" runat="server"
                    visible="false">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">
                        x
                    </button>
                    <strong>
                        <asp:Literal ID="ltl_messaggio_ok" runat="server"></asp:Literal></strong>
                </div>
                <telerik:RadGrid ID="RGSmaltimenti" AutoGenerateColumns="False" CssClass="overflow" style="width: 100% !important" runat="server"
                    ShowFooter="false" AllowPaging="True" AllowSorting="True" GridLines="None" PageSize="25"
                    Width="100%" AllowMultiRowSelection="true" Skin="MyCustomSkin" EnableEmbeddedSkins="false"
                    AllowFilteringByColumn="true" Culture="it-IT">
                    <GroupingSettings CaseSensitive="false" />
                    <PagerStyle Mode="NextPrevAndNumeric" CssClass=""></PagerStyle>
                    <HeaderStyle CssClass=""></HeaderStyle>
                    <ItemStyle HorizontalAlign="Left"></ItemStyle>
                    <AlternatingItemStyle CssClass="" HorizontalAlign="Left"></AlternatingItemStyle>
                    <FilterItemStyle HorizontalAlign="Left" />
                    <MasterTableView ShowFooter="false" Width="100%" DataKeyNames="rifiuto_smaltimento_key" AllowMultiColumnSorting="True">
                        <Columns>
                            <telerik:GridTemplateColumn SortExpression="rs_codici_cer_cod" UniqueName="rs_codici_cer_cod"
                                HeaderText="CER" DataField="rs_codici_cer_cod" HeaderStyle-Width="5%" AllowFiltering="true"
                                ShowFilterIcon="false" FilterControlWidth="50px" AutoPostBackOnFilter="true"
                                CurrentFilterFunction="Contains" >
                                <ItemStyle Wrap="false"  Font-Bold="true" />
                                <ItemTemplate>
                                    <asp:Label ID="lblrs_codici_cer_cod" runat="server"></asp:Label>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn SortExpression="rs_proprietario_desc" UniqueName="rs_proprietario_desc"
                                HeaderText="Prodotto Da" DataField="rs_proprietario_desc" HeaderStyle-Width="20%" AllowFiltering="true"
                                ShowFilterIcon="false" FilterControlWidth="120px" AutoPostBackOnFilter="true"
                                CurrentFilterFunction="Contains">
                                <ItemTemplate>
                                    <asp:Label ID="lblrs_produttore_desc" runat="server"></asp:Label>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn SortExpression="rs_data_trasporto" UniqueName="rs_data_trasporto"
                                HeaderText="Trasporto" DataField="rs_data_trasporto" HeaderStyle-Width="10%" AllowFiltering="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblrs_data_trasporto" runat="server"></asp:Label>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn SortExpression="rs_data_rientro" UniqueName="rs_data_rientro"
                                HeaderText="Rientro" DataField="rs_data_rientro" HeaderStyle-Width="10%" AllowFiltering="false"
                                ItemStyle-CssClass="additionalColumn" HeaderStyle-CssClass="additionalColumn" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblrs_data_rientro" runat="server"></asp:Label>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn SortExpression="rs_formulario_numero" UniqueName="rs_formulario_numero"
                                HeaderText="FIR Num/Del" DataField="rs_formulario_numero" HeaderStyle-Width="10%" AllowFiltering="true"
                                ShowFilterIcon="false" FilterControlWidth="50px" AutoPostBackOnFilter="true"
                                CurrentFilterFunction="Contains">
                                <ItemTemplate>
                                    <asp:Label ID="lblformulario_data" runat="server"></asp:Label>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn SortExpression="rs_destinatario_desc" UniqueName="rs_destinatario_desc"
                                HeaderText="Smaltitore" DataField="rs_destinatario_desc" HeaderStyle-Width="20%" AllowFiltering="true"
                                ShowFilterIcon="false" FilterControlWidth="100px" AutoPostBackOnFilter="true"
                                CurrentFilterFunction="Contains"
                                ItemStyle-CssClass="additionalColumn" HeaderStyle-CssClass="additionalColumn" >
                                <ItemTemplate>
                                    <asp:Label ID="lblrs_destinatario_desc" runat="server"></asp:Label>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn SortExpression="rs_trasportatore_desc" UniqueName="rs_trasportatore_desc"
                                HeaderText="Trasportatore" DataField="rs_trasportatore_desc" HeaderStyle-Width="20%" AllowFiltering="true"
                                ShowFilterIcon="false" FilterControlWidth="100px" AutoPostBackOnFilter="true"
                                CurrentFilterFunction="Contains">
                                <ItemTemplate>
                                    <asp:Label ID="lblrs_trasportatore_desc" runat="server"></asp:Label>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn SortExpression="" UniqueName="rs_peso_volume_iniziale"
                                HeaderText="Peso e Volume" DataField="rs_peso_volume_iniziale" HeaderStyle-Width="10%" AllowFiltering="false"
                                ItemStyle-CssClass="additionalColumn" HeaderStyle-CssClass="additionalColumn" >
                                <ItemStyle Wrap="false" />
                                <ItemTemplate>
                                    <asp:Label ID="lblrs_peso_volume" runat="server"></asp:Label>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="rf_stato_allegati" SortExpression="" DataField="" 
                                InitializeTemplatesFirst="false" HeaderStyle-Width="1%" HeaderText="" AllowFiltering="false" >
                                <ItemTemplate>
                                    <asp:Label ID="ltl_stato_allegati" runat="server" Style="width: 100%; height: 100%;">
                                    </asp:Label>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="rs_stato_attuale" SortExpression="rs_stato_attuale" InitializeTemplatesFirst="false"
                                HeaderStyle-Width="1%" DataField="rs_stato_attuale" HeaderText="Stato" AllowFiltering="true" >
                                <ItemTemplate>
                                    <asp:Label ID="ltl_stato" runat="server" Style="width: 100%; height: 100%;">
                                        <span class="label label-sito-acquisito label-full-width"></span>
                                    </asp:Label>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="TemplateColumnGo" SortExpression="" InitializeTemplatesFirst="false"
                                HeaderStyle-Width="1%" AllowFiltering="false">
                                <ItemStyle HorizontalAlign="Right"  />
                                <ItemTemplate>
                                    <asp:LinkButton ID="btn_trasporto" runat="server" CssClass="btn btn-fir btn-xs button-link-w gisri_button_list"
                                        CommandName="TRASPORTO">
                                                <i class=" fa fa-edit"></i>&nbsp;DETTAGLIO FIR</i>
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="btn_scheda" runat="server" CssClass="btn btn-quarta btn-xs button-link-w gisri_button_list"
                                        CommandName="SCHEDA">
                                                <i class=" fa fa-edit"></i>&nbsp;DETTAGLIO 4° COPIA</i>
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="btn_commerciale" runat="server" CssClass="btn btn-primary btn-xs button-link-w gisri_button_list"
                                        CommandName="COMMERCIALE">
                                                <i class=" fa fa-edit"></i>&nbsp;ALTRI DATI</i>
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                        </Columns>
                    </MasterTableView>
                    <ClientSettings EnableRowHoverStyle="true">
                        <Selecting AllowRowSelect="false" />
                    </ClientSettings>
                </telerik:RadGrid>
            </div>
            <!-- /content-panel lista-->
        </div>
        <!-- /col-md-12 -->
    </div>
    <!-- /row -->
</asp:Content>

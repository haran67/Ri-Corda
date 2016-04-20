﻿<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Start/GisRI.Master"
    CodeBehind="Registro.aspx.vb" Inherits="GisRI_Web.fRegistro" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Src="../Controls/rTextBox.ascx" TagName="rTextBox" TagPrefix="cc" %>
<%@ Register Src="../Controls/rTextData.ascx" TagName="rTextData" TagPrefix="cc" %>
<%@ Register Src="../Controls/rTextNumero.ascx" TagName="rTextNumero" TagPrefix="cc" %>
<%@ Register Src="../Controls/rDropDown.ascx" TagName="rDropDown" TagPrefix="cc" %>
<%@ Register Src="../Controls/rCheckBox.ascx" TagName="rCheckBox" TagPrefix="cc" %>
<%@ Register Src="../Controls/rRadioButton.ascx" TagName="rRadioButton" TagPrefix="cc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function Init_bootstrapSwitch() {
            if (!$().bootstrapSwitch) {
                return;
            }
            $('.make-switch').bootstrapSwitch();
        }

        function grid_search(sender, eventArgs, uniqueName) {
            eventArgs.cancelBubble = true;
            eventArgs.returnValue = false;
            if (eventArgs.stopPropagation) {
                eventArgs.stopPropagation();
                eventArgs.preventDefault();
            }
            var masterTableView = $find("<%= RGRegistri.ClientID %>").get_masterTableView();

            masterTableView.filter(uniqueName, sender.value, Telerik.Web.UI.GridFilterFunction.Contains);
        }

        function Init_Dirty() {
            $("#<%=div_overview.ClientID%>").dirtyForms();
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body_up" runat="server">
    <div style="height:10px;"></div>
    <div class="row">
        <div class="col-lg-12">
            <div class="content-panel" style="padding-left:10px!Important;padding-top:0px!Important; margin-bottom:10px;">
                <div class="row" style="height:39px!Important;">
                    <div class="gisri_panel_title gisri_title_margin">
                        <div class="gisri_title_left">
                            <h3 style="margin:0px!Important;">
                                <a href="../Start/Home_Sito.aspx">
                                    <i class="fa fa-home"></i>&nbsp;<asp:Literal ID="ltl_st_denominazione" runat="server"></asp:Literal>
                                </a>
                            </h3>
                        </div>
                        <div class="gisri_button_right">
                            <asp:LinkButton ID="btn_indietro" runat="server" ToolTip="Torna indietro" CssClass="btn btn-warning"><i class="fa fa-angle-left"></i>&nbsp;&nbsp;Torna Indietro</asp:LinkButton>
                        </div>
                    </div>
                </div>
            </div> 
        </div> 
        <div class="col-md-12">
            <div class="content-panel" id="panel_elenco" runat="server" visible="true" style="padding-left:10px!Important;padding-top:0px!Important; margin-bottom:10px;">
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
								ELENCO REGISTRI DEL SITO</h3>
						</div>
						<div class="gisri_button_right" id="div_nuovo" runat="server">
							<asp:LinkButton ID="btn_nuovo" runat="server" ToolTip="Nuova societa" CssClass="btn btn-primary"><i class="fa fa-plus"></i>&nbsp;&nbsp;Nuovo Registro</asp:LinkButton>
						</div>
					</div>
				</div>
                <div class="row" id="div_filtri_boh" runat="server" visible="true">
                </div> 
                <div class="row" id="div_filtri" runat="server" visible="false">
                    <div class="form-body" style="margin-left: 30px!Important; margin-right: 35px!Important; margin-bottom:10px;">
                        <div class="row">
                            <div class="col-xs-4 gisri_row_filter">
                                <div class="input-group" style="width:100%">
                                    <div>
                                        <asp:TextBox ID="txt_filter_intestatario" runat="server" CssClass="form-control gisri_form_filter"
                                            placeholder="Intestatario" onChange="grid_search(this, event, 'rr_proprietario_desc');" ></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-4 gisri_row_filter">
                                <div class="input-group" style="width:100%">
                                    <div>
                                        <asp:TextBox ID="txt_filter_titolo" runat="server" CssClass="form-control gisri_form_filter"
                                            placeholder="Titolo" onChange="grid_search(this, event, 'rr_titolo');" ></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-3 gisri_row_filter">
                                <div class="input-group" style="width:100%">
                                    <div>
                                        <asp:TextBox ID="txt_filter_protocollo" runat="server" CssClass="form-control gisri_form_filter"
                                            placeholder="Numero protocollo" onChange="grid_search(this, event, 'rr_protocollo_numero');" ></asp:TextBox>
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
                <telerik:RadGrid ID="RGRegistri" AutoGenerateColumns="False" CssClass="" runat="server"
                    ShowFooter="false" AllowPaging="True" AllowSorting="True" GridLines="None" PageSize="25"
                    Width="100%" AllowMultiRowSelection="true" Skin="MyCustomSkin" EnableEmbeddedSkins="false"
                    AllowFilteringByColumn="true" Culture="it-IT">
                    <GroupingSettings CaseSensitive="false" />
                    <PagerStyle Mode="NextPrevAndNumeric" CssClass=""></PagerStyle>
                    <HeaderStyle CssClass=""></HeaderStyle>
                    <ItemStyle HorizontalAlign="Left"></ItemStyle>
                    <AlternatingItemStyle CssClass="" HorizontalAlign="Left"></AlternatingItemStyle>
                    <FilterItemStyle HorizontalAlign="Left" />
                    <MasterTableView ShowFooter="false" Width="100%" DataKeyNames="registro_rifiuti_key" AllowMultiColumnSorting="True">
                        <Columns>
                            <telerik:GridTemplateColumn SortExpression="rr_proprietario_desc" UniqueName="rr_proprietario_desc"
                                HeaderText="Intestatario" DataField="rr_proprietario_desc" HeaderStyle-Width="15%" AllowFiltering="true"
                                ShowFilterIcon="false" FilterControlWidth="150px" AutoPostBackOnFilter="true"
                                CurrentFilterFunction="Contains" ItemStyle-CssClass="additionalColumn" HeaderStyle-CssClass="additionalColumn">
                                <ItemTemplate>
                                    <asp:Label ID="lblrr_proprietario_desc" runat="server"></asp:Label>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn SortExpression="rr_titolo" UniqueName="rr_titolo" HeaderText="Titolo"
                                DataField="rr_titolo" HeaderStyle-Width="15%" AllowFiltering="true"
                                ShowFilterIcon="false" FilterControlWidth="100px" AutoPostBackOnFilter="true"
                                CurrentFilterFunction="Contains" />
                            <telerik:GridBoundColumn SortExpression="rr_protocollo_numero" UniqueName="rr_protocollo_numero" HeaderText="Prot.N."
                                DataField="rr_protocollo_numero" HeaderStyle-Width="4%" AllowFiltering="true"
                                ShowFilterIcon="false" FilterControlWidth="50px" AutoPostBackOnFilter="true"
                                CurrentFilterFunction="Contains" />
                            <telerik:GridTemplateColumn SortExpression="rr_protocollo_data" UniqueName="rr_protocollo_data"
                                HeaderText="Prot. Data" DataField="rr_protocollo_data" HeaderStyle-Width="10%" AllowFiltering="false"
                                ItemStyle-CssClass="additionalColumn" HeaderStyle-CssClass="additionalColumn" >
                                <ItemTemplate>
                                    <asp:Label ID="lblrr_protocollo_data" runat="server"></asp:Label>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn SortExpression="" UniqueName="rr_data_inizio"
                                HeaderText="Data Inizio" DataField="rr_data_inizio" HeaderStyle-Width="10%" AllowFiltering="false"
                                ItemStyle-CssClass="additionalColumn" HeaderStyle-CssClass="additionalColumn" >
                                <ItemTemplate>
                                    <asp:Label ID="lblrr_data_inizio" runat="server"></asp:Label>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn SortExpression="" UniqueName="rr_data_fine"
                                HeaderText="Ultimo Mov." DataField="rr_data_fine" HeaderStyle-Width="10%" AllowFiltering="false"
                                ItemStyle-CssClass="additionalColumn" HeaderStyle-CssClass="additionalColumn" >
                                <ItemTemplate>
                                    <asp:Label ID="lblrr_data_fine" runat="server"></asp:Label>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn SortExpression="" UniqueName="numero_inizio"
                                HeaderText="Progr. Inizio" DataField="numero_inizio" HeaderStyle-Width="5%" AllowFiltering="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblnumero_inizio" runat="server"></asp:Label>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn SortExpression="" UniqueName="numero_fine"
                                HeaderText="Ultimo Progr." DataField="numero_fine" HeaderStyle-Width="5%" AllowFiltering="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblnumero_fine" runat="server"></asp:Label>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn SortExpression="" UniqueName="movimenti_car"
                                HeaderText="Mov. Car." DataField="movimenti_car" HeaderStyle-Width="3%" AllowFiltering="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblmovimenti_car" runat="server"></asp:Label>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn SortExpression="" UniqueName="movimenti_sca"
                                HeaderText="Mov. Scar." DataField="movimenti_sca" HeaderStyle-Width="3%" AllowFiltering="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblmovimenti_sca" runat="server"></asp:Label>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn SortExpression="rr_stato_registro" UniqueName="rr_stato_registro"
                                HeaderText="" DataField="rr_stato_registro" HeaderStyle-Width="1%" AllowFiltering="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblrr_stato_registro" runat="server" Font-Size="15"></asp:Label>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="TemplateColumnGo" SortExpression="" InitializeTemplatesFirst="false"
                                HeaderStyle-Width="1%" AllowFiltering="false">
                                <ItemStyle HorizontalAlign="Right" />
                                <ItemTemplate>
                                    <asp:LinkButton ID="btn_scheda" runat="server" CssClass="btn btn-primary btn-xs button-link-w gisri_button_list"
                                        CommandName="SCHEDA">
                                                <i class=" fa fa-edit"></i>&nbsp;SCHEDA</i>
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="btn_movimenti" runat="server" CssClass="btn btn-warning btn-xs button-link-w gisri_button_list"
                                        CommandName="MOVIMENTI">
                                                <i class=" fa fa-file-text-o"></i>&nbsp;MOVIMENTI</i>
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="btn_esporta" runat="server" CssClass="btn btn-success btn-xs button-link-w gisri_button_list"
                                        CommandName="ESPORTA">
                                                <i class=" fa fa-file-excel-o"></i>&nbsp;ESPORTA</i>
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
            <div class="content-panel" id="panel_dati" runat="server" style="display: none;">
                <div class="gisri_panel_title">
                    <div class="gisri_title_left">
                        <h3 style="padding-left: 10px; margin-top: 0px!Important;">
                            <i class="fa fa-angle-right"></i>DETTAGLIO REGISTRO</h3>
                    </div>
                    <div class="gisri_button_right" id="div_ritorno" runat="server">
                        <asp:LinkButton ID="btn_return" runat="server" ToolTip="Torna all'elenco" CssClass="btn btn-warning"><i class="fa fa-angle-left"></i>&nbsp;&nbsp;Elenco</asp:LinkButton>
                    </div>
                </div>
                <div style="margin: 10px;  padding-top:10px;">
                    <div class="form-body" style="margin-top: 20px!Important;">
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
                    </div>
                    <div class="">
                        <div class="panel-body">
                            <div class="tab-content">
                                <div id="div_overview" class="tab-pane active" runat="server">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="form-body" style="margin-left: 30px!Important; margin-right: 30px!Important;">
                                                <h6><asp:Label ID="ltl_ultima_modifica" runat="server"></asp:Label></h6>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <cc:rDropDown ID="ddl_proprietario_key" runat="server" AutoPostBack="false" Label="Intestatario"
                                                            Placeholder="Seleziona..." Form_Vertical="true" 
                                                            Required="true" Required_Help="Proprietario del registro obbligatorio!" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <cc:rTextBox ID="txt_rr_titolo" runat="server" MaxLength="128" AutoPostBack="false"
                                                            Label="Titolo del registro" Icon="" Form_Vertical="true" 
                                                            Required="true" Required_Help="Titolo del registro obbligatorio!" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <cc:rTextBox ID="txt_rr_note" runat="server" MaxLength="4000" AutoPostBack="false"
                                                            Label="Nota integrativa" Icon="" Form_Vertical="true" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <cc:rTextBox ID="txt_rr_protocollo_numero" runat="server" MaxLength="32" AutoPostBack="false"
                                                            Label="Protocollo Num" Icon="" Form_Vertical="true" 
                                                            Required="true" Required_Help="Numero protocollo obbligatorio!" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <cc:rTextData ID="txt_rr_protocollo_data" runat="server" MaxLength="10" AutoPostBack="false"
                                                            Label="Data protocollo" Icon="fa fa-calendar" Form_Vertical="true" 
                                                            Required="true" Required_Help="Data protocollo obbligatoria!" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <cc:rTextBox ID="txt_rr_autorita_vidimante" runat="server" MaxLength="128" AutoPostBack="false"
                                                            Label="Vidimato Da" Icon="" Form_Vertical="true" 
                                                            Required="true" Required_Help="Autorità vidimante obbligatoria!" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <cc:rTextNumero ID="txt_rr_progressivo_inizio" runat="server" MaxLength="16" AutoPostBack="true"
                                                            CifreDecimali="0" Label="Progressivo numerico semplice" Icon="" Form_Vertical="true" 
                                                            Required="true" Required_Help="Primo progressivo obbligatorio!" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <cc:rTextBox ID="txt_rr_progressivo_scritto" runat="server" MaxLength="32" AutoPostBack="false"
                                                            Label="Progressivo alternativo/integrato <br>(come riportato su registro)" Icon="" Form_Vertical="true" 
                                                            Required="true" Required_Help="Primo progressivo scritto obbligatorio!" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <cc:rDropDown ID="ddl_rr_sito_attivita_rifiuto_cod" runat="server" AutoPostBack="false"
                                                            Label="Tipologia attività" Placeholder="Seleziona..." Form_Vertical="true" 
                                                            Required="true" Required_Help="Tipologia attività obbligatorio!" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <cc:rTextBox ID="txt_rr_sito_attivita_rifiuto_note" runat="server" MaxLength="4000"
                                                            Label="Note attività" Visible="true" Form_Vertical="true" TextMode="MultiLine" Rows="3" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <cc:rTextBox ID="txt_rr_localizzazione" runat="server" MaxLength="1000" Label="Sede di conservazione registro C/S"
                                                            Visible="true" Form_Vertical="true" />
                                                    </div>
                                                </div>
                                                <div class="row" id="div_loc_fin" runat="server" visible="false">
                                                    <div class="col-md-12">
                                                        <cc:rTextBox ID="txt_rr_localizzazione_finale" runat="server" MaxLength="1000" Label="Sede finale di conservazione registro C/S"
                                                            Visible="true" Form_Vertical="true" />
                                                    </div>
                                                </div>
                                                <div class="form-actions right">
                                                    <asp:LinkButton ID="btn_registra" runat="server" CssClass="btn btn-primary">
                                                            <i class="fa fa-check"></i> Salva
                                                    </asp:LinkButton>
                                                    <asp:LinkButton ID="btn_cancella" runat="server" CssClass="btn btn-danger">
                                                            <i class="fa fa-trash-o"></i> Cancella
                                                    </asp:LinkButton>
                                                    <asp:LinkButton ID="btn_chiudi" runat="server" CssClass="btn btn-success">
                                                            <i class="fa fa-lock"></i> Chiudi Registro
                                                    </asp:LinkButton>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <! --/OVERVIEW -->
                                </div>
                            </div>
                            <!-- /tab-content -->
                        </div>
                        <! --/panel-body -->
                    </div>
                </div>
            </div>
            <!-- /content-panel dettali-->
        </div>
        <!-- /col-md-12 -->
    </div>
    <!-- /row -->
</asp:Content>

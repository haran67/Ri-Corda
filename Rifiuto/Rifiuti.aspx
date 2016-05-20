<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Start/GisRI.Master"
    CodeBehind="Rifiuti.aspx.vb" Inherits="GisRI_Web.fRifiuti" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Src="../Controls/rTextBox.ascx" TagName="rTextBox" TagPrefix="cc" %>
<%@ Register Src="../Controls/rTextData.ascx" TagName="rTextData" TagPrefix="cc" %>
<%@ Register Src="../Controls/rTextNumero.ascx" TagName="rTextNumero" TagPrefix="cc" %>
<%@ Register Src="../Controls/rDropDown.ascx" TagName="rDropDown" TagPrefix="cc" %>
<%@ Register Src="../Controls/rCheckBox.ascx" TagName="rCheckBox" TagPrefix="cc" %>
<%@ Register Src="../Controls/rRadioButton.ascx" TagName="rRadioButton" TagPrefix="cc" %>
<%@ Register Src="../Controls/rDDLOnDemand.ascx" TagName="rDDLOnDemand" TagPrefix="cc" %>
<%@ Register src="../Controls/cImageUpload.ascx" tagname="cImageUpload" tagprefix="img" %>
<%@ Register Src="../Controls/cFileUpload.ascx" TagName="cFileUpload" TagPrefix="cc" %>
<%@ Register Src="../Controls/cAllegati.ascx" TagName="cAllegati" TagPrefix="cc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../assets/js/fancybox/jquery.fancybox.css" rel="stylesheet" />
    <link href="../assets/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../assets/plugins/bootstrap-switch/js/bootstrap-switch.js"></script>
    <script type="text/javascript">
        function Init_bootstrapSwitch() {
            if (!$().bootstrapSwitch) {
                return;
            }
            $('.make-switch').bootstrapSwitch();
            $('[data-toggle="tooltip"]').tooltip();
        }

        function grid_search(sender, eventArgs, uniqueName) {
            eventArgs.cancelBubble = true;
            eventArgs.returnValue = false;
            if (eventArgs.stopPropagation) {
                eventArgs.stopPropagation();
                eventArgs.preventDefault();
            }
            var masterTableView = $find("<%= RGRifiuti.ClientID %>").get_masterTableView();

            masterTableView.filter(uniqueName, sender.value, Telerik.Web.UI.GridFilterFunction.Contains);
        }

        function Init_Dirty() {
            $("#<%=div_overview.ClientID%>").dirtyForms();
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body_up" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <div class="content-panel">
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
            <div class="content-panel" id="panel_elenco" runat="server" visible="true">
				<div class="clearfix">
                    <div class="gisri_panel_title">
                        <div class="gisri_title_left">
                            <asp:LinkButton ID="btn_filtri" runat="server" CssClass="btn btn-default"
                                ToolTip="Visualizza maschera dei filtri" Style="padding-top:6px; padding-left:10px;">
                                <i class="fa fa-filter"></i>
                            </asp:LinkButton>
                        </div> 
                        <div class="gisri_title_left">
                            <h3 style="padding-left: 10px; margin-top: 0px!Important;">ELENCO RIFIUTI PRODOTTI</h3>
                        </div>
                        <div class="gisri_button_right" id="div_nuovo" runat="server">
                            <asp:LinkButton ID="btn_nuovo" runat="server" ToolTip="Nuovo Rifiuto" CssClass="btn btn-primary"><i class="fa fa-plus"></i>&nbsp;&nbsp;Nuovo Rifiuto</asp:LinkButton>
                        </div>
                    </div>
				</div>
                <div class="row" id="div_filtri" runat="server" visible="false">
                    <div class="form-body" style="margin-left: 30px!Important; margin-right: 35px!Important; margin-bottom:10px;">
                        <div class="row">
                            <div class="col-xs-2 gisri_row_filter">
                                <div class="input-group" style="width:100%">
                                    <div>
                                        <asp:TextBox ID="txt_filter_cer" runat="server" CssClass="form-control gisri_form_filter"
                                            placeholder="CER" onChange="grid_search(this, event, 'rc_codici_cer_actual_cod');" ></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-3 gisri_row_filter">
                                <div class="input-group" style="width:100%">
                                    <div>
                                        <asp:TextBox ID="txt_filter_produttore" runat="server" CssClass="form-control gisri_form_filter"
                                            placeholder="Produttore" onChange="grid_search(this, event, 'rf_proprietario_desc');" ></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-4 gisri_row_filter">
                                <div class="input-group" style="width:100%">
                                    <div>
                                        <asp:TextBox ID="txt_filter_descrizione" runat="server" CssClass="form-control gisri_form_filter"
                                            placeholder="Descrizione" onChange="grid_search(this, event, 'rf_descrizione');" ></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-2 gisri_row_filter">
                                <div class="input-group" style="width:100%">
                                    <div>
                                        <asp:DropDownList ID="ddl_filter_stati" runat="server" CssClass="form-control gisri_form_filter" onChange="grid_search(this, event, 'rf_stato_attuale');">
                                            <asp:ListItem Text="Tutti gli stati" Value=""></asp:ListItem>
                                            <asp:ListItem Text="Prodotto" Value="prodotto"></asp:ListItem>
                                            <asp:ListItem Text="Carico Registrato" Value="carico registrato"></asp:ListItem>
                                            <asp:ListItem Text="In Deposito" Value="in deposito"></asp:ListItem>
                                            <asp:ListItem Text="A Destino Parziale" Value="a destino parziale"></asp:ListItem>
                                            <asp:ListItem Text="A Destino" Value="a destino"></asp:ListItem>
                                            <asp:ListItem Text="Ricevuta 4° Copia" Value="ricevuta 4° copia"></asp:ListItem>
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
                <telerik:RadGrid ID="RGRifiuti" AutoGenerateColumns="False" CssClass="overflow" style="width: 100% !important" runat="server"
                    ShowFooter="false" AllowPaging="True" AllowSorting="True" GridLines="None" PageSize="25"
                    Width="100%" AllowMultiRowSelection="true" Skin="MyCustomSkin" EnableEmbeddedSkins="false"
                    AllowFilteringByColumn="true" Culture="it-IT">
                    <GroupingSettings CaseSensitive="false" />
                    <PagerStyle Mode="NextPrevAndNumeric" CssClass=""></PagerStyle>
                    <HeaderStyle CssClass=""></HeaderStyle>
                    <ItemStyle HorizontalAlign="Left"></ItemStyle>
                    <AlternatingItemStyle CssClass="" HorizontalAlign="Left"></AlternatingItemStyle>
                    <FilterItemStyle HorizontalAlign="Left" />
                    <MasterTableView ShowFooter="false" Width="100%" DataKeyNames="rifiuto_key" AllowMultiColumnSorting="True">
                        <Columns>
                            <telerik:GridTemplateColumn SortExpression="rc_codici_cer_actual_cod" UniqueName="rc_codici_cer_actual_cod"
                                HeaderText="CER" DataField="rc_codici_cer_actual_cod" HeaderStyle-Width="5%" AllowFiltering="true"
                                ShowFilterIcon="false" FilterControlWidth="50px" AutoPostBackOnFilter="true"
                                CurrentFilterFunction="Contains" >
                                <ItemStyle Wrap="false" Font-Bold="true" />
                                <ItemTemplate>
                                    <asp:Label ID="lblrc_codici_cer_cod" runat="server"></asp:Label>
                                    <asp:Label ID="lblrc_codici_cer_con" runat="server" Visible="false"></asp:Label>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn SortExpression="rc_classi_pericolosita_cod" UniqueName="rc_classi_pericolosita_cod"
                                HeaderText="Classe" DataField="rc_classi_pericolosita_cod" HeaderStyle-Width="5%" AllowFiltering="false" >
                                <ItemStyle Wrap="false" />
                                <ItemTemplate>
                                    <asp:Label ID="lblrc_classi_pericolosita_cod" runat="server"></asp:Label>
                                    <asp:Label ID="lblrc_classi_pericolosita_con" runat="server" Visible="false"></asp:Label>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn SortExpression="rf_proprietario_desc" UniqueName="rf_proprietario_desc"
                                HeaderText="Produttore" DataField="rf_proprietario_desc" HeaderStyle-Width="15%" AllowFiltering="true"
                                ShowFilterIcon="false" FilterControlWidth="150px" AutoPostBackOnFilter="true"
                                CurrentFilterFunction="Contains">
                                <ItemTemplate>
                                    <asp:Label ID="lblrf_proprietario_desc" runat="server"></asp:Label>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn SortExpression="rf_data_produzione" UniqueName="rf_data_produzione"
                                HeaderText="Produzione" DataField="rf_data_produzione" HeaderStyle-Width="10%" AllowFiltering="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblrf_data_produzione" runat="server"></asp:Label>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn SortExpression="rf_descrizione" UniqueName="rf_descrizione"
                                HeaderText="Descrizione" DataField="rf_descrizione" HeaderStyle-Width="30%" AllowFiltering="true"
                                ShowFilterIcon="false" FilterControlWidth="150px" AutoPostBackOnFilter="true"
                                CurrentFilterFunction="Contains" 
                                ItemStyle-CssClass="additionalColumn" HeaderStyle-CssClass="additionalColumn" />
                            <telerik:GridTemplateColumn SortExpression="" UniqueName="rf_peso_volume_iniziale"
                                HeaderText="Peso e Volume" DataField="rf_peso_volume_iniziale" HeaderStyle-Width="10%" AllowFiltering="false"
                                ItemStyle-CssClass="additionalColumn" HeaderStyle-CssClass="additionalColumn" >
                                <ItemStyle Wrap="false" />
                                <ItemTemplate>
                                    <asp:Label ID="lblrf_peso_volume_iniziale" runat="server"></asp:Label>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn SortExpression="rf_deposito_desc" UniqueName="rf_deposito_desc"
                                HeaderText="Deposito" DataField="rf_deposito_desc" HeaderStyle-Width="10%" AllowFiltering="false" 
                                ItemStyle-CssClass="additionalColumn" HeaderStyle-CssClass="additionalColumn" Visible="false" />
                            <telerik:GridTemplateColumn UniqueName="rf_stato_allegati" SortExpression="" DataField="" 
                                InitializeTemplatesFirst="false" HeaderStyle-Width="1%" HeaderText="" AllowFiltering="false" >
                                <ItemTemplate>
                                    <asp:Label ID="ltl_stato_allegati" runat="server" Style="width: 100%; height: 100%;">
                                    </asp:Label>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="rf_stato_attuale" SortExpression="rf_stato_attuale" DataField="rf_stato_attuale" 
                                InitializeTemplatesFirst="false" HeaderStyle-Width="1%" HeaderText="Stato" AllowFiltering="true" >
                                <ItemTemplate>
                                    <asp:Label ID="ltl_stato" runat="server" Style="width: 100%; height: 100%;">
                                        <span class="label label-sito-acquisito label-full-width">ACQUISITO</span>
                                    </asp:Label>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="TemplateColumnGo" SortExpression="" InitializeTemplatesFirst="false"
                                HeaderStyle-Width="1%" AllowFiltering="false">
                                <ItemStyle HorizontalAlign="Right" />
                                <ItemTemplate>
                                    <asp:LinkButton ID="btn_scheda" runat="server" CssClass="btn btn-primary btn-xs button-link-w gisri_button_list"
                                        CommandName="SCHEDA">
                                                <i class=" fa fa-edit"></i>&nbsp;DETTAGLI</i>
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
                            <i class="fa fa-angle-right"></i>DETTAGLIO RIFIUTO: <asp:Label ID="ltl_rf_denominazione" runat="server" /></h3>
                    </div>
                    <div class="gisri_button_right" Id="div_ritorno" runat="server">
                        <asp:LinkButton ID="btn_return" runat="server" ToolTip="Torna all'elenco" CssClass="btn btn-warning"><i class="fa fa-angle-left"></i>&nbsp;&nbsp;Elenco</asp:LinkButton>
                    </div>
                </div>
                <div style="margin: 10px; padding-top:10px;">
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
                        <div class="panel-heading">
                            <ul class="nav nav-tabs nav-justified">
                                <li class="active" id="li_overview" runat="server"><a data-toggle="tab" href="#<%=div_overview.ClientID%>"
                                    class="tab-font">Dati Rifiuto</a> </li>
                                <li id="li_immagini" runat="server"><a data-toggle="tab" href="#<%=div_immagini.ClientID%>"
                                    class="tab-font">Immagini</a> </li>
                                <li id="li_allegati" runat="server"><a data-toggle="tab" href="#<%=div_allegati.ClientID%>"
                                    class="tab-font">Allegati</a> </li>
                            </ul>
                        </div>
                        <! --/panel-heading -->
                        <div class="panel-body">
                            <div class="tab-content">
                                <div id="div_overview" class="tab-pane active" runat="server">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="">
                                                <div class="form-body">
                                                    <h6><asp:Label ID="ltl_ultima_modifica" runat="server"></asp:Label></h6>
                                                    <div class="row" id="div_societa_gestione" runat="server">
                                                        <div class="col-md-6">
                                                            <cc:rDropDown ID="ddl_rf_produttore_key" runat="server" AutoPostBack="true"
                                                                Label="Prodotto Da" Placeholder="Seleziona..." Form_Vertical="true" 
                                                                Required="true" Required_Help="Produttore del rifiuto obbligatorio!" />
                                                        </div>
                                                        <div class="col-md-6">
                                                            <cc:rTextData ID="txt_rf_data_produzione" runat="server" MaxLength="10" AutoPostBack="false"
                                                                Label="Data produzione" Icon="fa fa-calendar" Form_Vertical="true" 
                                                                Required="true" Required_Help="Data produzione obbligatoria!" />
                                                        </div>
                                                    </div>
                                                    <div class="row" id="div_presunto_01" runat="server">
                                                        <div class="col-md-6">
                                                            <cc:rDropDown ID="ddl_rc_codici_cer_key" runat="server" AutoPostBack="true" Label="Codice CER Presunto"
                                                                Placeholder="Seleziona..." Form_Vertical="true" Select2="true" 
                                                                Required="true" Required_Help="Codice CER obbligatorio!" />
                                                        </div>
                                                        <div class="col-md-6">
                                                            <cc:rDropDown ID="ddl_rf_rifiuto_stato_fisico_cod" runat="server" AutoPostBack="false" Label="Stato Fisico iniziale"
                                                                Placeholder="Seleziona..." Form_Vertical="true" 
                                                                Required="true" Required_Help="Stato fisico del rifiuto obbligatorio!" />
                                                        </div>
                                                    </div>
                                                    <div class="row" id="div_presunto_02" runat="server">
                                                        <div class="col-md-12" id="div_classi_pericolosita" runat="server">
                                                            <div class="form-body">
                                                                <label class="control-label" style="white-space:nowrap; font-weight:bold;">
                                                                    Pericolosità presunta</label>
                                                                <asp:Repeater ID="rpt_tab_classi_pericolosita" runat="server">
                                                                    <HeaderTemplate>
                                                                        <div class="form-inline">
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <div class="form-group" style="white-space:normal; padding:5px; vertical-align:top;">
                                                                            <label class="control-label red-tooltip" style="white-space:;" id="label_control" runat="server"
                                                                                data-toggle="tooltip" data-placement="top" title="Change dashboard date range">
                                                                                <i class="fa fa-info-circle gisri_fa_color_info">
                                                                                &nbsp;</i><asp:Literal ID="ltl_rc_classi_pericolosita_cod" runat="server"></asp:Literal>
                                                                                </label>
                                                                            <div style="max-width:150px;">
                                                                                <div class="checkbox-list" style="padding-top:0px;">
                                                                                    <asp:CheckBox ID="chk_rc_classi_pericolosita_key" runat="server" />
                                                                                </div>
                                                                                <span style="font-size:10px;">
                                                                                    <asp:Literal ID="ltl_rc_classi_pericolosita_desc" runat="server" Visible="false"></asp:Literal>
                                                                                </span> 
                                                                            </div>
                                                                        </div>
                                                                        <asp:Label ID="rc_classi_pericolosita_key" runat="server" Visible="false"></asp:Label>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        </div>
                                                                    </FooterTemplate>
                                                                </asp:Repeater>
                                                                <div class="form-group has-error">
                                                                <span class="help-block" id="span_per_pre_help" runat="server">
                                                                    <asp:Literal ID="ltl_per_pre_help" runat="server"></asp:Literal></span>
                                                                </div>
                                                            </div>
                                                        </div> 
                                                    </div>
                                                    <div class="row" id="div_confermato_01" runat="server">
                                                        <div class="col-md-6">
                                                            <cc:rDropDown ID="ddl_rc_codici_cer_con" runat="server" AutoPostBack="true" Label="Codice CER"
                                                                Placeholder="Seleziona..." Form_Vertical="true" Select2="true" Required_Label="true" />
                                                        </div>
                                                        <div class="col-md-6">
                                                            <cc:rDropDown ID="ddl_rf_rifiuto_stato_fisico_con" runat="server" AutoPostBack="false" Label="Stato Fisico"
                                                                Placeholder="Seleziona..." Form_Vertical="true" Required_Label="true" />
                                                        </div>
                                                    </div>
                                                    <div class="row" id="div_confermato_02" runat="server">
                                                        <div class="col-md-12" id="div_classi_pericolosita_con" runat="server">
                                                            <div class="form-body">
                                                                <label class="control-label" style="white-space:nowrap; font-weight:bold;">
                                                                    Classi di pericolosità</label>
                                                                <asp:Repeater ID="rpt_con_classi_pericolosita" runat="server">
                                                                    <HeaderTemplate>
                                                                        <div class="form-inline">
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <div class="form-group" style="white-space:normal; padding:5px; vertical-align:top;">
                                                                            <label class="control-label red-tooltip" style="white-space:;" id="label_control" runat="server"
                                                                             data-toggle="tooltip" data-placement="top" title="Change dashboard date range">
                                                                                <i class="fa fa-info-circle gisri_fa_color_info"></i>
                                                                                &nbsp;<asp:Literal ID="ltl_rc_classi_pericolosita_cod" runat="server"></asp:Literal>
                                                                                </label>
                                                                            <div style="max-width:150px;">
                                                                                <div class="checkbox-list" style="padding-top:0px;">
                                                                                    <asp:CheckBox ID="chk_rc_classi_pericolosita_key" runat="server" />
                                                                                </div>
                                                                                <span style="font-size:10px;">
                                                                                    <asp:Literal ID="ltl_rc_classi_pericolosita_desc" runat="server" Visible="false"></asp:Literal>
                                                                                </span> 
                                                                            </div>
                                                                        </div>
                                                                        <asp:Label ID="rc_classi_pericolosita_key" runat="server" Visible="false"></asp:Label>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        </div>
                                                                    </FooterTemplate>
                                                                </asp:Repeater>
                                                                <span class="help-block" id="span_per_con_help" runat="server">
                                                                    <asp:Literal ID="ltl_per_con_help" runat="server"></asp:Literal></span>
                                                            </div>
                                                        </div> 
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <cc:rTextBox ID="txt_rf_descrizione" runat="server" TextMode="MultiLine" Rows="2" MaxLength="4000" Label="Descrizione"
                                                                Visible="true" Form_Vertical="true" />
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <cc:rCheckBox ID="chk_rf_caratterizzazione" runat="server" Values="S|" Classes="make-switch|SI|NO||"
                                                                Label="Caratterizzazione" AutoPostBack="false" Checked="false" Form_Vertical="true" />
                                                        </div>
                                                        <div class="col-md-6">
                                                            <cc:rDropDown ID="ddl_rf_personale_indicante_key" runat="server" AutoPostBack="false" Label="Personale Indicante"
                                                                Placeholder="Seleziona..." Form_Vertical="true" 
                                                                Required="true" Required_Help="Personale indicante obbligatorio!" />
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-4">
                                                            <cc:rTextNumero ID="txt_rf_peso_iniziale" runat="server" MaxLength="16" AutoPostBack="false"
                                                                Label="Peso Iniziale" CifreDecimali="1" Icon="" Form_Vertical="true" 
                                                                Required="true" Required_Help="Peso del rifiuto obbligatorio!" />
                                                        </div>
                                                        <div class="col-md-2">
                                                            <cc:rDropDown ID="ddl_rf_peso_misura_cod" runat="server" AutoPostBack="false" Label="UM"
                                                                Placeholder="Seleziona..." Form_Vertical="true" 
                                                                Required="true" Required_Help="Unità di misura obbligatoria!" />
                                                        </div>
                                                        <div class="col-md-4">
                                                            <cc:rTextNumero ID="txt_rf_volume_iniziale" runat="server" MaxLength="16" AutoPostBack="false"
                                                                Label="Vol. Iniziale" CifreDecimali="1" Icon="" Form_Vertical="true" 
                                                                Required="true" Required_Help="Volume del rifiuto obbligatorio!" />
                                                        </div>
                                                        <div class="col-md-2">
                                                            <cc:rDropDown ID="ddl_rf_volume_misura_cod" runat="server" AutoPostBack="false" Label="UM"
                                                                Placeholder="Seleziona..." Form_Vertical="true" 
                                                                Required="true" Required_Help="Unità di misura del volume obbligatoria!" />
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <cc:rDropDown ID="ddl_rf_rifiuto_deposito_key" runat="server" AutoPostBack="false" Label="Deposito"
                                                                Placeholder="Seleziona..." Form_Vertical="true" 
                                                                Required="true" Required_Help="Tipologia di deposito obbligatoria!" />
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <cc:rTextBox ID="txt_rf_rifiuto_deposito_note" runat="server" TextMode="MultiLine" Rows="2" MaxLength="4000" Label="Note sul deposito"
                                                                Visible="true" Form_Vertical="true" />
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <cc:rTextBox ID="txt_rf_generato_note" runat="server" TextMode="MultiLine" Rows="2" MaxLength="4000" Label="Note sul rifiuto"
                                                                Visible="true" Form_Vertical="true" />
                                                        </div>
                                                    </div>
                                                    <div class="form-actions right">
                                                        <asp:LinkButton ID="btn_registra" runat="server" CssClass="btn btn-primary">
                                                            <i class="fa fa-check"></i> Salva
                                                        </asp:LinkButton>
                                                    <asp:LinkButton ID="btn_salva_nuovo" runat="server" CssClass="btn btn-primary">
                                                            <i class="fa fa-plus"></i>&nbsp;&nbsp;Salva e Nuovo
                                                    </asp:LinkButton>
                                                        <asp:LinkButton ID="btn_cancella" runat="server" CssClass="btn btn-danger">
                                                            <i class="fa fa-trash-o"></i> Cancella
                                                        </asp:LinkButton>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <! --/OVERVIEW -->
                                </div>
                                <div id="div_immagini" class="tab-pane" runat="server">
                                    <div class="row">
                                        <div class="col-lg-12">
				                            <div class="row mt">
                                                <asp:Repeater ID="rpt_immagini" runat="server">
                                                    <ItemTemplate>
					                                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 desc" style="padding-bottom:20px;">
						                                    <div class="project-wrapper">
		                                                        <div class="project">
		                                                            <div class="photo-wrapper">
		                                                                <div class="photo">
                                                                            <asp:HyperLink ID="lnk_immagine" runat="server" CssClass="fancybox" NavigateUrl="../assets/img/portfolio/rifiuto00.jpg">
                                                                                <asp:Image ID="img_immagine" runat="server" CssClass="img-responsive" />
                                                                            </asp:HyperLink>
		                            	                                    
		                                                                </div>
		                                                                <div class="overlay"></div>
		                                                            </div>
		                                                        </div>
		                                                    </div>
                                                            <h4><asp:Literal ID ="ltl_titolo" runat="server"></asp:Literal></h4>
                                                            <asp:LinkButton ID="btn_cancella" runat="server" CssClass="btn btn-danger btn-xs button-link-w"
                                                                CommandName="CANCELLA">
                                                                    <i class=" fa fa-trash-o"></i>&nbsp;Cancella</i>
                                                            </asp:LinkButton>
					                                    </div><!-- col-lg-4 -->
                                                    </ItemTemplate>
                                                </asp:Repeater>
				                            </div><!-- /row -->
                                        </div>
                                    </div>
                                    <div style="height:10px;"></div>
                                    <div class="form-actions right">
                                        <asp:LinkButton ID="btn_allega" runat="server" CssClass="btn btn-primary">
                                    <i class="fa fa-plus"></i> Carica Immagini
                                        </asp:LinkButton>
                                    </div>
                                    <! --/PERSONALE -->
                                </div>
                                <div id="div_allegati" class="tab-pane" runat="server">
                                    <div class="form-body">
                                        <div class="form-horizontal">
                                            <div class="form-body" style="margin-left: 0px!Important; margin-right: 0px!Important;">
                                                <cc:cAllegati ID="cAllegati1" runat="server" />
                                            </div>
                                            <div class="form-actions right">
                                                <asp:LinkButton ID="btn_allega_doc" runat="server" CssClass="btn btn-primary">
                                                <i class="fa fa-plus"></i> Carica Files
                                                </asp:LinkButton>
                                            </div>
                                        </div>
                                    </div>
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

	<script type="text/javascript" src="../assets/js/fancybox/jquery.fancybox.js"></script>    

    <script type="text/javascript">
        $(function () {
            //    fancybox
            jQuery(".fancybox").fancybox({
                helpers: {
                    title: {
                        type: 'inside'
                    }
                },
                afterLoad: function () {
                    var title = this.title ? this.title : " ";
                    var alt = $(this.element).find('img').attr('alt') ? $(this.element).find('img').attr('alt') : " ";
                    this.title = '<h3>' + title + '</h3>' + alt + '<br />';
                }
            });
        });


        $(document).ready(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });


    </script>

</asp:Content>
<asp:Content ID="ttt" runat="server" ContentPlaceHolderID="body">
    <img:cImageUpload ID="cImageUpload" runat="server" />
    <cc:cFileUpload ID="cFileUpload" runat="server" />
</asp:Content>

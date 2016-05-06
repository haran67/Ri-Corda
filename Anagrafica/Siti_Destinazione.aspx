<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Start/GisRI.Master"
    CodeBehind="Siti_Destinazione.aspx.vb" Inherits="GisRI_Web.Siti_Destinazione" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Src="../Controls/rTextBox.ascx" TagName="rTextBox" TagPrefix="cc" %>
<%@ Register Src="../Controls/rTextData.ascx" TagName="rTextData" TagPrefix="cc" %>
<%@ Register Src="../Controls/rTextNumero.ascx" TagName="rTextNumero" TagPrefix="cc" %>
<%@ Register Src="../Controls/rDropDown.ascx" TagName="rDropDown" TagPrefix="cc" %>
<%@ Register Src="../Controls/rCheckBox.ascx" TagName="rCheckBox" TagPrefix="cc" %>
<%@ Register Src="../Controls/rRadioButton.ascx" TagName="rRadioButton" TagPrefix="cc" %>
<%@ Register Src="../Controls/cFileUpload.ascx" TagName="cFileUpload" TagPrefix="cc" %>
<%@ Register Src="../Controls/cAllegati.ascx" TagName="cAllegati" TagPrefix="cc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../assets/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet"
        type="text/css" />
    <script type="text/javascript" src="../assets/plugins/bootstrap-switch/js/bootstrap-switch.js"></script>
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
            var masterTableView = $find("<%= RGSiti.ClientID %>").get_masterTableView();

            masterTableView.filter(uniqueName, sender.value, Telerik.Web.UI.GridFilterFunction.Contains);
        }

        function Init_Dirty() {
            $("#<%=div_overview.ClientID%>").dirtyForms();
            $("#<%=div_autorizzazioni.ClientID%>").dirtyForms();
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body_up" runat="server">
    <div class="row mt">
        <div class="col-md-12">
            <div class="content-panel" id="panel_elenco" runat="server" visible="true" style="padding-left:10px!Important;padding-top:0px!Important; margin-bottom:10px;">
                <div class="row" style="height:50px!Important;">
                    <div class="gisri_panel_title gisri_title_margin">
                        <div class="gisri_title_left">
                            <asp:LinkButton ID="btn_filtri" runat="server" CssClass="btn btn-default"
                                ToolTip="Visualizza maschera dei filtri" Style="padding-top:6px; padding-left:10px;">
                                <i class="fa fa-filter"></i>
                            </asp:LinkButton>
                        </div> 
                        <div class="gisri_title_left">
                            <h3 style="padding-left: 10px; margin-top: 0px!Important;">
                                SITI DESTINAZIONE RIFIUTI</h3>
                        </div>
                        <div class="gisri_button_right" id="div_nuovo" runat="server" >
                            <asp:LinkButton ID="btn_nuovo" runat="server" ToolTip="Nuovo sito" CssClass="btn btn-primary"><i class="fa fa-plus"></i>&nbsp;&nbsp;Nuovo Sito</asp:LinkButton>
                        </div>
                    </div>
                </div>
                <div class="row" id="div_filtri" runat="server" visible="false">
                    <div class="form-body" style="margin-left: 30px!Important; margin-right: 35px!Important; margin-bottom:10px;">
                        <div class="row">
                            <div class="col-xs-2 gisri_row_filter">
                                <div class="input-group" style="width:100%">
                                    <div>
                                        <asp:TextBox ID="txt_filter_codice" runat="server" CssClass="form-control gisri_form_filter"
                                            placeholder="Codice" onChange="grid_search(this, event, 'sd_codice');" ></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-3 gisri_row_filter">
                                <div class="input-group" style="width:100%">
                                    <div>
                                        <asp:TextBox ID="txt_filter_denominazione" runat="server" CssClass="form-control gisri_form_filter"
                                            placeholder="Denominazione" onChange="grid_search(this, event, 'sd_denominazione');" ></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-3 gisri_row_filter">
                                <div class="input-group" style="width:100%">
                                    <div>
                                        <asp:TextBox ID="txt_filter_citta" runat="server" CssClass="form-control gisri_form_filter"
                                            placeholder="Città" onChange="grid_search(this, event, 'sd_comune_desc');" ></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-3 gisri_row_filter">
                                <div class="input-group" style="width:100%">
                                    <div>
                                        <asp:TextBox ID="txt_filter_gestore" runat="server" CssClass="form-control gisri_form_filter"
                                            placeholder="Gestore" onChange="grid_search(this, event, 'sd_ditta_ragione_sociale');" ></asp:TextBox>
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
                <div class="overflow">
                    <telerik:RadGrid ID="RGSiti" AutoGenerateColumns="False" CssClass="" style="width: 100% !important;" runat="server"
                        ShowFooter="false" AllowPaging="True" AllowSorting="True" GridLines="None" PageSize="25"
                        Width="100%" AllowMultiRowSelection="true" Skin="MyCustomSkin" EnableEmbeddedSkins="false"
                        AllowFilteringByColumn="true" Culture="it-IT">
                        <GroupingSettings CaseSensitive="false" />
                        <PagerStyle Mode="NextPrevAndNumeric" CssClass=""></PagerStyle>
                        <HeaderStyle CssClass=""></HeaderStyle>
                        <ItemStyle HorizontalAlign="Left"></ItemStyle>
                        <AlternatingItemStyle CssClass="" HorizontalAlign="Left"></AlternatingItemStyle>
                        <FilterItemStyle HorizontalAlign="Left" />
                        <MasterTableView ShowFooter="false" Width="100%" DataKeyNames="sito_destinazione_key" AllowMultiColumnSorting="True">
                            <Columns>
                                <telerik:GridBoundColumn SortExpression="sd_codice" UniqueName="sd_codice"
                                    HeaderText="Codice" DataField="sd_codice" HeaderStyle-Width="5%" AllowFiltering="true"
                                    ShowFilterIcon="false" FilterControlWidth="50px" AutoPostBackOnFilter="true"
                                    CurrentFilterFunction="Contains" />
                                <telerik:GridBoundColumn SortExpression="sd_denominazione" UniqueName="sd_denominazione"
                                    HeaderText="Denominazione" DataField="sd_denominazione" HeaderStyle-Width="25%" AllowFiltering="true"
                                    ShowFilterIcon="false" FilterControlWidth="150px" AutoPostBackOnFilter="true"
                                    CurrentFilterFunction="Contains" />
                                <telerik:GridBoundColumn SortExpression="sd_ditta_ragione_sociale" UniqueName="sd_ditta_ragione_sociale"
                                    HeaderText="Gestore" DataField="sd_ditta_ragione_sociale" HeaderStyle-Width="25%"
                                    AllowFiltering="true" ShowFilterIcon="false" FilterControlWidth="100px" AutoPostBackOnFilter="true"
                                    CurrentFilterFunction="Contains">
                                </telerik:GridBoundColumn>
                                <telerik:GridTemplateColumn UniqueName="sd_comune_desc" SortExpression="sd_comune_desc"
                                    InitializeTemplatesFirst="false" HeaderStyle-Width="35%" HeaderText="Indirizzo"
                                    AllowFiltering="true" ShowFilterIcon="false" DataField="sd_comune_desc" FilterControlWidth="150px"
                                    AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                                    ItemStyle-CssClass="additionalColumn" HeaderStyle-CssClass="additionalColumn" >
                                    <ItemTemplate>
                                        <asp:Label ID="lblsd_indirizzo" runat="server"></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn UniqueName="TemplateColumnGo" SortExpression="" InitializeTemplatesFirst="false"
                                    HeaderStyle-Width="1%" AllowFiltering="false">
                                    <ItemStyle HorizontalAlign="Right" />
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btn_scheda" runat="server" CssClass="btn btn-primary btn-xs button-link-w"
                                            CommandName="SCHEDA">
                                            <i class=" fa fa-edit"></i>&nbsp;SCHEDA</i>
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
            </div>
            <!-- /content-panel -->
            <div class="content-panel" id="panel_dati" runat="server" style="display: none;">
                <div class="gisri_panel_title clearix">
                    <div class="gisri_title_left">
                        <h3 style="padding-left: 10px; margin-top: 0px!Important;">
                            <i class="fa fa-angle-right"></i>DETTAGLIO SITO DESTINAZIONE: <asp:Literal ID="ltl_sd_denominazione" runat="server" /></h3>
                    </div>
                    <div class="gisri_button_right" idid="div_ritorno" runat="server">
                        <asp:LinkButton ID="btn_return" runat="server" ToolTip="Torna all'elenco" CssClass="btn btn-warning"><i class="fa fa-angle-left"></i>&nbsp;&nbsp;Elenco</asp:LinkButton>
                    </div>
                </div>
                <div>
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
                    <div class="">
                        <div class="panel-heading">
                            <ul class="nav nav-tabs nav-justified">
                                <li class="active" id="li_overview" runat="server"><a data-toggle="tab" href="#<%=div_overview.ClientID%>"
                                    class="tab-font">Dati Anagrafici</a> </li>
                                <li id="li_mappa" runat="server">
                                    <a data-toggle="tab" href="#<%=div_mappa.ClientID%>" class="tab-font"
                                       onclick="$('#iMappa').attr('src', '../Mappe/MappaRicerca.aspx');">Mappa</a> </li>
                                <li id="li_autorizzazioni" runat="server"><a data-toggle="tab" href="#<%=div_autorizzazioni.ClientID%>" class="tab-font">
                                    Autorizzazioni</a> </li>
                                <li id="li_allegati" runat="server"><a data-toggle="tab" href="#<%=div_allegati.ClientID%>"
                                    class="tab-font">Allegati</a> </li>
                            </ul>
                        </div>
                        <! --/panel-heading -->
                        <div class="panel-body">
                            <div class="tab-content">
                                <div id="div_overview" class="tab-pane" runat="server">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="form-body" style="margin-left: 30px!Important; margin-right: 30px!Important;">
                                                <h6><asp:Label ID="ltl_ultima_modifica" runat="server"></asp:Label></h6>
                                                <div class="row" id="div_ditta" runat="server">
                                                    <div class="col-md-12">
                                                        <cc:rDropDown ID="ddl_sd_ditta_key" runat="server" AutoPostBack="false" Label="Gestore"
                                                            Placeholder="Seleziona..." Form_Vertical="true" Required="true" Required_Help="Società proprietaria obbligatoria!" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <cc:rTextBox ID="txt_sd_denominazione" runat="server" MaxLength="256" AutoPostBack="false"
                                                            Label="Denominazione" Icon="" Form_Vertical="true" Required="true" Required_Help="Denominazione sito obbligatoria!" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <cc:rTextBox ID="txt_sd_codice" runat="server" MaxLength="32" AutoPostBack="false"
                                                            Label="Codice Sito" Icon="" Form_Vertical="true" />
                                                    </div>
                                                    <div class="col-md-6">
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <cc:rCheckBox ID="chk_sd_stato_estero" runat="server" Values="S|" Classes="make-switch|SI|NO||"
                                                            Label="Indirizzo Estero" AutoPostBack="true" Checked="false" Form_Vertical="true" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <cc:rDropDown ID="ddl_sd_provincia_cod" runat="server" AutoPostBack="true" Label="Provincia"
                                                            Placeholder="Seleziona..." Form_Vertical="true" />
                                                        <cc:rTextBox ID="txt_sd_provincia_desc" runat="server" MaxLength="40" Label="Stato Estero"
                                                            Visible="false" Form_Vertical="true" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <cc:rDropDown ID="ddl_sd_comune_cod" runat="server" AutoPostBack="true" Label="Citt&agrave;"
                                                            Placeholder="Seleziona..." Form_Vertical="true" />
                                                        <cc:rTextBox ID="txt_sd_comune_desc" runat="server" MaxLength="40" Label="Comune Estero"
                                                            Visible="false" Form_Vertical="true" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <cc:rTextBox ID="txt_sd_cap" runat="server" MaxLength="5" Label="Cap" Form_Vertical="true" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <cc:rTextBox ID="txt_sd_localita" runat="server" MaxLength="40" AutoPostBack="false"
                                                            Label="Localita" Icon="" Form_Vertical="true" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <cc:rTextBox ID="txt_sd_indirizzo" runat="server" MaxLength="60" AutoPostBack="false"
                                                            Label="Indirizzo" Icon="" Form_Vertical="true" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <cc:rTextBox ID="txt_sd_telefono" runat="server" MaxLength="16" AutoPostBack="false"
                                                            Label="Telefono" Icon="" Form_Vertical="true" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <cc:rTextBox ID="txt_sd_email" runat="server" MaxLength="60" AutoPostBack="false"
                                                            Label="Mail Riferimento" Icon="fa fa-envelope" Form_Vertical="true" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <cc:rTextNumero ID="txt_sd_baricentro_n" runat="server" MaxLength="40" AutoPostBack="false"
                                                            Label="Coordinata N." Icon="" CifreDecimali="10" Form_Vertical="true" Read_Only="true" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <cc:rTextNumero ID="txt_sd_baricentro_e" runat="server" MaxLength="60" AutoPostBack="false"
                                                            Label="Coordinata E." Icon="" CifreDecimali="10" Form_Vertical="true" Read_Only="true" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="form-actions right">
                                                        <asp:LinkButton ID="btn_registra" runat="server" CssClass="btn btn-primary">
                                                            <i class="fa fa-check"></i> Salva
                                                        </asp:LinkButton>
                                                        <asp:LinkButton ID="btn_salva_e_nuovo" runat="server" CssClass="btn btn-primary">
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
                                <! --/tab-pane -->
                                <div id="div_mappa" class="tab-pane" runat="server">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div style="margin-left: 30px!Important; margin-right: 30px!Important;">
                                                <div class="col-lg-12">
                                                    <iframe id="iMappa" frameborder="0" width="100%" height="730" src=""></iframe>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-9">
                                            <div style="margin-left: 30px!Important;">
                                                <asp:TextBox ID="txt_google_address" runat="server" MaxLength="256" AutoPostBack="false" 
                                                CssClass="form-control" placeholder="Inserisci l'indirizzo per la ricerca su Google Maps"/>
                                            </div>
                                        </div>
                                        <div class="col-lg-3">
                                            <div style="margin-right: 30px!Important; text-align:right;">
                                                <asp:LinkButton ID="btn_google_address" runat="server" ToolTip="" CssClass="btn btn-default"><i class="fa fa-map-marker"></i>&nbsp;&nbsp;Ricalcola coordinate</asp:LinkButton>
                                            </div> 
                                        </div>
                                    </div>
                                </div>
                                <div id="div_autorizzazioni" class="tab-pane" runat="server">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="">
                                                <div class="form-body" style="margin-left: 30px!Important; margin-right: 30px!Important;">
                                                    <table class="table table-striped table-advance table-hover">
                                                        <thead>
                                                            <tr>
                                                                <th style="width: 30%; display:none;">
                                                                    Autorizzazione
                                                                </th>
                                                                <th style="width: 10%; white-space:nowrap;">
                                                                    Numero
                                                                </th>
                                                                <th style="width: 10%; white-space:nowrap;">
                                                                    Data Emissione
                                                                </th>
                                                                <th style="width: 10%; white-space:nowrap;">
                                                                    Data Scadenza
                                                                </th>
                                                                <th style="width: 40%;">
                                                                    Note
                                                                </th>
                                                                <th style="width: 1%;">
                                                                </th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <asp:Repeater ID="rpt_autorizzazioni" runat="server">
                                                                <ItemTemplate>
                                                                    <tr>
                                                                        <td style="display:none;">
                                                                            <asp:Label ID="lbl_sd_tipologia_autorizzazioni_desc" runat="server"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="lbl_sd_emissione_numero" runat="server"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="lbl_sd_emissione_data" runat="server"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="lbl_sd_a_data" runat="server"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="lbl_sd_note" runat="server"></asp:Label>
                                                                        </td>
                                                                        <td style="white-space: nowrap;">
                                                                            <asp:LinkButton ID="btn_scheda" runat="server" CssClass="btn btn-primary btn-xs button-link-w"
                                                                                CommandName="SCHEDA">
                                                                                <i class=" fa fa-edit"></i>&nbsp;Modifica</i>
                                                                            </asp:LinkButton>
                                                                            <asp:LinkButton ID="btn_cancella" runat="server" CssClass="btn btn-danger btn-xs button-link-w"
                                                                                CommandName="CANCELLA">
                                                                                <i class=" fa fa-trash-o"></i>&nbsp;Cancella</i>
                                                                            </asp:LinkButton>
                                                                        </td>
                                                                    </tr>
                                                                </ItemTemplate>
                                                            </asp:Repeater>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <div class="">
                                                    <div class="form-body" style="margin-left: 30px!Important; margin-right: 30px!Important;">
                                                        <div id="div_modifica_autorizzazione" runat="server">
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <hr />
                                                                </div> 
                                                            </div> 
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <cc:rTextBox ID="txt_sd_emissione_numero" runat="server" MaxLength="32" AutoPostBack="false"
                                                                        Label="Numero" Icon="" Form_Vertical="true" Required="true" Required_Help="Numero autorizzazione obbligatorio!" />
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <cc:rTextData ID="txt_sd_emissione_data" runat="server" MaxLength="10" AutoPostBack="false"
                                                                        Label="Data Emissione" Icon="fa fa-calendar" Form_Vertical="true" />
                                                                </div>
                                                            </div> 
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <cc:rTextData ID="txt_sd_a_data" runat="server" MaxLength="10" AutoPostBack="false"
                                                                        Label="Data Scadenza" Icon="fa fa-calendar" Form_Vertical="true" />
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <cc:rDropDown ID="ddl_sd_tipologia_autorizzazioni_cod" runat="server" AutoPostBack="false" Label="Tipo autorizzazione"
                                                                        Placeholder="Seleziona..." Form_Vertical="true" Visible="false" />
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <cc:rTextBox ID="txt_sd_note" runat="server" MaxLength="4000" AutoPostBack="false"
                                                                        Label="Note" textmode="MultiLine" Rows="2" Form_Vertical="true" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div> 
                                                <div class="form-actions right">
                                                    <asp:LinkButton ID="btn_registra_autorizzazione" runat="server" CssClass="btn btn-primary">
                                                            <i class="fa fa-check"></i> Salva
                                                    </asp:LinkButton>
                                                    <asp:LinkButton ID="btn_nuova_autorizzazione" runat="server" CssClass="btn btn-primary">
                                                            <i class="fa fa-plus"></i> Aggiungi
                                                    </asp:LinkButton>
                                                </div>
                                                <asp:Label ID="lbl_sito_destinazione_autorizzazioni_key" runat="server" Visible="false"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="div_allegati" class="tab-pane" runat="server">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="form-horizontal">
                                                <div class="form-body" style="margin-left: 30px!Important; margin-right: 30px!Important;">
                                                    <cc:cAllegati ID="cAllegati1" runat="server" />
                                                </div>
                                                <div class="form-actions right">
                                                    <asp:LinkButton ID="btn_allega" runat="server" CssClass="btn btn-primary">
                                                <i class="fa fa-plus"></i> Carica Files
                                                    </asp:LinkButton>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div> 
                            <!-- /tab-content -->
                        </div> 
                    </div>
                    <! --/panel-body -->
                </div>
            </div>
        </div>
    </div>
    <asp:LinkButton ID="btn_position" runat="server" style="display:none;" />
    <!-- /row -->
    <script type="text/javascript">
        function setPosition(lat, lon) {
            $('#<%=txt_sd_baricentro_n.txt_Client_Id%>').val(lat);
            $('#<%=txt_sd_baricentro_e.txt_Client_Id%>').val(lon);
            PageMethods.SalvaCoordinateSitoDestinazione(lat, lon, SPMSuccess, PMFailure);
        }

        function SPMSuccess() {
            javascript: __doPostBack('<%=btn_position.UniqueID%>', '');
        }

//        $(document).ready(function() {
//            $('form').dirtyForms();
//        });

    </script>
</asp:Content>
<asp:Content ID="ttt" runat="server" ContentPlaceHolderID="body">
    <cc:cFileUpload ID="cFileUpload" runat="server" />
</asp:Content>

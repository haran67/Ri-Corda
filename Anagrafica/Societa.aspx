<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Start/GisRI.Master"
    CodeBehind="Societa.aspx.vb" Inherits="GisRI_Web.fSocieta" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Src="../Controls/rTextBox.ascx" TagName="rTextBox" TagPrefix="cc" %>
<%@ Register Src="../Controls/rTextData.ascx" TagName="rTextData" TagPrefix="cc" %>
<%@ Register Src="../Controls/rDropDown.ascx" TagName="rDropDown" TagPrefix="cc" %>
<%@ Register Src="../Controls/rCheckBox.ascx" TagName="rCheckBox" TagPrefix="cc" %>
<%@ Register Src="../Controls/rRadioButton.ascx" TagName="rRadioButton" TagPrefix="cc" %>
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
            var masterTableView = $find("<%= RGSocieta.ClientID %>").get_masterTableView();
            masterTableView.filter(uniqueName, sender.value, Telerik.Web.UI.GridFilterFunction.Contains);
        }

        function grid_personale_search(sender, eventArgs, uniqueName) {
            eventArgs.cancelBubble = true;
            eventArgs.returnValue = false;
            if (eventArgs.stopPropagation) {
                eventArgs.stopPropagation();
                eventArgs.preventDefault();
            }
            var masterTableView = $find("<%= RGPersonale.ClientID %>").get_masterTableView();
            if (uniqueName != "dp_ruolo_aziendale_desc") {
                masterTableView.filter(uniqueName, sender.value, Telerik.Web.UI.GridFilterFunction.Contains);
            }
            else {
                masterTableView.filter(uniqueName, sender.options[sender.selectedIndex].text, "EqualTo");
            }

        }

        function Init_Dirty() {
            $("#<%=div_overview.ClientID%>").dirtyForms();
        }

    </script>
    <style type="text/css">

        .dirtyField {color:red;}

    </style>
    <style>@media (max-width: 768px) { .btn {width: 100% !important;}}</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body_up" runat="server">
    <div class="row mt">
        <div class="col-md-12">
            <div class="content-panel" id="panel_elenco" runat="server" visible="true" style="padding-left:10px!Important;padding-top:0px!Important; margin-bottom:10px;">
                <div class="row" style="min-height:50px!Important;">
                    <div class="gisri_panel_title gisri_title_margin clearfix">
                        <div class="gisri_title_left">
                            <asp:LinkButton ID="btn_filtri" runat="server" CssClass="btn btn-default"
                                ToolTip="Visualizza maschera dei filtri" Style="padding-top:6px; padding-left:10px;">
                                <i class="fa fa-filter"></i>
                            </asp:LinkButton>
                        </div>
                        <div class="gisri_title_left">
                            <h3 style="padding-left: 10px; margin-top: 0px!Important;">
                                ELENCO SOCIETA SERVITE</h3>
                        </div>
                        <div class="gisri_button_right" id="div_nuovo" runat="server" >
                            <asp:LinkButton ID="btn_nuovo" runat="server" ToolTip="Nuova societa" CssClass="btn btn-primary"><i class="fa fa-plus"></i>&nbsp;&nbsp;Nuova Società</asp:LinkButton>
                        </div>
                    </div>
                </div>
                <div class="row" id="div_filtri" runat="server" visible="false">
                    <div class="form-body"  style="margin-left: 30px!Important; margin-right: 30px!Important; margin-bottom:10px;">
                        <div class="row">
                            <div class="col-xs-4 gisri_row_filter">
                                <div class="input-group" style="width:100%">
                                    <div>
                                        <asp:TextBox ID="txt_filter_ragione_sociale" runat="server" CssClass="form-control gisri_form_filter"
                                            placeholder="Ragione sociale" onChange="grid_search(this, event, 'sc_ragione_sociale');" ></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-3 gisri_row_filter">
                                <div class="input-group" style="width:100%">
                                    <div>
                                        <asp:TextBox ID="txt_filter_citta" runat="server" CssClass="form-control gisri_form_filter"
                                            placeholder="Città" onChange="grid_search(this, event, 'sc_comune_desc');" ></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-4 gisri_row_filter">
                                <div class="input-group" style="width:100%">
                                    <div>
                                        <asp:TextBox ID="txt_filter_indirizzo" runat="server" CssClass="form-control gisri_form_filter"
                                            placeholder="Indirizzo" onChange="grid_search(this, event, 'sc_indirizzo');" ></asp:TextBox>
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
                <div class="table-container">
                    <telerik:RadGrid ID="RGSocieta" AutoGenerateColumns="False" CssClass="" style="width:100% !important" runat="server"
                        ShowFooter="false" AllowPaging="True" AllowSorting="True" GridLines="None" PageSize="25"
                        Width="100%" AllowMultiRowSelection="true" Skin="MyCustomSkin" EnableEmbeddedSkins="false"
                        AllowFilteringByColumn="true" Culture="it-IT">
                        <GroupingSettings CaseSensitive="false" />
                        <PagerStyle Mode="NextPrevAndNumeric" CssClass=""></PagerStyle>
                        <HeaderStyle CssClass=""></HeaderStyle>
                        <ItemStyle HorizontalAlign="Left"></ItemStyle>
                        <AlternatingItemStyle CssClass="" HorizontalAlign="Left"></AlternatingItemStyle>
                        <FilterItemStyle HorizontalAlign="Left" />
                        <MasterTableView ShowFooter="false" Width="100%" DataKeyNames="societa_key" AllowMultiColumnSorting="True">
                            <Columns>
                                <telerik:GridBoundColumn SortExpression="sc_ragione_sociale" UniqueName="sc_ragione_sociale"
                                    HeaderText="Ragione sociale" DataField="sc_ragione_sociale" HeaderStyle-Width="25%"
                                    AllowFiltering="true" ShowFilterIcon="false" FilterControlWidth="150px" AutoPostBackOnFilter="true"
                                    CurrentFilterFunction="Contains" />
                                <telerik:GridTemplateColumn SortExpression="sc_comune_desc" UniqueName="sc_comune_desc"
                                    HeaderText="Città" DataField="sc_comune_desc" HeaderStyle-Width="15%" AllowFiltering="true"
                                    ShowFilterIcon="false" FilterControlWidth="150px" AutoPostBackOnFilter="true"
                                    CurrentFilterFunction="Contains">
                                    <ItemTemplate>
                                        <asp:Label ID="lblsc_comune_desc" runat="server"></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn UniqueName="sc_indirizzo" SortExpression="sc_indirizzo"
                                    InitializeTemplatesFirst="false" HeaderStyle-Width="35%" HeaderText="Indirizzo"
                                    AllowFiltering="true" ShowFilterIcon="false" DataField="sc_indirizzo" FilterControlWidth="150px"
                                    AutoPostBackOnFilter="true" CurrentFilterFunction="Contains">
                                    <ItemTemplate>
                                        <asp:Label ID="lblsc_indirizzo" runat="server"></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn SortExpression="sc_piva" UniqueName="sc_piva" HeaderText="P.Iva"
                                    DataField="sc_piva" HeaderStyle-Width="5%" AllowFiltering="false"
                                    ItemStyle-CssClass="additionalColumn" HeaderStyle-CssClass="additionalColumn" />
                                <telerik:GridBoundColumn SortExpression="sc_albo_numero" UniqueName="sc_albo_numero"
                                    HeaderText="Albo N." DataField="sc_albo_numero" HeaderStyle-Width="10%" AllowFiltering="false"
                                    ItemStyle-CssClass="additionalColumn" HeaderStyle-CssClass="additionalColumn" />
                                <telerik:GridTemplateColumn SortExpression="sc_albo_del" UniqueName="sc_albo_del"
                                    HeaderText="Albo del" DataField="sc_albo_del" HeaderStyle-Width="10%" AllowFiltering="false"
                                    ItemStyle-CssClass="additionalColumn" HeaderStyle-CssClass="additionalColumn" >
                                    <ItemTemplate>
                                        <asp:Label ID="lblsc_sc_albo_del" runat="server"></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn UniqueName="TemplateColumnGo" SortExpression="" InitializeTemplatesFirst="false"
                                    HeaderStyle-Width="1%" AllowFiltering="false">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btn_scheda" runat="server" CssClass="btn btn-primary btn-xs button-link-w"
                                            CommandName="SCHEDA">
                                                    <i class=" fa fa-edit"></i>&nbsp;SCHEDA</i>
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </telerik:GridTemplateColumn>
                            </Columns>
                        </MasterTableView>
                        <ClientSettings EnableRowHoverStyle="true">
                            <Selecting AllowRowSelect="false" />
                        </ClientSettings>
                    </telerik:RadGrid>
                </div>
            </div>
            <!-- /content-panel lista-->
            <div class="content-panel" id="panel_dati" runat="server" style="display: none;">
                <div class="gisri_panel_title clearfix">
                    <div class="gisri_title_left">
                        <h3 style="padding-left: 10px; margin-top: 0px!Important;">
                            DETTAGLIO SOCIETA: <asp:Literal ID="ltl_sc_denominazione" runat="server" /></h3>
                    </div>
                    <div class="gisri_button_right" id="div_ritorno" runat="server">
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
                                <li id="li_personal" runat="server"><a data-toggle="tab" href="#<%=div_personal.ClientID%>"
                                    class="tab-font">Personale</a> </li>
                            </ul>
                        </div>
                        <! --/panel-heading -->
                        <div class="panel-body">
                            <div class="tab-content">
                                <div id="div_overview" class="tab-pane active" runat="server">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="form-body">
                                                <h6><asp:Label ID="ltl_ultima_modifica" runat="server"></asp:Label></h6>
                                                <div class="row" id="div_societa_gestione" runat="server">
                                                    <div class="col-md-12">
                                                        <cc:rDropDown ID="ddl_sc_societa_gestione_key" runat="server" AutoPostBack="false"
                                                            Label="Società di gestione" Form_Vertical="true" Required="true" Required_Help="Società di gestione obbligatoria!"  />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <cc:rTextBox ID="txt_sc_ragione_sociale" runat="server" MaxLength="256" AutoPostBack="false"
                                                            Label="Ragione Sociale" Icon="" Form_Vertical="true" Required="true" Required_Help="Nome società obbligatoria!" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <cc:rTextBox ID="txt_sc_codfisc" runat="server" MaxLength="16" AutoPostBack="false"
                                                            Label="Codice Fiscale" Icon="" Form_Vertical="true" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <cc:rTextBox ID="txt_sc_piva" runat="server" MaxLength="16" AutoPostBack="false"
                                                            Label="Partita Iva" Icon="" Form_Vertical="true" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <cc:rCheckBox ID="chk_sc_stato_estero" runat="server" Values="S|" Classes="make-switch|SI|NO||"
                                                            Label="Indirizzo Estero" AutoPostBack="true" Checked="false" Form_Vertical="true" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <cc:rDropDown ID="ddl_sc_provincia_cod" runat="server" AutoPostBack="true" Label="Provincia"
                                                            Placeholder="Seleziona..." Form_Vertical="true" />
                                                        <cc:rTextBox ID="txt_sc_provincia_desc" runat="server" MaxLength="40" Label="Stato Estero"
                                                            Visible="false" Form_Vertical="true" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <cc:rDropDown ID="ddl_sc_comune_cod" runat="server" AutoPostBack="true" Label="Citt&agrave;"
                                                            Placeholder="Seleziona..." Form_Vertical="true" />
                                                        <cc:rTextBox ID="txt_sc_comune_desc" runat="server" MaxLength="40" Label="Comune Estero"
                                                            Visible="false" Form_Vertical="true" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <cc:rTextBox ID="txt_sc_cap" runat="server" MaxLength="5" Label="Cap" Form_Vertical="true" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <cc:rTextBox ID="txt_sc_localita" runat="server" MaxLength="40" AutoPostBack="false"
                                                            Label="Localita" Icon="" Form_Vertical="true" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <cc:rTextBox ID="txt_sc_indirizzo" runat="server" MaxLength="60" AutoPostBack="false"
                                                            Label="Indirizzo" Icon="" Form_Vertical="true" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <cc:rTextBox ID="txt_sc_telefono" runat="server" MaxLength="16" AutoPostBack="false"
                                                            Label="Telefono" Icon="" Form_Vertical="true" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <cc:rTextBox ID="txt_sc_email" runat="server" MaxLength="60" AutoPostBack="false"
                                                            Label="Mail Aziendale" Icon="fa fa-envelope" Form_Vertical="true" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <cc:rTextBox ID="txt_sc_albo_numero" runat="server" MaxLength="128" AutoPostBack="false"
                                                            Label="Albo Num." Icon="" Form_Vertical="true" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <cc:rTextData ID="txt_sc_albo_del" runat="server" MaxLength="10" AutoPostBack="false"
                                                            Label="Data iscrizione" Icon="fa fa-calendar" Form_Vertical="true" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="control-label" style="white-space: nowrap;">
                                                                Logo Aziendale</label>
                                                            <div>
                                                                <div class="col-sm-6">
                                                                    <asp:Image ID="img_sc_logo" runat="server" Width="150" class="img-circle left" style="padding-bottom:20px;" />
                                                                    <br />
                                                                    <telerik:RadAsyncUpload runat="server" ID="logo_upload" MultipleFileSelection="Disabled"
                                                                        AllowedFileExtensions="jpg,png,jpeg,gif" />
                                                                    <asp:LinkButton ID="btn_cancella_logo" runat="server" CssClass="btn btn-danger btn-xs button-link-w">
                                                                            <i class=" fa fa-trash-o"></i>&nbsp;Cancella
                                                                    </asp:LinkButton>
                                                                </div>
                                                                <div class="col-sm-6">

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-actions right" style="padding-top:20px;">
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
                                    <! --/OVERVIEW -->
                                </div>
                                <! --/tab-pane -->
                                <div id="div_personal" class="tab-pane" runat="server">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <asp:LinkButton ID="btn_filtra_personale" runat="server" CssClass="btn btn-default"
                                                ToolTip="Visualizza maschera degli filtri" Style="padding-top:6px; padding-left:10px; margin-bottom:10px;">
                                                <i class="fa fa-filter"></i>&nbspApri filtri
                                            </asp:LinkButton>
                                            <div class="row" id="div_filtri_personale" runat="server" visible="false">
                                                <div class="form-body" style="margin-left: 30px!Important; margin-right: 35px!Important; margin-bottom:10px;">
                                                    <div class="row">
                                                        <div class="col-xs-2 gisri_row_filter">
                                                            <div class="input-group" style="width:100%">
                                                                <div>
                                                                    <asp:TextBox ID="txt_filter_cognome" runat="server" CssClass="form-control gisri_form_filter"
                                                                        placeholder="Cognome" onChange="grid_personale_search(this, event, 'dp_cognome');" ></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-2 gisri_row_filter">
                                                            <div class="input-group" style="width:100%">
                                                                <div>
                                                                    <asp:TextBox ID="txt_filter_nome" runat="server" CssClass="form-control gisri_form_filter"
                                                                        placeholder="Nome" onChange="grid_personale_search(this, event, 'dp_nome');" ></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-2 gisri_row_filter">
                                                            <div class="input-group" style="width:100%">
                                                                <div>
                                                                    <asp:TextBox ID="txt_filter_cellulare" runat="server" CssClass="form-control gisri_form_filter"
                                                                        placeholder="Cellulare" onChange="grid_personale_search(this, event, 'dp_cellulare');" ></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-2 gisri_row_filter">
                                                            <div class="input-group" style="width:100%">
                                                                <div>
                                                                    <asp:TextBox ID="txt_filter_mail" runat="server" CssClass="form-control gisri_form_filter"
                                                                        placeholder="Mail" onChange="grid_personale_search(this, event, 'dp_email');" ></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-3 gisri_row_filter">
                                                            <div class="input-group" style="width:100%">
                                                                <div>
                                                                    <asp:DropDownList ID="ddl_filter_dp_ruolo_aziendale_desc" runat="server" CssClass="form-control gisri_form_filter placeholder"
                                                                        onChange="grid_personale_search(this, event, 'dp_ruolo_aziendale_desc');" >
                                                                    </asp:DropDownList>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-1 gisri_row_filter gisri_row_filter_right">
                                                            <asp:LinkButton ID="btn_reset_filter_personale" runat="server" CssClass="btn btn-default btn-xs gisri_button_ws"
                                                                ToolTip="Pulisce Filtri" Height="25" Style="padding-top:6px; padding-left:1px;">
                                                                <i class="fa fa-eraser"></i>
                                                            </asp:LinkButton>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="table-container">
                                                <telerik:RadGrid ID="RGPersonale" AutoGenerateColumns="False" CssClass="" runat="server"
                                                    ShowFooter="false" AllowPaging="True" AllowSorting="True" GridLines="None" PageSize="25"
                                                    Width="100%" AllowMultiRowSelection="true" Skin="MyCustomSkin" EnableEmbeddedSkins="false"
                                                    AllowFilteringByColumn="true" Culture="it-IT">
                                                    <GroupingSettings CaseSensitive="false" />
                                                    <PagerStyle Mode="NextPrevAndNumeric" CssClass=""></PagerStyle>
                                                    <HeaderStyle CssClass=""></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                    <AlternatingItemStyle CssClass="" HorizontalAlign="Left"></AlternatingItemStyle>
                                                    <FilterItemStyle HorizontalAlign="Left" />
                                                    <MasterTableView ShowFooter="false" Width="100%" DataKeyNames="dipendenti_key" AllowMultiColumnSorting="True">
                                                        <Columns>
                                                            <telerik:GridBoundColumn SortExpression="dp_cognome" UniqueName="dp_cognome" HeaderText="Cognome"
                                                                DataField="dp_cognome" HeaderStyle-Width="25%" AllowFiltering="true" ShowFilterIcon="false"
                                                                FilterControlWidth="150px" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" />
                                                            <telerik:GridBoundColumn SortExpression="dp_nome" UniqueName="dp_nome" HeaderText="Nome"
                                                                DataField="dp_nome" HeaderStyle-Width="25%" AllowFiltering="true" ShowFilterIcon="false"
                                                                FilterControlWidth="150px" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" />
                                                            <telerik:GridBoundColumn SortExpression="dp_telefono" UniqueName="dp_telefono" HeaderText="Telefono"
                                                                DataField="dp_telefono" HeaderStyle-Width="10%" AllowFiltering="true" ShowFilterIcon="false"
                                                                FilterControlWidth="80px" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                                                                ItemStyle-CssClass="additionalColumn" HeaderStyle-CssClass="additionalColumn" />
                                                            <telerik:GridBoundColumn SortExpression="dp_cellulare" UniqueName="dp_cellulare"
                                                                HeaderText="Cellulare" DataField="dp_cellulare" HeaderStyle-Width="10%" AllowFiltering="true"
                                                                ShowFilterIcon="false" FilterControlWidth="80px" AutoPostBackOnFilter="true"
                                                                CurrentFilterFunction="Contains" />
                                                            <telerik:GridBoundColumn SortExpression="dp_email" UniqueName="dp_email" HeaderText="Mail"
                                                                DataField="dp_email" HeaderStyle-Width="10%" AllowFiltering="true" ShowFilterIcon="false"
                                                                FilterControlWidth="80px" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" />
                                                            <telerik:GridBoundColumn SortExpression="dp_ruolo_aziendale_desc" UniqueName="dp_ruolo_aziendale_desc"
                                                                HeaderText="Ruolo" DataField="dp_ruolo_aziendale_desc" HeaderStyle-Width="15%"
                                                                AllowFiltering="true" ShowFilterIcon="false" FilterControlWidth="100px" AutoPostBackOnFilter="true"
                                                                CurrentFilterFunction="EqualTo"
                                                                ItemStyle-CssClass="additionalColumn" HeaderStyle-CssClass="additionalColumn" >
                                                                <FilterTemplate>
                                                                    <asp:DropDownList ID="ddl_filter_dp_ruolo_aziendale_desc" runat="server" CssClass="rgFilterBox"
                                                                        OnChange="dp_ruolo_aziendale_desc_indexchanged(this)">
                                                                    </asp:DropDownList>
                                                                </FilterTemplate>
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridTemplateColumn SortExpression="dp_foto" UniqueName="dp_foto" HeaderText="Foto"
                                                                DataField="dp_foto" HeaderStyle-Width="5%" AllowFiltering="false"
                                                                ItemStyle-CssClass="additionalColumn" HeaderStyle-CssClass="additionalColumn" >
                                                                <ItemTemplate>
                                                                    <div class="centered img-circle" style="width:80px;height:80px;overflow:hidden; margin: 0 auto;">
                                                                        <asp:Image ID="img_dp_foto" runat="server" Visible="false" Width="80" CssClass="img-responsive" />
                                                                    </div>
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridTemplateColumn UniqueName="TemplateColumnGo" SortExpression="" InitializeTemplatesFirst="false"
                                                                HeaderStyle-Width="1%" AllowFiltering="false">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="btn_scheda" runat="server" CssClass="btn btn-primary btn-xs button-link-w"
                                                                        CommandName="SCHEDA">
                                                                            <i class=" fa fa-edit"></i>&nbsp;SCHEDA</i>
                                                                    </asp:LinkButton>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </telerik:GridTemplateColumn>
                                                        </Columns>
                                                    </MasterTableView>
                                                    <ClientSettings EnableRowHoverStyle="true">
                                                        <Selecting AllowRowSelect="false" />
                                                    </ClientSettings>
                                                </telerik:RadGrid>
                                            </div>
                                            <div class="form-actions right" style="padding-top: 10px;">
                                                <asp:LinkButton ID="btn_nuovo_personale" runat="server" CssClass="btn btn-primary">
                                                        <i class="fa fa-plus"></i> Nuovo Personale
                                                </asp:LinkButton>
                                            </div>
                                        </div>
                                        <! --/col-lg-12 -->
                                    </div>
                                    <! --/row -->
                                </div>
                                <! --/tab-pane -->
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
    <telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
        <script type="text/javascript">
            function dp_ruolo_aziendale_desc_indexchanged(sender) {
                var tableView = $find("<%=RGPersonale.MasterTableView.ClientID%>");
                tableView.filter("dp_ruolo_aziendale_desc", sender.options[sender.selectedIndex].text, "EqualTo");
            }
        </script>
    </telerik:RadScriptBlock>
</asp:Content>

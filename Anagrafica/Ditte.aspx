<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Start/GisRI.Master"
    CodeBehind="Ditte.aspx.vb" Inherits="GisRI_Web.fDitte" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Src="../Controls/rTextBox.ascx" TagName="rTextBox" TagPrefix="cc" %>
<%@ Register Src="../Controls/rTextData.ascx" TagName="rTextData" TagPrefix="cc" %>
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
            var masterTableView = $find("<%= RGDitte.ClientID %>").get_masterTableView();

            masterTableView.filter(uniqueName, sender.value, Telerik.Web.UI.GridFilterFunction.Contains);
        }

        function Init_Dirty() {
            $("#<%=div_overview.ClientID%>").dirtyForms();
            $("#<%=div_autorizzazioni.ClientID%>").dirtyForms();
        }

    </script>
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
                                ELENCO DITTE OPERATRICI</h3>
                        </div>
                        <div class="gisri_button_right" id="div_nuovo" runat="server" >
                            <asp:LinkButton ID="btn_nuovo" runat="server" ToolTip="Nuova ditta" CssClass="btn btn-primary"><i class="fa fa-plus"></i>&nbsp;&nbsp;Nuova Ditta</asp:LinkButton>
                        </div>
                    </div>
                </div>
                <div class="row" id="div_filtri" runat="server" visible="false">
                    <div class="form-body" style="margin-left: 30px!Important; margin-right: 30px!Important; margin-bottom:10px;">
                        <div class="row">
                            <div class="col-xs-4 gisri_row_filter">
                                <div class="input-group" style="width:100%">
                                    <div>
                                        <asp:TextBox ID="txt_filter_ragione_sociale" runat="server" CssClass="form-control gisri_form_filter"
                                            placeholder="Ragione Sociale" onChange="grid_search(this, event, 'di_ragione_sociale');" ></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-4 gisri_row_filter">
                                <div class="input-group" style="width:100%">
                                    <div>
                                        <asp:TextBox ID="txt_filter_citta" runat="server" CssClass="form-control gisri_form_filter"
                                            placeholder="Città" onChange="grid_search(this, event, 'di_comune_desc');" ></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-3 gisri_row_filter">
                                <div class="input-group" style="width:100%">
                                    <div>
                                        <asp:TextBox ID="txt_filter_piva" runat="server" CssClass="form-control gisri_form_filter"
                                            placeholder="Partita Iva" onChange="grid_search(this, event, 'di_piva');" ></asp:TextBox>
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
                    <telerik:RadGrid ID="RGDitte" AutoGenerateColumns="False" CssClass="" style="width: 100% !important" runat="server"
                        ShowFooter="false" AllowPaging="True" AllowSorting="True" GridLines="None" PageSize="25"
                        Width="100%" AllowMultiRowSelection="true" Skin="MyCustomSkin" EnableEmbeddedSkins="false"
                        AllowFilteringByColumn="true" Culture="it-IT">
                        <GroupingSettings CaseSensitive="false" />
                        <PagerStyle Mode="NextPrevAndNumeric" CssClass=""></PagerStyle>
                        <HeaderStyle CssClass=""></HeaderStyle>
                        <ItemStyle HorizontalAlign="Left"></ItemStyle>
                        <AlternatingItemStyle CssClass="" HorizontalAlign="Left"></AlternatingItemStyle>
                        <FilterItemStyle HorizontalAlign="Left" />
                        <MasterTableView ShowFooter="false" Width="100%" DataKeyNames="ditta_key" AllowMultiColumnSorting="True">
                            <Columns>
                                <telerik:GridBoundColumn SortExpression="di_ragione_sociale" UniqueName="di_ragione_sociale"
                                    HeaderText="Ragione sociale" DataField="di_ragione_sociale" HeaderStyle-Width="25%"
                                    AllowFiltering="true" ShowFilterIcon="false" FilterControlWidth="150px" AutoPostBackOnFilter="true"
                                    CurrentFilterFunction="Contains" />
                                <telerik:GridTemplateColumn SortExpression="di_comune_desc" UniqueName="di_comune_desc"
                                    HeaderText="Città" DataField="di_comune_desc" HeaderStyle-Width="15%" AllowFiltering="true"
                                    ShowFilterIcon="false" FilterControlWidth="150px" AutoPostBackOnFilter="true"
                                    CurrentFilterFunction="Contains">
                                    <ItemTemplate>
                                        <asp:Label ID="lbldi_comune_desc" runat="server"></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn UniqueName="di_indirizzo" SortExpression="di_indirizzo"
                                    InitializeTemplatesFirst="false" HeaderStyle-Width="35%" HeaderText="Indirizzo"
                                    AllowFiltering="true" ShowFilterIcon="false" DataField="di_indirizzo" FilterControlWidth="150px"
                                    AutoPostBackOnFilter="true" CurrentFilterFunction="Contains">
                                    <ItemTemplate>
                                        <asp:Label ID="lbldi_indirizzo" runat="server"></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn SortExpression="di_piva" UniqueName="di_piva" HeaderText="P.Iva"
                                    DataField="di_piva" HeaderStyle-Width="5%" AllowFiltering="true" ShowFilterIcon="false"
                                    FilterControlWidth="100px" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                                    ItemStyle-CssClass="additionalColumn" HeaderStyle-CssClass="additionalColumn" />
                                <telerik:GridBoundColumn SortExpression="di_albo_numero" UniqueName="di_albo_numero"
                                    HeaderText="Albo N." DataField="di_albo_numero" HeaderStyle-Width="10%" AllowFiltering="false"
                                    ItemStyle-CssClass="additionalColumn" HeaderStyle-CssClass="additionalColumn" />
                                <telerik:GridTemplateColumn SortExpression="di_albo_del" UniqueName="di_albo_del"
                                    HeaderText="Albo del" DataField="di_albo_del" HeaderStyle-Width="10%" AllowFiltering="false"
                                    ItemStyle-CssClass="additionalColumn" HeaderStyle-CssClass="additionalColumn" >
                                    <ItemTemplate>
                                        <asp:Label ID="lbldi_di_albo_del" runat="server"></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn UniqueName="TemplateColumnGo" SortExpression="" InitializeTemplatesFirst="false"
                                    HeaderStyle-Width="1%" AllowFiltering="false" >
                                    <ItemStyle HorizontalAlign="right" />
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btn_scheda" runat="server" CssClass="btn btn-primary btn-xs button-link-w"
                                            CommandName="SCHEDA">
                                            <i class=" fa fa-edit"></i>&nbsp;SCHEDA
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
            <!-- /content-panel lista-->
            <div class="content-panel" id="panel_dati" runat="server" style="display: none;">
                <div class="gisri_panel_title clearfix">
                    <div class="gisri_title_left">
                        <h3 style="padding-left: 10px; margin-top: 0px!Important;">
                            <i class="fa fa-angle-right"></i>DETTAGLIO DITTA OPERATRICE: <asp:Literal ID="ltl_di_denominazione" runat="server" /></asp:Literal></h3>
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
                                <li class="active" id="li_overview" runat="server" style="white-space:nowrap;"><a data-toggle="tab" href="#<%=div_overview.ClientID%>"
                                    class="tab-font">Dati Anagrafici</a> </li>
                                <li id="li_role" runat="server" style="white-space:nowrap;"><a data-toggle="tab" href="#<%=div_role.ClientID%>" class="tab-font">
                                    Ruoli operativi</a> </li>
                                <li id="li_autorizzazioni" runat="server"><a data-toggle="tab" href="#<%=div_autorizzazioni.ClientID%>" class="tab-font">
                                    Autorizzazioni</a> </li>
                                <li id="li_personal" runat="server"><a data-toggle="tab" href="#<%=div_personal.ClientID%>"
                                    class="tab-font">Personale</a> </li>
                                <li id="li_allegati" runat="server"><a data-toggle="tab" href="#<%=div_allegati.ClientID%>"
                                    class="tab-font">Allegati</a> </li>
                                <li id="li_operativita" runat="server" style="white-space:nowrap;"><a data-toggle="tab" href="#<%=div_operativita.ClientID%>"
                                    class="tab-font">Impegno sui siti</a> </li>
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
                                                        <cc:rDropDown ID="ddl_di_societa_gestione_key" runat="server" AutoPostBack="false"
                                                            Label="Societ&agrave; di gestione" Placeholder="Seleziona..." Form_Vertical="true"
                                                            Required="true" Required_Help="Società di gestione obbligatoria!" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <cc:rTextBox ID="txt_di_ragione_sociale" runat="server" MaxLength="256" AutoPostBack="false"
                                                            Label="Ragione Sociale" Icon="" Form_Vertical="true" Required="true" Required_Help="Nome della ditta obbligatoria!" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <cc:rTextBox ID="txt_di_codfisc" runat="server" MaxLength="16" AutoPostBack="false"
                                                            Label="Codice Fiscale" Icon="" Form_Vertical="true" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <cc:rTextBox ID="txt_di_piva" runat="server" MaxLength="16" AutoPostBack="false"
                                                            Label="Partita Iva" Icon="" Form_Vertical="true" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <cc:rCheckBox ID="chk_di_stato_estero" runat="server" Values="S|" Classes="make-switch|SI|NO||"
                                                            Label="Indirizzo Estero" AutoPostBack="true" Checked="false" Form_Vertical="true" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <cc:rDropDown ID="ddl_di_provincia_cod" runat="server" AutoPostBack="true" Label="Provincia"
                                                            Placeholder="Seleziona..." Form_Vertical="true" />
                                                        <cc:rTextBox ID="txt_di_provincia_desc" runat="server" MaxLength="40" Label="Stato Estero"
                                                            Visible="false" Form_Vertical="true" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <cc:rDropDown ID="ddl_di_comune_cod" runat="server" AutoPostBack="true" Label="Citt&agrave;"
                                                            Placeholder="Seleziona..." Form_Vertical="true" />
                                                        <cc:rTextBox ID="txt_di_comune_desc" runat="server" MaxLength="40" Label="Comune Estero"
                                                            Visible="false" Form_Vertical="true" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <cc:rTextBox ID="txt_di_cap" runat="server" MaxLength="5" Label="Cap" Form_Vertical="true" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <cc:rTextBox ID="txt_di_localita" runat="server" MaxLength="40" AutoPostBack="false"
                                                            Label="Localita" Icon="" Form_Vertical="true" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <cc:rTextBox ID="txt_di_indirizzo" runat="server" MaxLength="60" AutoPostBack="false"
                                                            Label="Indirizzo" Icon="" Form_Vertical="true" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <cc:rTextBox ID="txt_di_telefono" runat="server" MaxLength="15" AutoPostBack="false"
                                                            Label="Telefono" Icon="" Form_Vertical="true" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <cc:rTextBox ID="txt_di_email" runat="server" MaxLength="60" AutoPostBack="false"
                                                            Label="Mail Aziendale" Icon="fa fa-envelope" Form_Vertical="true" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <cc:rTextBox ID="txt_di_albo_numero" runat="server" MaxLength="128" AutoPostBack="false"
                                                            Label="Albo Num." Icon="" Form_Vertical="true" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <cc:rTextData ID="txt_di_albo_del" runat="server" MaxLength="10" AutoPostBack="false"
                                                            Label="Data iscrizione" Icon="fa fa-calendar" Form_Vertical="true" />
                                                    </div>
                                                </div>
                                                <div class="row hidden">
                                                    <div class="col-md-6">
                                                        <cc:rCheckBox ID="chk_di_gestore_cliente" runat="server" Values="S|" Classes="make-switch|SI|NO|warning|"
                                                            Label="Visibilita su tutto il cliente" AutoPostBack="false" Checked="false" Form_Vertical="true" />
                                                    </div>
                                                    <div class="col-md-6">
                                                    </div>
                                                </div>
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
                                    <! --/OVERVIEW -->
                                </div>
                                <! --/tab-pane -->
                                <div id="div_personal" class="tab-pane" runat="server">
                                    <div class="row">
                                        <div class="col-lg-12">
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
                                                        <telerik:GridTemplateColumn SortExpression="dp_cognome" UniqueName="dp_cognome" HeaderText="Cognome"
                                                            DataField="dp_cognome" HeaderStyle-Width="25%" AllowFiltering="true" ShowFilterIcon="false"
                                                            FilterControlWidth="150px" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="lnk_dp_cognome" runat="server" CommandName="OPEN" ForeColor="#428bca"></asp:LinkButton>
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                        <telerik:GridBoundColumn SortExpression="dp_nome" UniqueName="dp_nome" HeaderText="Nome"
                                                            DataField="dp_nome" HeaderStyle-Width="25%" AllowFiltering="true" ShowFilterIcon="false"
                                                            FilterControlWidth="150px" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" />
                                                        <telerik:GridBoundColumn SortExpression="dp_telefono" UniqueName="dp_telefono" HeaderText="Telefono"
                                                            DataField="dp_telefono" HeaderStyle-Width="10%" AllowFiltering="true" ShowFilterIcon="false"
                                                            FilterControlWidth="80px" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" />
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
                                                            CurrentFilterFunction="EqualTo">
                                                            <FilterTemplate>
                                                                <asp:DropDownList ID="ddl_filter_dp_ruolo_aziendale_desc" runat="server" CssClass="rgFilterBox"
                                                                    OnChange="dp_ruolo_aziendale_desc_indexchanged(this)">
                                                                </asp:DropDownList>
                                                            </FilterTemplate>
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridTemplateColumn SortExpression="dp_foto" UniqueName="dp_foto" HeaderText="Foto"
                                                            DataField="dp_foto" HeaderStyle-Width="5%" AllowFiltering="false">
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
                                <div id="div_role" class="tab-pane" runat="server">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="">
                                                <div class="form-body">
                                                    <asp:Repeater ID="rpt_tab_tipologia_ditta" runat="server">
                                                        <HeaderTemplate>
                                                            <div class="row">
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <div class="col-lg-3">
                                                                <cc:rCheckBox ID="chk_tab_tipologia_ditta" runat="server" Values="S|" Classes="make-switch|SI|NO|success|"
                                                                    Label="" Checked="false" Form_Vertical="true" />
                                                                <asp:Label ID="tab_tipologia_ditta_cod" runat="server" Visible="false"></asp:Label>
                                                            </div>
                                                            <asp:Literal ID="ltl_div_separator" runat="server"></asp:Literal>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            </div>
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                </div>
                                                <div class="form-actions right">
                                                    <asp:LinkButton ID="btn_registra_ruoli" runat="server" CssClass="btn btn-primary">
                                                        <i class="fa fa-check"></i> Salva
                                                    </asp:LinkButton>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="div_autorizzazioni" class="tab-pane" runat="server">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="">
                                                <h3>
                                                    Autorizzazioni per il trasporto/intermediazione</h3>
                                                <div class="form-body table-container">
                                                    <table class="table table-striped table-advance table-hover">
                                                        <thead>
                                                            <tr>
                                                                <th style="width: 30%;">
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
                                                                        <td>
                                                                            <asp:Label ID="lbl_di_tipologia_autorizzazioni_desc" runat="server"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="lbl_di_emissione_numero" runat="server"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="lbl_di_emissione_data" runat="server"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="lbl_di_a_data" runat="server"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="lbl_di_note" runat="server"></asp:Label>
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
                                                <div class="overflow">
                                                    <div class="form-body">
                                                        <div id="div_modifica_autorizzazione" runat="server">
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <hr />
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <cc:rDropDown ID="ddl_di_tipologia_autorizzazioni_cod" runat="server" AutoPostBack="false" Label="Tipo autorizzazione"
                                                                        Placeholder="Seleziona..." Form_Vertical="true" Required="true" Required_Help="Tipo autorizzazione obbligatoria!" />
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <cc:rTextBox ID="txt_di_emissione_numero" runat="server" MaxLength="32" AutoPostBack="false"
                                                                        Label="Numero" Icon="" Form_Vertical="true" Required="true" Required_Help="Numero autorizzazione obbligatorio!" />
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <cc:rTextData ID="txt_di_emissione_data" runat="server" MaxLength="10" AutoPostBack="false"
                                                                        Label="Data Emissione" Icon="fa fa-calendar" Form_Vertical="true" />
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <cc:rTextData ID="txt_di_a_data" runat="server" MaxLength="10" AutoPostBack="false"
                                                                        Label="Data Scadenza" Icon="fa fa-calendar" Form_Vertical="true" />
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <cc:rTextBox ID="txt_di_note" runat="server" MaxLength="4000" AutoPostBack="false"
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
                                                <asp:Label ID="lbl_ditta_autorizzazioni_key" runat="server" Visible="false"></asp:Label>
                                            </div>
                                            <div class="">
                                                <h3>Autorizzazioni per il recupero/smaltimento</h3>
                                                <div class="form-body table-container">
                                                    <table class="table table-striped table-advance table-hover">
                                                        <thead>
                                                            <tr>
                                                                <th style="width: 20%;">
                                                                    Sito
                                                                </th>
                                                                <th style="width: 20%;">
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
                                                                <th style="width: 30%;">
                                                                    Note
                                                                </th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <asp:Repeater ID="rpt_autorizzazioni_scarico" runat="server">
                                                                <ItemTemplate>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Label ID="lbl_sd_sito" runat="server"></asp:Label>
                                                                        </td>
                                                                        <td>
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
                                                                    </tr>
                                                                </ItemTemplate>
                                                            </asp:Repeater>
                                                        </tbody>
                                                    </table>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="div_allegati" class="tab-pane" runat="server">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="form-horizontal">
                                                <h3>
                                                    Autorizzazioni per il trasporto/intermediazione</h3>
                                                <div class="form-body table-container" style="margin-left: 0px!Important; margin-right: 0px!Important;">
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
                                    <div class="row" id="div_autorizzazioni_scarico" runat="server">
                                        <div class="col-lg-12">
                                            <div class="form-horizontal">
                                                <h3>Autorizzazioni per il recupero/smaltimento</h3>
                                                <div class="table-container">
                                                    <table class="table table-striped table-advance table-hover">
                                                        <thead>
                                                            <tr>
                                                                <th style="width: 20%;">
                                                                    Sito
                                                                </th>
                                                                <th style="width: 15%;">
                                                                    Allegato
                                                                </th>
                                                                <th style="width: 15%;">
                                                                    Tipologia
                                                                </th>
                                                                <th style="width: 10%;">
                                                                    Data
                                                                </th>
                                                                <th style="width: 15%;">
                                                                    Titolo
                                                                </th>
                                                                <th style="width: 25%;">
                                                                    Descrizione
                                                                </th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <asp:Repeater ID="rpt_documenti" runat="server">
                                                                <ItemTemplate>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Label ID="lbl_doc_sito" runat="server"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:HyperLink ID="lnk_doc_file" runat="server" Target="_blank"></asp:HyperLink>
                                                                            <div class="project-wrapper" id="div_immagine" runat="server">
                                                                                <div class="project">
                                                                                    <div class="photo-wrapper">
                                                                                        <div class="photo">
                                                                                            <asp:HyperLink ID="lnk_doc_immagine" runat="server" CssClass="fancybox" NavigateUrl="">
                                                                                                <asp:Image ID="img_doc_immagine" runat="server" CssClass="img-responsive gisri_attach_image" />
                                                                                            </asp:HyperLink>
                                                                                        </div>
                                                                                        <div class="overlay">
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="lbl_doc_tipo_documento_desc" runat="server"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="lbl_doc_data" runat="server"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="lbl_doc_titolo" runat="server"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="lbl_doc_descrizione" runat="server"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                </ItemTemplate>
                                                            </asp:Repeater>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="div_operativita" class="tab-pane" runat="server">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="">
                                                <div class="form-body table-container" style="margin-left: 0px!Important; margin-right: 0px!Important;">
                                                    <table class="table table-striped table-advance table-hover">
                                                        <thead>
                                                            <tr>
                                                                <th style="width: 50%;">
                                                                    Sito
                                                                </th>
                                                                <th style="width: 10%; white-space:nowrap;">
                                                                    Da Data
                                                                </th>
                                                                <th style="width: 10%; white-space:nowrap;">
                                                                    A Data
                                                                </th>
                                                                <th style="width: 30%;">
                                                                    Ruoli
                                                                </th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <asp:Repeater ID="rpt_operativita" runat="server">
                                                                <ItemTemplate>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Label ID="lbl_di_sito_desc" runat="server"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="lbl_di_da_data" runat="server"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="lbl_di_a_data" runat="server"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="lbl_ruoli_desc" runat="server"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                </ItemTemplate>
                                                            </asp:Repeater>
                                                        </tbody>
                                                    </table>
                                                </div>
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
    <telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
        <script type="text/javascript">
            function dp_ruolo_aziendale_desc_indexchanged(sender) {
                var tableView = $find("<%=RGPersonale.MasterTableView.ClientID%>");
                tableView.filter("dp_ruolo_aziendale_desc", sender.options[sender.selectedIndex].text, "EqualTo");
            }
        </script>
    </telerik:RadScriptBlock>
</asp:Content>
<asp:Content ID="ttt" runat="server" ContentPlaceHolderID="body">
    <cc:cFileUpload ID="cFileUpload" runat="server" />
</asp:Content>

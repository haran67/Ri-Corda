<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Start/GisRI.Master"
    CodeBehind="Permessi.aspx.vb" Inherits="GisRI_Web.fPermessi" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Src="../Controls/rTextBox.ascx" TagName="rTextBox" TagPrefix="cc" %>
<%@ Register Src="../Controls/rTextData.ascx" TagName="rTextData" TagPrefix="cc" %>
<%@ Register Src="../Controls/rDropDown.ascx" TagName="rDropDown" TagPrefix="cc" %>
<%@ Register Src="../Controls/rCheckBox.ascx" TagName="rCheckBox" TagPrefix="cc" %>
<%@ Register Src="../Controls/rRadioButton.ascx" TagName="rRadioButton" TagPrefix="cc" %>
<%@ Register Src="../Controls/cFileUpload.ascx" TagName="cFileUpload" TagPrefix="cc" %>
<%@ Register Src="../Messaggi/Messaggio.ascx" TagName="Messaggio" TagPrefix="cc" %>

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
            var masterTableView = $find("<%= RGPersonale.ClientID %>").get_masterTableView();

            masterTableView.filter(uniqueName, sender.value, Telerik.Web.UI.GridFilterFunction.Contains);
        }

        function grid_search_siti(sender, eventArgs, uniqueName) {
            eventArgs.cancelBubble = true;
            eventArgs.returnValue = false;
            if (eventArgs.stopPropagation) {
                eventArgs.stopPropagation();
                eventArgs.preventDefault();
            }
            var masterTableView = $find("<%= RGSiti.ClientID %>").get_masterTableView();

            if (uniqueName == "sc_ragione_sociale") {
                masterTableView.filter(uniqueName, sender.options[sender.selectedIndex].text, "EqualTo");
            }
            if (uniqueName == 'st_assegnato_permesso') {
                masterTableView.filter(uniqueName, sender.options[sender.selectedIndex].value, "EqualTo");
            }
            else {
                masterTableView.filter(uniqueName, sender.value, Telerik.Web.UI.GridFilterFunction.Contains);
            }
        }

        function Init_Dirty() {
            $("#<%=div_overview.ClientID%>").dirtyForms();
            $("#<%=div_funzioni.ClientID%>").dirtyForms();
            $("#<%=div_visibilita.ClientID%>").dirtyForms();
        }

    </script>
    <style>@media (max-width: 768px) { .btn {width: 100% !important;}}</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body_up" runat="server">
    <cc:Messaggio ID="Messaggio" runat="server" />
    <div class="row mt">
        <div class="col-md-12">
            <div class="content-panel" id="panel_elenco" runat="server" visible="true" style="padding-left: 10px!Important;
                padding-top: 0px!Important; margin-bottom: 10px;">
                <div class="row" style="min-height: 50px!Important;">
                    <div class="gisri_panel_title gisri_title_margin">
                        <div class="gisri_title_left">
                            <asp:LinkButton ID="btn_filtri" runat="server" CssClass="btn btn-default" ToolTip="Visualizza maschera dei filtri"
                                Style="padding-top: 6px; padding-left: 10px;">
                                <i class="fa fa-filter"></i>
                            </asp:LinkButton>
                        </div>
                        <div class="gisri_title_left">
                            <h3 style="padding-left: 10px; margin-top: 0px!Important;">
                                ELENCO UTENTI DEL SISTEMA</h3>
                        </div>
                    </div>
                </div>
                <div class="row" id="div_filtri" runat="server" visible="false">
                    <div class="form-body" style="margin-left: 30px!Important; margin-right: 35px!Important;
                        margin-bottom: 10px;">
                        <div class="row">
                            <div class="col-xs-2 gisri_row_filter">
                                <div class="input-group" style="width: 100%">
                                    <div>
                                        <asp:TextBox ID="txt_filter_cognome" runat="server" CssClass="form-control gisri_form_filter"
                                            placeholder="Cognome" onChange="grid_search(this, event, 'dp_cognome');"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-1 gisri_row_filter">
                                <div class="input-group" style="width: 100%">
                                    <div>
                                        <asp:TextBox ID="txt_filter_nome" runat="server" CssClass="form-control gisri_form_filter"
                                            placeholder="Nome" onChange="grid_search(this, event, 'dp_nome');"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-2 gisri_row_filter">
                                <div class="input-group" style="width: 100%">
                                    <div>
                                        <asp:TextBox ID="txt_filter_societa" runat="server" CssClass="form-control gisri_form_filter"
                                            placeholder="Società" onChange="grid_search(this, event, 'dp_societa_desc');"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-2 gisri_row_filter">
                                <div class="input-group" style="width: 100%">
                                    <div>
                                        <asp:DropDownList ID="ddl_filter_profili" runat="server" CssClass="form-control gisri_form_filter"
                                            onChange="grid_search(this, event, 'dp_profilo');">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-2 gisri_row_filter">
                                <div class="input-group" style="width: 100%">
                                    <div>
                                        <asp:DropDownList ID="ddl_filter_profili_siti" runat="server" CssClass="form-control gisri_form_filter"
                                            onChange="grid_search(this, event, 'dp_profilo_siti');">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-2 gisri_row_filter">
                                <div class="input-group" style="width: 100%">
                                    <div>
                                        <asp:DropDownList ID="ddl_filter_stati_dip" runat="server" CssClass="form-control gisri_form_filter" AutoPostBack="true">
                                            <asp:ListItem Text="Tutti gli stati" Value=""></asp:ListItem>
                                            <asp:ListItem Text="Attivo" Value="S"></asp:ListItem>
                                            <asp:ListItem Text="Non Attivo" Value="N"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-1 gisri_row_filter gisri_row_filter_right">
                                <asp:LinkButton ID="btn_reset_filter" runat="server" CssClass="btn btn-default btn-xs gisri_button_ws"
                                    ToolTip="Pulisce Filtri" Height="25" Style="padding-top: 6px; padding-left: 1px;">
                                    <i class="fa fa-eraser"></i>
                                </asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="overflow">
                    <telerik:RadGrid ID="RGPersonale" AutoGenerateColumns="False" CssClass="" style="width: 100% !important" runat="server"
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
                                    DataField="dp_cognome" HeaderStyle-Width="20%" AllowFiltering="true" ShowFilterIcon="false"
                                    FilterControlWidth="150px" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnk_dp_cognome" runat="server" CommandName="OPEN" ForeColor="#428bca"></asp:LinkButton>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn SortExpression="dp_nome" UniqueName="dp_nome" HeaderText="Nome"
                                    DataField="dp_nome" HeaderStyle-Width="20%" AllowFiltering="true" ShowFilterIcon="false"
                                    FilterControlWidth="150px" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" />
                                <telerik:GridBoundColumn SortExpression="dp_societa_desc" UniqueName="dp_societa_desc"
                                    HeaderText="Società" DataField="dp_societa_desc" HeaderStyle-Width="15%"
                                    AllowFiltering="true" ShowFilterIcon="false" FilterControlWidth="100px" AutoPostBackOnFilter="true"
                                    CurrentFilterFunction="Contains" />
                                <telerik:GridBoundColumn SortExpression="dp_telefono" UniqueName="dp_telefono" HeaderText="Telefono"
                                    DataField="dp_telefono" HeaderStyle-Width="10%" AllowFiltering="true" ShowFilterIcon="false"
                                    FilterControlWidth="80px" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" />
                                <telerik:GridBoundColumn SortExpression="dp_email" UniqueName="dp_email" HeaderText="Mail"
                                    DataField="dp_email" HeaderStyle-Width="10%" AllowFiltering="true" ShowFilterIcon="false"
                                    FilterControlWidth="80px" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" />
                                <telerik:GridTemplateColumn SortExpression="dp_attivo" UniqueName="dp_attivo" HeaderText=""
                                    DataField="dp_attivo" HeaderStyle-Width="5%" AllowFiltering="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_dp_attivo" runat="server" Font-Size="15"></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn SortExpression="dp_profilo" UniqueName="dp_profilo" HeaderText="Profilo"
                                    DataField="dp_profilo" HeaderStyle-Width="15%" AllowFiltering="true" ShowFilterIcon="false"
                                    FilterControlWidth="80px" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" />
                                <telerik:GridBoundColumn SortExpression="dp_profilo_siti" UniqueName="dp_profilo_siti" HeaderText="Profilo Siti"
                                    DataField="dp_profilo_siti" HeaderStyle-Width="15%" AllowFiltering="true" ShowFilterIcon="false"
                                    FilterControlWidth="80px" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" />
                                <telerik:GridTemplateColumn SortExpression="dp_foto" UniqueName="dp_foto" HeaderText="Foto"
                                    DataField="dp_foto" HeaderStyle-Width="5%" AllowFiltering="false">
                                    <ItemTemplate>
                                        <div class="centered img-circle" style="width: 40px; height: 40px; overflow: hidden;
                                            margin: 0 auto;">
                                            <asp:Image ID="img_dp_foto" runat="server" Visible="false" Width="40" CssClass="img-responsive" />
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
            </div>
            <!-- /content-panel lista-->
            <div class="content-panel" id="panel_dati" runat="server" style="display: none;">
                <div class="gisri_panel_title clearfix">
                    <div class="gisri_title_left">
                        <h3 style="padding-left: 10px; margin-top: 0px!Important;">
                            <i class="fa fa-angle-right"></i>DETTAGLIO UTENTE:
                            <asp:Literal ID="ltl_di_denominazione" runat="server" /></asp:Literal></h3>
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
                                <li class="active" id="li_overview" runat="server" style="white-space: nowrap;"><a
                                    data-toggle="tab" href="#<%=div_overview.ClientID%>" class="tab-font">Dati Accesso</a>
                                </li>
                                <li id="li_funzioni" runat="server"><a data-toggle="tab" href="#<%=div_funzioni.ClientID%>"
                                    class="tab-font">Funzioni</a> </li>
                                <li id="li_visibilita" runat="server"><a data-toggle="tab" href="#<%=div_visibilita.ClientID%>"
                                    class="tab-font">Visibilità</a> </li>
                            </ul>
                        </div>
                        <! --/panel-heading -->
                        <div class="panel-body">
                            <div class="tab-content">
                                <div id="div_overview" class="tab-pane active" runat="server">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="form-body">
                                                <h6>
                                                    <asp:Label ID="ltl_ultima_modifica" runat="server"></asp:Label></h6>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <cc:rTextBox ID="txt_dp_cognome" runat="server" MaxLength="64" AutoPostBack="false"
                                                            Label="Cognome" Icon="" Form_Vertical="true" Read_Only="true" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <cc:rTextBox ID="txt_dp_nome" runat="server" MaxLength="64" AutoPostBack="false"
                                                            Label="Nome" Icon="" Form_Vertical="true" Read_Only="true" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <cc:rTextBox ID="txt_ad_name" runat="server" MaxLength="64" AutoPostBack="false"
                                                            Label="Nome Dominio" Icon="" Form_Vertical="true" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <cc:rTextBox ID="txt_dp_email" runat="server" MaxLength="60" AutoPostBack="false"
                                                            Label="Mail Aziendale" Icon="fa fa-envelope" Form_Vertical="true" Required="true" Required_Help="Email dipendente obbligatoria!" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <cc:rDropDown ID="ddl_tipo_utente" runat="server" AutoPostBack="true" Label="Tipo Utente"
                                                            Placeholder="Seleziona..." Form_Vertical="true"  Required="true" Required_Help="Tipologia utente obbligatoria!" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <cc:rTextData ID="txt_data_scadenza" runat="server" MaxLength="10" AutoPostBack="false"
                                                            Label="Data scadenza" Icon="fa fa-calendar" Form_Vertical="true" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <cc:rCheckBox ID="chk_attivo" runat="server" Values="S|" Classes="make-switch|SI|NO|success|"
                                                            Label="Attivo" AutoPostBack="false" Checked="false" Form_Vertical="true" />
                                                    </div>
                                                    <div class="col-md-6">
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <cc:rTextBox ID="txt_username" runat="server" MaxLength="40" AutoPostBack="false"
                                                            Label="USERNAME" Icon="" Form_Vertical="true" Required="true" Required_Help="UserName obbligatoria!" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <cc:rTextBox ID="txt_password" runat="server" MaxLength="60" AutoPostBack="false"
                                                            Label="PASSWORD" Icon="" Form_Vertical="true" TextMode="Password" Required="true" Required_Help="Password obbligatoria!" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <label class="control-label" style="white-space:nowrap; font-weight:bold;" id="label_control" runat="server">
                                                            ALERT ASSEGNATI</label>
                                                        <div class="form-body">
                                                            <asp:Repeater ID="rpt_alert" runat="server">
                                                                <HeaderTemplate>
                                                                    <div class="row">
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <div class="col-lg-3">
                                                                        <cc:rCheckBox ID="chk_pa_alert_key" runat="server" Values="S|" Classes="make-switch|SI|NO|success|"
                                                                            Label="" Checked="false" Form_Vertical="true" />
                                                                        <asp:Label ID="tab_pa_alert_key" runat="server" Visible="false"></asp:Label>
                                                                    </div>
                                                                    <asp:Literal ID="ltl_div_separator" runat="server"></asp:Literal>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    </div>
                                                                </FooterTemplate>
                                                            </asp:Repeater>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-actions right">
                                                    <asp:LinkButton ID="btn_registra" runat="server" CssClass="btn btn-primary">
                                                        <i class="fa fa-check"></i> Salva
                                                    </asp:LinkButton>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <! --/OVERVIEW -->
                                </div>
                                <! --/tab-pane -->
                                <div id="div_visibilita" class="tab-pane" runat="server">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="form-body">
                                                <div class="row" id="div_visibilita_siti_01" runat="server">
                                                    <div class="col-md-12">
                                                        <cc:rDropDown ID="ddl_tab_profilo_sito_key" runat="server" AutoPostBack="true" Label="Profilo Siti"
                                                            Placeholder="Seleziona..." Form_Vertical="true"  />
                                                    </div>
                                                </div>
                                                <div class="row" id="div_visibilita_siti_02" runat="server">
                                                    <div class="col-md-12">
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <asp:LinkButton ID="btn_filtri_siti" runat="server" CssClass="btn btn-default btn-xs gisri_button_ws"
                                                                    ToolTip="Visualizza i filtri" Height="25" Style="padding-top:6px; padding-left:1px;">
                                                                    <i class="fa fa-filter"></i>
                                                                </asp:LinkButton>
                                                                <h5 style="float:right;">ELENCO SITI</h5>
                                                            </div>
                                                        </div>
                                                        <div class="row" id="div_filtri_siti" runat="server" visible="false">
                                                            <div class="form-body" style="margin-left: 30px!Important; margin-right: 30px!Important;
                                                                margin-top: 5px; margin-bottom:10px;">
                                                                <div class="row">
                                                                    <div class="col-xs-2 gisri_row_filter">
                                                                        <div class="input-group" style="width: 100%">
                                                                            <div>
                                                                                <asp:TextBox ID="txt_filter_codice" runat="server" CssClass="form-control gisri_form_filter"
                                                                                    placeholder="Codice" onChange="grid_search_siti(this, event, 'st_codice_interno');"></asp:TextBox>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-xs-2 gisri_row_filter">
                                                                        <div class="input-group" style="width: 100%">
                                                                            <div>
                                                                                <asp:TextBox ID="txt_filter_denominazione" runat="server" CssClass="form-control gisri_form_filter"
                                                                                    placeholder="Denominazione" onChange="grid_search_siti(this, event, 'st_denominazione');"></asp:TextBox>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-xs-2 gisri_row_filter">
                                                                        <div class="input-group" style="width: 100%">
                                                                            <div>
                                                                                <asp:TextBox ID="txt_filter_provincia" runat="server" CssClass="form-control gisri_form_filter"
                                                                                    placeholder="Prov." onChange="grid_search_siti(this, event, 'st_provincia_desc');"></asp:TextBox>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-xs-2 gisri_row_filter">
                                                                        <div class="input-group" style="width: 100%">
                                                                            <div>
                                                                                <asp:DropDownList ID="ddl_filter_assegnati" runat="server" CssClass="form-control gisri_form_filter placeholder"
                                                                                    onChange="grid_search_siti(this, event, 'st_assegnato_permesso');" >
                                                                                    <asp:ListItem Text="Seleziona Assegnati" Value=""></asp:ListItem>
                                                                                    <asp:ListItem Text="Siti assegnati" Value="S"></asp:ListItem>
                                                                                    <asp:ListItem Text="Siti non assegnati" Value="N"></asp:ListItem>
                                                                                </asp:DropDownList>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-xs-3 gisri_row_filter">
                                                                        <div class="input-group" style="width: 100%">
                                                                            <div>
                                                                                <asp:DropDownList ID="ddl_filter_societa" runat="server" CssClass="form-control gisri_form_filter"
                                                                                    onChange="grid_search_siti(this, event, 'sc_ragione_sociale');">
                                                                                </asp:DropDownList>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-xs-1 gisri_row_filter gisri_row_filter_right">
                                                                        <asp:LinkButton ID="btn_reset_filter_siti" runat="server" CssClass="btn btn-default btn-xs gisri_button_ws"
                                                                            ToolTip="Pulisce Filtri" Height="25" Style="padding-top:6px; padding-left:1px;">
                                                                            <i class="fa fa-eraser"></i>
                                                                        </asp:LinkButton>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <telerik:RadGrid ID="RGSiti" AutoGenerateColumns="False" CssClass="" runat="server"
                                                            ShowFooter="false" AllowPaging="True" AllowSorting="True" GridLines="None" PageSize="25"
                                                            Width="100%" AllowMultiRowSelection="true" Skin="MyCustomSkin" EnableEmbeddedSkins="false"
                                                            AllowFilteringByColumn="true" Culture="it-IT">
                                                            <GroupingSettings CaseSensitive="false" />
                                                            <PagerStyle Mode="NextPrevAndNumeric" CssClass=""></PagerStyle>
                                                            <FilterItemStyle HorizontalAlign="Left" Height="0" />
                                                            <ItemStyle HorizontalAlign="Left" />
                                                            <MasterTableView ShowFooter="false" Width="100%" DataKeyNames="sito_key" ClientDataKeyNames="sito_key"
                                                                AllowMultiColumnSorting="True" ShowHeadersWhenNoRecords="false">
                                                                <Columns>
                                                                    <telerik:GridTemplateColumn UniqueName="st_assegnato_permesso" SortExpression=""
                                                                        InitializeTemplatesFirst="false" HeaderStyle-Width="5%"
                                                                        DataField="st_assegnato_permesso" AllowFiltering="true" >
                                                                        <HeaderTemplate>
                                                                            <asp:CheckBox ID="chk_scelta" runat="server" CommandArgument="A" OnCheckedChanged="chk_scelta_CheckedChanged" AutoPostBack="true" />
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <asp:CheckBox ID="chk_scelta" runat="server" OnCheckedChanged="chk_scelta_CheckedChanged" AutoPostBack="true" />
                                                                        </ItemTemplate>
                                                                    </telerik:GridTemplateColumn>
                                                                    <telerik:GridBoundColumn SortExpression="st_codice_interno" UniqueName="st_codice_interno"
                                                                        HeaderText="Codice" DataField="st_codice_interno" HeaderStyle-Width="10%" AllowFiltering="true"
                                                                        ShowFilterIcon="false" ItemStyle-Wrap="false" />
                                                                    <telerik:GridBoundColumn UniqueName="st_denominazione" SortExpression="st_denominazione"
                                                                        HeaderStyle-Width="50%" HeaderText="Sito" DataField="st_denominazione"
                                                                        AllowFiltering="true" />
                                                                    <telerik:GridBoundColumn UniqueName="st_comune_desc" SortExpression="st_comune_desc"
                                                                        HeaderStyle-Width="30%" HeaderText="Comune" DataField="st_comune_desc"
                                                                        AllowFiltering="true" />
                                                                    <telerik:GridBoundColumn UniqueName="st_provincia_desc" SortExpression="st_provincia_desc"
                                                                        HeaderStyle-Width="15%" HeaderText="Prov." DataField="st_provincia_desc"
                                                                        AllowFiltering="true" />
                                                                    <telerik:GridBoundColumn UniqueName="sc_ragione_sociale" SortExpression="sc_ragione_sociale"
                                                                        HeaderStyle-Width="1%" HeaderText="sc_ragione_sociale" DataField="sc_ragione_sociale"
                                                                        AllowFiltering="true">
                                                                        <HeaderStyle CssClass="hidden" />
                                                                        <ItemStyle CssClass="hidden" />
                                                                    </telerik:GridBoundColumn>
                                                                </Columns>
                                                            </MasterTableView>
                                                        </telerik:RadGrid>
                                                    </div>
                                                </div>
                                                <div class="row" id="div_visibilita_societa" runat="server">
                                                    <div class="col-md-12">
                                                        <cc:rDropDown ID="ddl_societa_key" runat="server" Label="Società"
                                                            Placeholder="Seleziona..." Form_Vertical="true"  />
                                                    </div>
                                                </div>
                                                <div class="row" id="div_visibilita_gestione" runat="server">
                                                    <div class="col-md-12">
                                                        <cc:rDropDown ID="ddl_societa_gestione_key" runat="server" Label="Società di gestione"
                                                            Placeholder="Seleziona..." Form_Vertical="true"  />
                                                    </div>
                                                </div>
                                                <div class="form-actions right">
                                                    <asp:LinkButton ID="btn_registra_siti" runat="server" CssClass="btn btn-primary">
                                                        <i class="fa fa-check"></i> Salva
                                                    </asp:LinkButton>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <! --/row -->
                                </div>
                                <! --/tab-pane -->
                                <div id="div_funzioni" class="tab-pane" runat="server">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="form-body">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <cc:rDropDown ID="ddl_tab_profilo_key" runat="server" AutoPostBack="true" Label="Profilo Utente"
                                                            Placeholder="Seleziona..." Form_Vertical="true"  />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <h5>Funzioni</h5>
                                                        <asp:Repeater ID="rpt_funzioni_padre" runat="server" OnItemDataBound="rpt_funzioni_padre_ItemDataBound">
                                                            <HeaderTemplate>
                                                                <table class="table table-striped table-advance table-hover">
                                                                    <thead>
                                                                        <tr>
                                                                            <th style="width: 1%;"></th>
                                                                            <th style="width: 10%;">
                                                                                Numero
                                                                            </th>
                                                                            <th style="width: 20%;">
                                                                                Menu
                                                                            </th>
                                                                            <th style="width: 20%;">
                                                                                Gruppo Funzione
                                                                            </th>
                                                                            <th style="width: 10%;">
                                                                                Permesso
                                                                            </th>
                                                                            <th style="width: 50%;">
                                                                                Funzioni
                                                                            </th>
                                                                        </tr>
                                                                    </thead>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <tbody>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:CheckBox ID="chk_scelta" runat="server" AutoPostBack="true" OnCheckedChanged="chk_sceltaall_CheckedChanged" />
                                                                            <asp:Label ID="lbl_tab_funzione_key" runat="server" Visible="false"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="lbl_tf_ordinamento" runat="server"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="lbl_tf_livello" runat="server"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="lbl_tf_titolo" runat="server"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:DropDownList ID="ddl_RW" runat="server">
                                                                                <asp:ListItem Text="" Value="" Selected="True"></asp:ListItem>
                                                                                <asp:ListItem Text="Lettura" Value="R"></asp:ListItem>
                                                                                <asp:ListItem Text="Scrittura" Value="W"></asp:ListItem>
                                                                            </asp:DropDownList>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Repeater ID="rpt_funzioni_figlie" runat="server" OnItemDataBound="rpt_funzioni_figlie_ItemDataBound">
                                                                                <HeaderTemplate>
                                                                                    <table class="table table-striped table-advance table-hover">
                                                                                        <thead>
                                                                                            <tr>
                                                                                                <th style="width: 1%;">
                                                                                                </th>
                                                                                                <th style="width: 10%;">
                                                                                                    Numero
                                                                                                </th>
                                                                                                <th style="width: 70%;">
                                                                                                    Funzione
                                                                                                </th>
                                                                                                <th style="width: 20%;">
                                                                                                    Permesso
                                                                                                </th>
                                                                                            </tr>
                                                                                        </thead>
                                                                                </HeaderTemplate>
                                                                                <ItemTemplate>
                                                                                    <tbody>
                                                                                        <tr>
                                                                                            <td>
                                                                                                <asp:CheckBox ID="chk_scelta" runat="server" AutoPostBack="false" />
                                                                                                <asp:Label ID="lbl_tab_funzione_key" runat="server" Visible="false"></asp:Label>
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:Label ID="lbl_tf_ordinamento" runat="server"></asp:Label>
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:Label ID="lbl_tf_titolo" runat="server"></asp:Label>
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:DropDownList ID="ddl_RW" runat="server">
                                                                                                    <asp:ListItem Text="" Value="" Selected="True"></asp:ListItem>
                                                                                                    <asp:ListItem Text="Lettura" Value="R"></asp:ListItem>
                                                                                                    <asp:ListItem Text="Scrittura" Value="W"></asp:ListItem>
                                                                                                </asp:DropDownList>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </tbody>
                                                                                </ItemTemplate>
                                                                                <FooterTemplate>
                                                                                    </table>
                                                                                </FooterTemplate>
                                                                            </asp:Repeater>
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </ItemTemplate>
                                                            <FooterTemplate >
                                                                </table>
                                                            </FooterTemplate>
                                                        </asp:Repeater>
                                                    </div>
                                                </div>

                                                <div class="form-actions right">
                                                    <asp:LinkButton ID="btn_registra_funzioni" runat="server" CssClass="btn btn-primary">
                                                        <i class="fa fa-check"></i> Salva
                                                    </asp:LinkButton>
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
</asp:Content>

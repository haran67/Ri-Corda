<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Start/GisRI.Master"
    CodeBehind="Siti.aspx.vb" Inherits="GisRI_Web.Siti" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Src="../Controls/rTextBox.ascx" TagName="rTextBox" TagPrefix="cc" %>
<%@ Register Src="../Controls/rTextData.ascx" TagName="rTextData" TagPrefix="cc" %>
<%@ Register Src="../Controls/rTextNumero.ascx" TagName="rTextNumero" TagPrefix="cc" %>
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
            var masterTableView = $find("<%= RGSiti.ClientID %>").get_masterTableView();

            if (uniqueName == "st_tipologia_sito_desc") {
                masterTableView.filter(uniqueName, sender.options[sender.selectedIndex].text, "EqualTo");
            }
            else {
                if (uniqueName == "st_stato") {
                    masterTableView.filter(uniqueName, sender.options[sender.selectedIndex].text, "EqualTo");
                }
                else {
                    masterTableView.filter(uniqueName, sender.value, Telerik.Web.UI.GridFilterFunction.Contains);
                }
            }

        }

        function Init_Dirty() {
            $("#<%=div_overview.ClientID%>").dirtyForms();
            $("#<%=div_ditte.ClientID%>").dirtyForms();
            $("#<%=div_stati.ClientID%>").dirtyForms();
            $("#<%=div_dipendenti.ClientID%>").dirtyForms();
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
                                SITI PRODUZIONE RIFIUTI</h3>
                        </div>
                        <div class="gisri_button_right" id="div_nuovo" runat="server">
                            <asp:LinkButton ID="btn_nuovo" runat="server" ToolTip="Nuovo sito" CssClass="btn btn-primary"><i class="fa fa-plus"></i>&nbsp;&nbsp;Nuovo Sito</asp:LinkButton>
                        </div>
                    </div>
                </div>
                <div class="row" id="div_filtri" runat="server" visible="false">
                    <div class="form-body" style="margin-left: 30px!Important; margin-right: 35px!Important; margin-bottom:10px;">
                        <div class="row">
                            <div class="col-xs-3 gisri_row_filter">
                                <div class="input-group" style="width:100%">
                                    <div>
                                        <asp:TextBox ID="txt_filter_codice" runat="server" CssClass="form-control gisri_form_filter"
                                            placeholder="Codice" onChange="grid_search(this, event, 'st_codice_interno');" ></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-4 gisri_row_filter">
                                <div class="input-group" style="width:100%">
                                    <div>
                                        <asp:TextBox ID="txt_filter_denominazione" runat="server" CssClass="form-control gisri_form_filter"
                                            placeholder="Denominazione" onChange="grid_search(this, event, 'st_denominazione');" ></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-4 gisri_row_filter">
                                <div class="input-group" style="width:100%">
                                    <div>
                                        <asp:TextBox ID="txt_filter_citta" runat="server" CssClass="form-control gisri_form_filter"
                                            placeholder="Città" onChange="grid_search(this, event, 'st_comune_desc');" ></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-1 gisri_row_filter gisri_row_filter_right">
                            </div> 
                        </div> 
                        <div class="row" style="margin-top:10px;">
                            <div class="col-xs-6 gisri_row_filter">
                                <div class="input-group" style="width:100%">
                                    <div>
                                        <asp:DropDownList ID="ddl_filter_st_tipologia_sito_desc" runat="server" CssClass="form-control gisri_form_filter placeholder"
                                            onChange="grid_search(this, event, 'st_tipologia_sito_desc');" >
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-5 gisri_row_filter">
                                <div class="input-group" style="width:100%">
                                    <div>
                                        <asp:DropDownList ID="ddl_filter_stato" runat="server" CssClass="form-control gisri_form_filter placeholder"
                                            onChange="grid_search(this, event, 'st_stato');" >
                                            <asp:ListItem Text="Stato del sito" Value=""></asp:ListItem>
                                            <asp:ListItem Text="" Value=""></asp:ListItem>
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
                <telerik:RadGrid ID="RGSiti" AutoGenerateColumns="False" CssClass="" runat="server"
                    ShowFooter="false" AllowPaging="True" AllowSorting="True" GridLines="None" PageSize="25"
                    Width="100%" AllowMultiRowSelection="true" Skin="MyCustomSkin" EnableEmbeddedSkins="false"
                    AllowFilteringByColumn="true" Culture="it-IT">
                    <GroupingSettings CaseSensitive="false" />
                    <PagerStyle Mode="NextPrevAndNumeric" CssClass=""></PagerStyle>
                    <HeaderStyle CssClass=""></HeaderStyle>
                    <ItemStyle HorizontalAlign="Left"></ItemStyle>
                    <AlternatingItemStyle CssClass="" HorizontalAlign="Left"></AlternatingItemStyle>
                    <FilterItemStyle HorizontalAlign="Left" />
                    <MasterTableView ShowFooter="false" Width="100%" DataKeyNames="sito_key" AllowMultiColumnSorting="True">
                        <Columns>
                            <telerik:GridBoundColumn SortExpression="st_codice_interno" UniqueName="st_codice_interno"
                                HeaderText="Codice" DataField="st_codice_interno" HeaderStyle-Width="5%" AllowFiltering="true"
                                ShowFilterIcon="false" FilterControlWidth="50px" AutoPostBackOnFilter="true"
                                CurrentFilterFunction="Contains" ItemStyle-Wrap="false" />
                            <telerik:GridBoundColumn SortExpression="st_denominazione" UniqueName="st_denominazione"
                                HeaderText="Sito" DataField="st_denominazione" HeaderStyle-Width="30%" AllowFiltering="true"
                                ShowFilterIcon="false" FilterControlWidth="150px" AutoPostBackOnFilter="true"
                                CurrentFilterFunction="Contains" />
                            <telerik:GridBoundColumn SortExpression="st_tipologia_sito_desc" UniqueName="st_tipologia_sito_desc"
                                HeaderText="Tipologia" DataField="st_tipologia_sito_desc" HeaderStyle-Width="25%"
                                AllowFiltering="true" ShowFilterIcon="false" FilterControlWidth="100px" AutoPostBackOnFilter="true"
                                CurrentFilterFunction="EqualTo"
                                ItemStyle-CssClass="additionalColumn" HeaderStyle-CssClass="additionalColumn" >
                                <FilterTemplate>
                                    <asp:DropDownList ID="ddl_filter_st_tipologia_sito_desc" runat="server" CssClass="rgFilterBox"
                                        OnChange="st_tipologia_sito_desc_indexchanged(this)">
                                    </asp:DropDownList>
                                    <telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
                                        <script type="text/javascript">
                                            function st_tipologia_sito_desc_indexchanged(sender) {
                                                var tableView = $find("<%# TryCast(Container,GridItem).OwnerTableView.ClientID %>");
                                                //alert(sender.options[sender.selectedIndex].text);
                                                tableView.filter("st_tipologia_sito_desc", sender.options[sender.selectedIndex].text, "EqualTo");
                                            }
                                        </script>
                                    </telerik:RadScriptBlock>
                                </FilterTemplate>
                            </telerik:GridBoundColumn>
                            <telerik:GridTemplateColumn UniqueName="st_comune_desc" SortExpression="st_comune_desc"
                                InitializeTemplatesFirst="false" HeaderStyle-Width="35%" HeaderText="Indirizzo"
                                AllowFiltering="true" ShowFilterIcon="false" DataField="st_comune_desc" FilterControlWidth="150px"
                                AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                                ItemStyle-CssClass="additionalColumn" HeaderStyle-CssClass="additionalColumn" >
                                <ItemTemplate>
                                    <asp:Label ID="lblst_indirizzo" runat="server"></asp:Label>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="st_stato" SortExpression="st_stato" InitializeTemplatesFirst="false"
                                HeaderStyle-Width="5%" HeaderText="Stato" AllowFiltering="true" ShowFilterIcon="false"
                                DataField="st_stato" FilterControlWidth="150px" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains">
                                <ItemTemplate>
                                    <asp:Label ID="lblst_stato" runat="server" Style="width: 100%; height: 100%;">
                                        <span class="label label-sito-acquisito label-full-width">ACQUISITO</span>
                                    </asp:Label>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="TemplateColumnGo" SortExpression="" InitializeTemplatesFirst="false"
                                HeaderStyle-Width="1%" AllowFiltering="false">
                                <ItemStyle Wrap="false" HorizontalAlign="Right" />
                                <ItemTemplate>
                                    <asp:LinkButton ID="btn_home" runat="server" CssClass="btn btn-success btn-xs button-link-w"
                                        CommandName="HOME">
                                                <i class=" fa fa-home"></i>&nbsp;HOME</i>
                                    </asp:LinkButton>
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
            <!-- /content-panel -->
            <div class="content-panel" id="panel_dati" runat="server" style="display: none;">
                <div class="gisri_panel_title">
                    <div class="gisri_title_left">
                        <h3 style="padding-left: 10px; margin-top: 0px!Important;">
                            <i class="fa fa-angle-right"></i>DETTAGLIO SITO: <asp:Literal ID="ltl_st_denominazione" runat="server" /></h3>
                    </div>
                    <div class="gisri_button_right" idid="div_ritorno" runat="server">
                        <asp:LinkButton ID="btn_return" runat="server" ToolTip="Torna all'elenco" CssClass="btn btn-warning"><i class="fa fa-angle-left"></i>&nbsp;&nbsp;Elenco</asp:LinkButton>
                    </div>
                </div>
                <div style="margin: 10px; padding-top:30px;">
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
                                <li id="li_mappa" runat="server"><a data-toggle="tab" href="#<%=div_mappa.ClientID%>"
                                    class="tab-font" onclick="$('#iMappa').attr('src', '../Mappe/MappaRicerca.aspx');">Mappa</a> </li>
                                <li id="li_stati" runat="server"><a data-toggle="tab" href="#<%=div_stati.ClientID%>"
                                    class="tab-font">Stati</a> </li>
                                <li id="li_role" runat="server"><a data-toggle="tab" href="#<%=div_ditte.ClientID%>"
                                    class="tab-font">Ditte operatrici</a> </li>
                                <li id="li_dipendenti" runat="server"><a data-toggle="tab" href="#<%=div_dipendenti.ClientID%>"
                                    class="tab-font">Titolarità</a> </li>
                            </ul>
                        </div>
                        <! --/panel-heading -->
                        <div class="panel-body">
                            <div class="tab-content">
                                <div id="div_overview" class="tab-pane" runat="server">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="form-body" style="margin-left: 10px!Important; margin-right: 30px!Important;">
                                                <h6><asp:Label ID="ltl_ultima_modifica" runat="server"></asp:Label></h6>
                                                <div class="row" id="div_societa_gestione" runat="server">
                                                    <div class="col-md-12">
                                                        <cc:rDropDown ID="ddl_st_societa_gestione_key" runat="server" AutoPostBack="true"
                                                            Label="Società di gestione" Placeholder="Seleziona..." Form_Vertical="true" 
                                                            Required="true" Required_Help="Società di gestione obbligatoria!" />
                                                    </div>
                                                </div>
                                                <div class="row" id="div_societa" runat="server">
                                                    <div class="col-md-12">
                                                        <cc:rDropDown ID="ddl_st_societa_key" runat="server" AutoPostBack="false" Label="Società proprietaria"
                                                            Placeholder="Seleziona..." Form_Vertical="true" 
                                                            Required="true" Required_Help="Società titolare obbligatoria!" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <cc:rTextBox ID="txt_st_denominazione" runat="server" MaxLength="256" AutoPostBack="false"
                                                            Label="Denominazione" Icon="" Form_Vertical="true" Required="true" Required_Help="Denominazione del sito obbligatoria!" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <cc:rTextBox ID="txt_st_codice_interno" runat="server" MaxLength="32" AutoPostBack="false"
                                                            Label="Codice Sito" Icon="" Form_Vertical="true" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <cc:rDropDown ID="ddl_st_tipologia_sito_key" runat="server" AutoPostBack="false" Label="Tipologia"
                                                            Placeholder="Seleziona..." Form_Vertical="true" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <cc:rCheckBox ID="chk_st_stato_estero" runat="server" Values="S|" Classes="make-switch|SI|NO||"
                                                            Label="Indirizzo Estero" AutoPostBack="true" Checked="false" Form_Vertical="true" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <cc:rDropDown ID="ddl_st_provincia_cod" runat="server" AutoPostBack="true" Label="Provincia"
                                                            Placeholder="Seleziona..." Form_Vertical="true" />
                                                        <cc:rTextBox ID="txt_st_provincia_desc" runat="server" MaxLength="40" Label="Stato Estero"
                                                            Visible="false" Form_Vertical="true" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <cc:rDropDown ID="ddl_st_comune_cod" runat="server" AutoPostBack="true" Label="Citt&agrave;"
                                                            Placeholder="Seleziona..." Form_Vertical="true" />
                                                        <cc:rTextBox ID="txt_st_comune_desc" runat="server" MaxLength="40" Label="Comune Estero"
                                                            Visible="false" Form_Vertical="true" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <cc:rTextBox ID="txt_st_cap" runat="server" MaxLength="5" Label="Cap" Form_Vertical="true" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <cc:rTextBox ID="txt_st_localita" runat="server" MaxLength="40" AutoPostBack="false"
                                                            Label="Localita" Icon="" Form_Vertical="true" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <cc:rTextBox ID="txt_st_indirizzo" runat="server" MaxLength="60" AutoPostBack="false"
                                                            Label="Indirizzo" Icon="" Form_Vertical="true" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <cc:rTextBox ID="txt_st_telefono" runat="server" MaxLength="16" AutoPostBack="false"
                                                            Label="Telefono" Icon="" Form_Vertical="true" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <cc:rTextBox ID="txt_st_email" runat="server" MaxLength="60" AutoPostBack="false"
                                                            Label="Mail Riferimento" Icon="fa fa-envelope" Form_Vertical="true" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <cc:rTextNumero ID="txt_st_baricentro_n" runat="server" MaxLength="40" AutoPostBack="false"
                                                            Label="Coordinata N." Icon="" CifreDecimali="10" Form_Vertical="true" Read_Only="true" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <cc:rTextNumero ID="txt_st_baricentro_e" runat="server" MaxLength="60" AutoPostBack="false"
                                                            Label="Coordinata E." Icon="" CifreDecimali="10" Form_Vertical="true" Read_Only="true" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <cc:rTextData ID="txt_st_presa_carico_data" runat="server" MaxLength="10" AutoPostBack="false"
                                                            Label="Preso in carico" Icon="fa fa-calendar" Form_Vertical="true" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <cc:rTextData ID="txt_st_data_fine_pertinenza" runat="server" MaxLength="10" AutoPostBack="false"
                                                            Label="Data fine pertinenza" Icon="fa fa-calendar" Form_Vertical="true" />
                                                    </div>
                                                </div>
                                                <div class="form-actions right">
                                                    <asp:LinkButton ID="btn_registra" runat="server" CssClass="btn btn-primary ">
                                                            <i class="fa fa-check"></i> Salva
                                                    </asp:LinkButton>
                                                    <asp:LinkButton ID="btn_salva_e_nuovo" runat="server" CssClass="btn btn-primary ">
                                                            <i class="fa fa-plus"></i>&nbsp;&nbsp;Salva e Nuovo
                                                    </asp:LinkButton>
                                                    <asp:LinkButton ID="btn_cancella" runat="server" CssClass="btn btn-danger ">
                                                            <i class="fa fa-trash-o"></i> Cancella
                                                    </asp:LinkButton>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <! --/OVERVIEW -->
                                </div>
                                <! --/tab-pane -->
                                <div id="div_stati" class="tab-pane" runat="server">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="">
                                                <div class="form-body" style="margin-left: 10px!Important; margin-right: 30px!Important;">
                                                    <table class="table table-striped table-advance table-hover">
                                                        <thead>
                                                            <tr>
                                                                <th style="width: 1%;">
                                                                </th>
                                                                <th style="width: 20%;">
                                                                    Stato
                                                                </th>
                                                                <th style="width: 10%;">
                                                                    Da Data
                                                                </th>
                                                                <th style="width: 10%;">
                                                                    A Data
                                                                </th>
                                                                <th style="width: 60%;">
                                                                    Note
                                                                </th>
                                                                <th style="width: 1%;">
                                                                </th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <asp:Repeater ID="rpt_sito_stati" runat="server">
                                                                <ItemTemplate>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Label ID="lbl_st_stato" runat="server" Style="width: 10px; height: 10px;">
                                                                            </asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="lbl_st_stati_sito_desc" runat="server"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="lbl_st_da_data" runat="server"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="lbl_st_a_data" runat="server"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="lbl_st_note" runat="server"></asp:Label>
                                                                        </td>
                                                                        <td style="white-space: nowrap;">
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
                                                    <div class="form-body" style="margin-left: 10px!Important; margin-right: 30px!Important;">
                                                        <div id="div_modifica_stati" runat="server">
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <hr />
                                                                </div> 
                                                            </div> 
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <cc:rDropDown ID="ddl_st_stati_sito_cod" runat="server" AutoPostBack="false" Label="Stato del sito"
                                                                        Placeholder="Seleziona..." Form_Vertical="true" Required="true" Required_Help="Stato del sito obbligatorio!" />
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <cc:rTextData ID="txt_stato_st_da_data" runat="server" MaxLength="10" AutoPostBack="false"
                                                                        Label="Dalla data" Icon="fa fa-calendar" Form_Vertical="true" Required="true" Required_Help="Data obbligatoria!" />
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <cc:rTextBox ID="txt_stato_st_note" runat="server" MaxLength="4000" AutoPostBack="false"
                                                                        Label="Note" textmode="MultiLine" Rows="2" Form_Vertical="true" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div> 
                                                <div class="form-actions right">
                                                    <asp:LinkButton ID="btn_registra_stati" runat="server" CssClass="btn btn-primary">
                                                            <i class="fa fa-check"></i> Salva
                                                    </asp:LinkButton>
                                                    <asp:LinkButton ID="btn_nuovo_stato" runat="server" CssClass="btn btn-primary">
                                                            <i class="fa fa-plus"></i> Aggiungi
                                                    </asp:LinkButton>
                                                </div>
                                                <asp:Label ID="lbl_sito_stati_key" runat="server" Visible="false"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="div_ditte" class="tab-pane" runat="server">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="form-horizontal">
                                                <div class="form-body" style="margin-left: 10px!Important; margin-right: 30px!Important;">
                                                    <table class="table table-striped table-advance table-hover">
                                                        <thead>
                                                            <tr>
                                                                <th style="width: 50%;">
                                                                    Ditta
                                                                </th>
                                                                <th style="width: 20%;">
                                                                    Da Data
                                                                </th>
                                                                <th style="width: 20%;">
                                                                    A Data
                                                                </th>
                                                                <th style="width: 9%;">
                                                                    Subappalto
                                                                </th>
                                                                <th style="width: 1%;">
                                                                </th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <asp:Repeater ID="rpt_titolarita_ditte" runat="server">
                                                                <ItemTemplate>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Label ID="lbl_st_ditta_desc" runat="server"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="lbl_st_da_data" runat="server"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="lbl_st_a_data" runat="server"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="lbl_st_subappalto" runat="server"></asp:Label>
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
                                                <div class="form-body" style="margin-left: 10px!Important; margin-right: 30px!Important;">
                                                    <div id="div_titolarita" runat="server">
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <hr />
                                                            </div> 
                                                        </div> 
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <cc:rDropDown ID="ddl_st_ditta_key" runat="server" AutoPostBack="true" Label="Ditta operatrice"
                                                                    Placeholder="Seleziona..." Required="true" Required_Help="Ditta operatrice obbligatoria!" />
                                                            </div>
                                                            <div class="col-md-6">
                                                                <cc:rCheckBox ID="chk_st_subappalto" runat="server" Values="S|" Classes="make-switch|SI|NO|warning|"
                                                                    Label="In Subappalto" AutoPostBack="false" Checked="false" />
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <cc:rTextData ID="txt_st_da_data" runat="server" MaxLength="10" AutoPostBack="false"
                                                                    Label="Da data" Icon="fa fa-calendar" />
                                                            </div>
                                                            <div class="col-md-6">
                                                                <cc:rTextData ID="txt_st_a_data" runat="server" MaxLength="10" AutoPostBack="false"
                                                                    Label="A data" Icon="fa fa-calendar" />
                                                            </div>
                                                        </div>
                                                        <asp:Repeater ID="rpt_tab_tipologia_ditta" runat="server" Visible="false">
                                                            <HeaderTemplate>
                                                                <div class="row">
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <div class="col-lg-6">
                                                                    <cc:rCheckBox ID="chk_tab_tipologia_ditta" runat="server" Values="S|" Classes="make-switch|SI|NO|success|"
                                                                        Label="" Checked="false" />
                                                                    <asp:Label ID="tab_tipologia_ditta_cod" runat="server" Visible="false"></asp:Label>
                                                                </div>
                                                                <asp:Literal ID="ltl_div_separator" runat="server"></asp:Literal>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                </div>
                                                            </FooterTemplate>
                                                        </asp:Repeater>
                                                        <asp:Label ID="lbl_sito_titolarita_ditte_key" runat="server" Visible="false"></asp:Label>
                                                    </div>
                                                </div>
                                                <div class="form-actions right">
                                                    <asp:LinkButton ID="btn_registra_titolarita" runat="server" CssClass="btn btn-primary">
                                                            <i class="fa fa-check"></i> Salva
                                                    </asp:LinkButton>
                                                    <asp:LinkButton ID="btn_nuova_titolarita" runat="server" CssClass="btn btn-primary">
                                                            <i class="fa fa-plus"></i> Aggiungi
                                                    </asp:LinkButton>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="div_dipendenti" class="tab-pane" runat="server">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="form-horizontal">
                                                <div class="form-body" style="margin-left: 10px!Important; margin-right: 30px!Important;">
                                                    <table class="table table-striped table-advance table-hover">
                                                        <thead>
                                                            <tr>
                                                                <th style="width: 30%;">
                                                                    Dipendente
                                                                </th>
                                                                <th style="width: 30%;">
                                                                    Di
                                                                </th>
                                                                <th style="width: 20%;">
                                                                    Ruolo
                                                                </th>
                                                                <th style="width: 10%;">
                                                                    Da Data
                                                                </th>
                                                                <th style="width: 10%;">
                                                                    A Data
                                                                </th>
                                                                <th style="width: 1%;">
                                                                </th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <asp:Repeater ID="rpt_titolarita_dipendenti" runat="server">
                                                                <ItemTemplate>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Label ID="lbl_st_dipendente_desc" runat="server"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="lbl_st_societa" runat="server"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="lbl_st_ruolo_aziendale_desc" runat="server"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="lbl_st_da_data" runat="server"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="lbl_st_a_data" runat="server"></asp:Label>
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
                                                <div class="form-body" style="margin-left: 10px!Important; margin-right: 30px!Important;">
                                                    <div id="div_titolarita_dipendenti" runat="server">
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <hr />
                                                            </div> 
                                                        </div> 
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <cc:rRadioButton ID="rdb_scelta_societa" runat="server" GroupName="rdb_scelta_societa"
                                                                    AutoPostBack="true" Values="S|Societa,D|Ditta" Label="Dipendente della" />
                                                            </div>
                                                            <div class="col-md-6">
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <cc:rDropDown ID="ddl_st_dipendente_key" runat="server" AutoPostBack="true" Label="Personale"
                                                                    Placeholder="Seleziona..." Required="true" Required_Help="Dipendente non selezionato" />
                                                            </div>
                                                            <div class="col-md-6">
                                                                <cc:rDropDown ID="ddl_st_ruolo_aziendale_cod" runat="server" AutoPostBack="false"
                                                                    Label="Ruolo Ricoperto" Placeholder="Seleziona..." Required="true" Required_Help="Ruolo del dipendente non selezionato!" />
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <cc:rTextData ID="txt_st_da_data_dip" runat="server" MaxLength="10" AutoPostBack="false"
                                                                    Label="Da data" Icon="fa fa-calendar" />
                                                            </div>
                                                            <div class="col-md-6">
                                                                <cc:rTextData ID="txt_st_aa_data_dip" runat="server" MaxLength="10" AutoPostBack="false"
                                                                    Label="A data" Icon="fa fa-calendar" />
                                                            </div>
                                                        </div>
                                                        <asp:Label ID="lbl_sito_titolarita_key" runat="server" Visible="false"></asp:Label>
                                                    </div>
                                                </div>
                                                <div class="form-actions right">
                                                    <asp:LinkButton ID="btn_registra_titolarita_dip" runat="server" CssClass="btn btn-primary">
                                                            <i class="fa fa-check"></i> Salva
                                                    </asp:LinkButton>
                                                    <asp:LinkButton ID="btn_nuova_titolarita_dip" runat="server" CssClass="btn btn-primary">
                                                            <i class="fa fa-plus"></i> Aggiungi
                                                    </asp:LinkButton>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="div_mappa" class="tab-pane" runat="server">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div style="margin-left: 10px!Important; margin-right: 10px!Important;">
                                                <div class="col-lg-12">
                                                    <iframe id="iMappa" frameborder="0" width="100%" height="730" src=""></iframe>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-9">
                                            <div style="margin-left: 10px!Important;">
                                                <asp:TextBox ID="txt_google_address" runat="server" MaxLength="256" AutoPostBack="false" 
                                                CssClass="form-control" placeholder="Inserisci l'indirizzo per la ricerca su Google Maps"/>
                                            </div>
                                        </div>
                                        <div class="col-lg-3">
                                            <div style="margin-right: 10px!Important; text-align:right;">
                                                <asp:LinkButton ID="btn_google_address" runat="server" ToolTip="" CssClass="btn btn-default"><i class="fa fa-map-marker"></i>&nbsp;&nbsp;Ricalcola coordinate</asp:LinkButton>
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
    <asp:LinkButton ID="btn_position" runat="server" style="display:none;" />
    <!-- /row -->
    <script type="text/javascript">
        function setPosition(lat, lon) {
            $('#<%=txt_st_baricentro_n.txt_Client_Id%>').val(lat);
            $('#<%=txt_st_baricentro_e.txt_Client_Id%>').val(lon);
            PageMethods.SalvaCoordinateSito(lat, lon, SPMSuccess, PMFailure);
        }

        function SPMSuccess() {
            javascript: __doPostBack('<%=btn_position.UniqueID%>', '');
        }

    </script>
</asp:Content>

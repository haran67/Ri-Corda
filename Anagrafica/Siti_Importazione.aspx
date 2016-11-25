<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Start/GisRI.Master"
    CodeBehind="Siti_Importazione.aspx.vb" Inherits="GisRI_Web.Siti_Importazione" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Src="../Controls/rDropDown.ascx" TagName="rDropDown" TagPrefix="cc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">

        function grid_search(sender, eventArgs, uniqueName) {
            eventArgs.cancelBubble = true;
            eventArgs.returnValue = false;
            if (eventArgs.stopPropagation) {
                eventArgs.stopPropagation();
                eventArgs.preventDefault();
            }
            var masterTableView = $find("<%= RGSitiGisco.ClientID %>").get_masterTableView();

            if (uniqueName == "az_stato_esterno") {
                masterTableView.filter(uniqueName, sender.options[sender.selectedIndex].text, "EqualTo");
            }
            else {
                masterTableView.filter(uniqueName, sender.value, Telerik.Web.UI.GridFilterFunction.Contains);
            }

        }

    </script>
    <style>@media (max-width: 768px) { .btn {width: 100% !important;}}</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body_up" runat="server">
    <div class="row mt">
        <div class="col-md-12">
            <div class="content-panel" id="panel_elenco" runat="server" visible="true" style="padding-left: 10px!Important;
                padding-top: 0px!Important; margin-bottom: 10px;">
                <div class="row" style="min-height: 50px!Important;">
                    <div class="gisri_panel_title gisri_title_margin clearfix">
                        <div class="gisri_title_left">
                            <asp:LinkButton ID="btn_filtri" runat="server" CssClass="btn btn-default" ToolTip="Visualizza maschera dei filtri"
                                Style="padding-top: 6px; padding-left: 10px;">
                                <i class="fa fa-filter"></i>
                            </asp:LinkButton>
                        </div>
                        <div class="gisri_title_left">
                            <h3 style="padding-left: 10px; margin-top: 0px!Important;">
                                SITI GISCO</h3>
                        </div>
                        <div class="gisri_button_right" id="div_nuovo" runat="server">
                        </div>
                    </div>
                </div>
                <div class="row" id="div_filtri" runat="server" visible="false">
                    <div class="form-body" style="margin-left: 30px!Important; margin-right: 30px!Important;
                        margin-bottom: 10px;">
                        <div class="row">
                            <div class="col-xs-2 gisri_row_filter">
                                <div class="input-group" style="width: 100%">
                                    <div>
                                        <asp:TextBox ID="txt_filter_codice" runat="server" CssClass="form-control gisri_form_filter"
                                            placeholder="Codice" onChange="grid_search(this, event, 'az_codice_interno');"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-3 gisri_row_filter">
                                <div class="input-group" style="width: 100%">
                                    <div>
                                        <asp:TextBox ID="txt_filter_denominazione" runat="server" CssClass="form-control gisri_form_filter"
                                            placeholder="Denominazione" onChange="grid_search(this, event, 'az_ragione_sociale');"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-3 gisri_row_filter">
                                <div class="input-group" style="width: 100%">
                                    <div>
                                        <asp:TextBox ID="txt_filter_citta" runat="server" CssClass="form-control gisri_form_filter"
                                            placeholder="Città" onChange="grid_search(this, event, 'az_comune');"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-3 gisri_row_filter">
                                <div class="input-group" style="width: 100%">
                                    <div>
                                        <asp:DropDownList ID="ddl_filter_stato" runat="server" CssClass="form-control gisri_form_filter placeholder"
                                            onChange="grid_search(this, event, 'az_stato_esterno');">
                                            <asp:ListItem Text="Stato del sito" Value=""></asp:ListItem>
                                            <asp:ListItem Text="Importato" Value="importato"></asp:ListItem>
                                            <asp:ListItem Text="Da importare" Value="da importare"></asp:ListItem>
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
                <div class="form-body" style="margin-left: 10px!Important; margin-right: 30px!Important;">
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
                    <h6>
                        <asp:Label ID="ltl_ultima_modifica" runat="server"></asp:Label></h6>
                    <div class="row" id="div_societa_gestione" runat="server">
                        <div class="col-md-12">
                            <cc:rdropdown id="ddl_st_societa_gestione_key" runat="server" autopostback="true"
                                label="Società di gestione" placeholder="Seleziona..." form_vertical="true" />
                        </div>
                    </div>
                    <div class="row" id="div_societa" runat="server">
                        <div class="col-md-12">
                            <cc:rdropdown id="ddl_st_societa_key" runat="server" autopostback="true" label="Società proprietaria"
                                placeholder="Seleziona..." form_vertical="true" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                        <telerik:RadGrid ID="RGSitiGisco" AutoGenerateColumns="False" CssClass="" runat="server"
                            ShowFooter="false" AllowPaging="True" AllowSorting="True" GridLines="None" PageSize="25"
                            Width="100%" AllowMultiRowSelection="true" Skin="MyCustomSkin" EnableEmbeddedSkins="false"
                            AllowFilteringByColumn="true" Culture="it-IT">
                            <GroupingSettings CaseSensitive="false" />
                            <PagerStyle Mode="NextPrevAndNumeric" CssClass=""></PagerStyle>
                            <HeaderStyle CssClass=""></HeaderStyle>
                            <ItemStyle HorizontalAlign="Left"></ItemStyle>
                            <AlternatingItemStyle CssClass="" HorizontalAlign="Left"></AlternatingItemStyle>
                            <FilterItemStyle HorizontalAlign="Left" />
                            <MasterTableView ShowFooter="false" Width="100%" DataKeyNames="azienda_key" AllowMultiColumnSorting="True">
                                <Columns>
                                    <telerik:GridBoundColumn SortExpression="az_codice_interno" UniqueName="az_codice_interno"
                                        HeaderText="Codice" DataField="az_codice_interno" HeaderStyle-Width="5%" AllowFiltering="true"
                                        ShowFilterIcon="false" FilterControlWidth="50px" AutoPostBackOnFilter="true"
                                        CurrentFilterFunction="Contains" ItemStyle-Wrap="false" />
                                    <telerik:GridBoundColumn SortExpression="az_ragione_sociale" UniqueName="az_ragione_sociale"
                                        HeaderText="Sito" DataField="az_ragione_sociale" HeaderStyle-Width="30%" AllowFiltering="true"
                                        ShowFilterIcon="false" FilterControlWidth="150px" AutoPostBackOnFilter="true"
                                        CurrentFilterFunction="Contains" />
                                    <telerik:GridBoundColumn SortExpression="tab_tipologia_sito_desc" UniqueName="tab_tipologia_sito_desc"
                                        HeaderText="Tipologia" DataField="tab_tipologia_sito_desc" HeaderStyle-Width="25%"
                                        AllowFiltering="false" ItemStyle-CssClass="additionalColumn" HeaderStyle-CssClass="additionalColumn">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridTemplateColumn UniqueName="az_comune" SortExpression="az_comune" InitializeTemplatesFirst="false"
                                        HeaderStyle-Width="35%" HeaderText="Indirizzo" AllowFiltering="true" ShowFilterIcon="false"
                                        DataField="az_comune" FilterControlWidth="150px" AutoPostBackOnFilter="true"
                                        CurrentFilterFunction="Contains" ItemStyle-CssClass="additionalColumn" HeaderStyle-CssClass="additionalColumn">
                                        <ItemTemplate>
                                            <asp:Label ID="lblaz_indirizzo" runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="az_stato_esterno" SortExpression="az_stato_esterno"
                                        InitializeTemplatesFirst="false" HeaderStyle-Width="5%" HeaderText="Stato" AllowFiltering="true"
                                        ShowFilterIcon="false" DataField="az_stato_esterno" FilterControlWidth="150px"
                                        AutoPostBackOnFilter="true" CurrentFilterFunction="Contains">
                                        <ItemTemplate>
                                            <asp:Label ID="lblaz_stato" runat="server" Style="width: 100%; height: 100%;">
                                        <span class="label label-sito-acquisito label-full-width">IMPORTATO</span>
                                            </asp:Label>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="TemplateColumnGo" SortExpression="" InitializeTemplatesFirst="false"
                                        HeaderStyle-Width="1%" AllowFiltering="false">
                                        <ItemStyle Wrap="false" HorizontalAlign="Right" />
                                        <ItemTemplate>
                                            <asp:LinkButton ID="btn_scheda" runat="server" CssClass="btn btn-primary btn-xs button-link-w"
                                                CommandName="IMPORTA">
                                                <i class=" fa fa-edit"></i>&nbsp;IMPORTA
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
                </div>
            </div>
            <!-- /col-md-12 -->
        </div>
    <!-- /row -->
</asp:Content>

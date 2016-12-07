<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Start/GisRI.Master"
    CodeBehind="Home.aspx.vb" Inherits="GisRI_Web.Home" EnableEventValidation="false" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
    <script type="text/javascript">

        // The latitude and longitude of italy
        var position = [<%=map_Position%>];
        var allMarkers = [];
        var allInfo = [];
        var geocoder;

        function showGoogleMaps() {

            var latLng = new google.maps.LatLng(position[0], position[1]);

            var mapOptions = {
                zoom: <%=map_Zoom%>, // initialize zoom level - the max value is 21
                streetViewControl: true, // hide the yellow Street View pegman
                zoomControl: true, // allow users to zoom the Google Map
                zoomControlOptions: {
                    style: google.maps.ZoomControlStyle.SMALL
                },
                mapTypeId: google.maps.MapTypeId.TERRAIN,
                center: latLng
            };

            map = new google.maps.Map(document.getElementById('googlemaps'), mapOptions);

            <%=GetMarkers()%>

            geocoder = new google.maps.Geocoder();

        }

        function directOpenMarker(){
            NuovoCantiere('', '', '', 0, 0, null);
            openModal('#myModalCantiere');
        }

        google.maps.event.addDomListener(window, 'load', showGoogleMaps);


        function RowDblClick(sender, eventArgs) {
            var ClikedDataKey = eventArgs._dataKeyValues.sito_key;
            var grid = $find('<%= RGSiti.ClientID %>');
            var masterTable = grid.get_masterTableView();
            var Rows = masterTable.get_dataItems();
            for (var i = 0; i < Rows.length; i++) {
                var row = Rows[i];
                if (ClikedDataKey != null && ClikedDataKey == row.getDataKeyValue("sito_key")) {
                    var button = row.findElement("btn_st_denominazione");
                    button.click();
                }
            }
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

        function Init_ToolTips() {
            $('[data-toggle="tooltip"]').tooltip();
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <asp:LinkButton ID="btn_scheda" runat="server" CommandName="SCHEDA" style="display:;"></asp:LinkButton>
    <div style="height:10px;">
    </div>
    <div class="row">
        <div class="col-lg-6 col-lg-6-home">
            <div class="content-panel" style="padding:10px!Important;">
                <div style="width:100%;">
                    <asp:UpdatePanel ID="upd_filtri" runat="server">
                        <ContentTemplate>
                            <div class="row" style="min-height:30px!Important;">
                                <div class="gisri_title_margin_lr">
                                    <div class="gisri_button_left">
                                        <asp:LinkButton ID="btn_filtri" runat="server" CssClass="btn btn-default btn-xs gisri_button_ws"
                                            ToolTip="Visualizza i filtri" Height="25" Style="padding-top:6px; padding-left:1px;">
                                            <i class="fa fa-filter"></i>
                                        </asp:LinkButton>
                                    </div>
                                    <div class="gisri_button_left">
                                        <asp:LinkButton ID="btn_legenda" runat="server" CssClass="btn btn-default btn-xs gisri_button_ws"
                                            ToolTip="Visualizza la legenda" Height="25" Style="padding-top:6px; padding-left:1px;">
                                            <i class="fa fa-question"></i>
                                        </asp:LinkButton>
                                    </div>
                                    <div class="gisri_title_left" style="font-size:14px;">
                                        ELENCO DEI SITI ACQUISITI ED IN ATTIVITA'
                                    </div>
                                </div>
                            </div>
                            <div class="row" id="div_legenda" runat="server" visible="false">
                                <div class="form-body" style="margin-left: 17px!Important; margin-right: 17px!Important;">
                                    <div class="row" style="margin-bottom:5px; white-space:nowrap;">
                                        <div class="col-xs-12">
                                            <b>
                                                Funzionalità sulla mappa
                                            </b>
                                        </div>
                                    </div>
                                    <div class="row" style="margin-bottom:5px;">
                                        <div class="col-xs-12" >
                                            <div class="input-group" style="width:100%">
                                                <asp:Label ID="lbl_mappa" runat="server" CssClass="btn btn-default btn-xs gisri_button_ws"
                                                    Style="cursor:default;" Height="25">
                                                    <i class="fa fa-map-marker"></i>&nbsp;
                                                </asp:Label>
                                                &nbsp;Permette lo zoom sulla mappa del sito selezionato
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row" style="margin-bottom:5px; white-space:nowrap;">
                                        <div class="col-xs-12">
                                            <b>
                                                Stati che i siti possono acquisire
                                            </b>
                                        </div>
                                    </div>
                                    <div class="row" style="margin-bottom:5px; white-space:nowrap;">
                                        <div class="col-xs-6">
                                            <div class="input-group" style="width:100%">
                                                <asp:Label ID="Label1" runat="server" CssClass="btn btn-xs button-link-w label-sito-acquisito"
                                                    Style="cursor:default; margin-right:1px;" Height="25" Width="25">
                                                    <i class="fa fa-flag"></i>&nbsp;
                                                </asp:Label>
                                                &nbsp;Sito acquisito
                                            </div>
                                        </div>
                                        <div class="col-xs-6 gisri_row_filter">
                                            <div class="input-group" style="width:100%">
                                                <asp:Label ID="Label2" runat="server" CssClass="btn btn-xs button-link-w label-sito-decommisioning"
                                                    Style="cursor:default; margin-right:1px; padding-top:2px;" Height="25" Width="25">
                                                    <i class="fa fa-flag"></i>&nbsp;
                                                </asp:Label>
                                                &nbsp;Sito in decommissioning
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row" style="margin-bottom:5px; white-space:nowrap;">
                                        <div class="col-xs-6">
                                            <div class="input-group" style="width:100%">
                                                <asp:Label ID="Label3" runat="server" CssClass="btn btn-xs button-link-w label-sito-manutanzione"
                                                    Style="cursor:default; margin-right:1px;" Height="25" Width="25">
                                                    <i class="fa fa-flag"></i>&nbsp;
                                                </asp:Label>
                                                &nbsp;Sito in mantenimento
                                            </div>
                                        </div>
                                        <div class="col-xs-6 gisri_row_filter">
                                            <div class="input-group" style="width:100%">
                                                <asp:Label ID="Label4" runat="server" CssClass="btn btn-xs button-link-w label-sito-alienato"
                                                    Style="cursor:default; margin-right:1px;" Height="25" Width="25">
                                                    <i class="fa fa-flag"></i>&nbsp;
                                                </asp:Label>
                                                &nbsp;Sito alienato
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row" style="margin-bottom:5px; white-space:nowrap;">
                                        <div class="col-xs-12">
                                            <b>
                                                Stati dei depositi temporanei della società titolare
                                            </b>
                                        </div>
                                    </div>
                                    <div class="row" style="margin-bottom:5px; white-space:nowrap;">
                                        <div class="col-xs-4">
                                            <div class="input-group" style="width:100%">
                                                <asp:Label ID="Label5" runat="server" CssClass="btn btn-xs button-link-w label-sito-aperto"
                                                    Style="cursor:default; margin-right:1px;" Height="25">
                                                    <i class="fa fa-user"></i>&nbsp;
                                                </asp:Label>
                                                &nbsp;DT Vuoto
                                            </div>
                                        </div>
                                        <div class="col-xs-4 gisri_row_filter">
                                            <div class="input-group" style="width:100%">
                                                <asp:Label ID="Label6" runat="server" CssClass="btn btn-xs button-link-w label-sito-attivo"
                                                    Style="cursor:default; margin-right:1px;" Height="25">
                                                    <i class="fa fa-user"></i>&nbsp;
                                                </asp:Label>
                                                &nbsp;DT < 1 mese
                                            </div>
                                        </div>
                                        <div class="col-xs-4 gisri_row_filter">
                                            <div class="input-group" style="width:100%">
                                                <asp:Label ID="Label7" runat="server" CssClass="btn btn-xs button-link-w label-sito-lavorazione"
                                                    Style="cursor:default; margin-right:1px;" Height="25">
                                                    <i class="fa fa-user"></i>&nbsp;
                                                </asp:Label>
                                                &nbsp;DT < 2 mesi
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row" style="margin-bottom:5px; white-space:nowrap;">
                                        <div class="col-xs-4">
                                            <div class="input-group" style="width:100%">
                                                <asp:Label ID="Label8" runat="server" CssClass="btn btn-xs button-link-w label-sito-inscadenza"
                                                    Style="cursor:default; margin-right:1px;" Height="25">
                                                    <i class="fa fa-user"></i>&nbsp;
                                                </asp:Label>
                                                &nbsp;DT < 3 mesi
                                            </div>
                                        </div>
                                        <div class="col-xs-4 gisri_row_filter">
                                            <div class="input-group" style="width:100%">
                                                <asp:Label ID="Label9" runat="server" CssClass="btn btn-xs button-link-w label-sito-scaduto"
                                                    Style="cursor:default; margin-right:1px;" Height="25">
                                                    <i class="fa fa-user"></i>&nbsp;
                                                </asp:Label>
                                                &nbsp;DT > 3 mesi
                                            </div>
                                        </div>
                                        <div class="col-xs-4 gisri_row_filter">
                                        </div>
                                    </div>
                                    <div class="row" style="margin-bottom:5px; white-space:nowrap;" id="div_legend_ditte_esecutrici_01" runat="server">
                                        <div class="col-xs-12">
                                            <b>
                                                Stati dei depositi temporanei delle ditte esecutrici
                                            </b>
                                        </div>
                                    </div>
                                    <div class="row" style="margin-bottom:5px; white-space:nowrap;" id="div_legend_ditte_esecutrici_02" runat="server">
                                        <div class="col-xs-4">
                                            <div class="input-group" style="width:100%">
                                                <asp:Label ID="Label10" runat="server" CssClass="btn btn-xs button-link-w label-sito-aperto"
                                                    Style="cursor:default; margin-right:1px;" Height="25">
                                                    <i class="fa fa-users"></i>&nbsp;
                                                </asp:Label>
                                                &nbsp;DT Vuoto
                                            </div>
                                        </div>
                                        <div class="col-xs-4 gisri_row_filter">
                                            <div class="input-group" style="width:100%">
                                                <asp:Label ID="Label11" runat="server" CssClass="btn btn-xs button-link-w label-sito-attivo"
                                                    Style="cursor:default; margin-right:1px;" Height="25">
                                                    <i class="fa fa-users"></i>&nbsp;
                                                </asp:Label>
                                                &nbsp;DT < 1 mese
                                            </div>
                                        </div>
                                        <div class="col-xs-4 gisri_row_filter">
                                            <div class="input-group" style="width:100%">
                                                <asp:Label ID="Label12" runat="server" CssClass="btn btn-xs button-link-w label-sito-lavorazione"
                                                    Style="cursor:default; margin-right:1px;" Height="25">
                                                    <i class="fa fa-users"></i>&nbsp;
                                                </asp:Label>
                                                &nbsp;DT < 2 mesi
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row" style="margin-bottom:5px; white-space:nowrap;">
                                        <div class="col-xs-4">
                                            <div class="input-group" style="width:100%">
                                                <asp:Label ID="Label13" runat="server" CssClass="btn btn-xs button-link-w label-sito-inscadenza"
                                                    Style="cursor:default; margin-right:1px;" Height="25">
                                                    <i class="fa fa-users"></i>&nbsp;
                                                </asp:Label>
                                                &nbsp;DT < 3 mesi
                                            </div>
                                        </div>
                                        <div class="col-xs-4 gisri_row_filter">
                                            <div class="input-group" style="width:100%">
                                                <asp:Label ID="Label14" runat="server" CssClass="btn btn-xs button-link-w label-sito-scaduto"
                                                    Style="cursor:default; margin-right:1px;" Height="25">
                                                    <i class="fa fa-users"></i>&nbsp;
                                                </asp:Label>
                                                &nbsp;DT > 3 mesi
                                            </div>
                                        </div>
                                        <div class="col-xs-4 gisri_row_filter">
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="row" id="div_filtri" runat="server" visible="false">
                                <div class="form-body" style="margin-left: 30px!Important; margin-right: 30px!Important; margin-top:5px;">
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
                                        <div class="col-xs-2 gisri_row_filter">
                                            <div class="input-group" style="width:100%">
                                                <div>
                                                    <asp:TextBox ID="txt_filter_provincia" runat="server" CssClass="form-control gisri_form_filter"
                                                        placeholder="Prov." onChange="grid_search(this, event, 'st_provincia_desc');" ></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-3 gisri_row_filter">
                                            <div class="input-group" style="width:100%">
                                                <div>
                                                    <asp:DropDownList ID="ddl_societa" runat="server" CssClass="form-control gisri_form_filter" AutoPostBack="true">
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row" style="margin-top:5px; margin-bottom:5px;">
                                        <div class="col-xs-3 gisri_row_filter">
                                            <div class="input-group" style="width:100%">
                                                <div>
                                                    <asp:DropDownList ID="ddl_stati_sito" runat="server" CssClass="form-control gisri_form_filter" AutoPostBack="true">
                                                        <asp:ListItem Text="Tutti gli stati" Value=""></asp:ListItem>
                                                        <asp:ListItem Text="Acquisito" Value="acquisito"></asp:ListItem>
                                                        <asp:ListItem Text="Decommissioning" Value="decommissioning"></asp:ListItem>
                                                        <asp:ListItem Text="Mantenimento" Value="mantenimento"></asp:ListItem>
                                                        <asp:ListItem Text="Alienato" Value="alienato"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-4 gisri_row_filter">
                                            <div class="input-group" style="width:100%">
                                                <div>
                                                    <asp:DropDownList ID="ddl_stato_deposito" runat="server" CssClass="form-control gisri_form_filter" AutoPostBack="true">
                                                        <asp:ListItem Text="Tutti i depositi" Value=""></asp:ListItem>
                                                        <asp:ListItem Text="DT Vuoto" Value="50"></asp:ListItem>
                                                        <asp:ListItem Text="DT < 1 Mese" Value="40"></asp:ListItem>
                                                        <asp:ListItem Text="DT < 2 Mesi" Value="30"></asp:ListItem>
                                                        <asp:ListItem Text="DT < 3 Mesi" Value="20"></asp:ListItem>
                                                        <asp:ListItem Text="DT > 3 Mesi" Value="10"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-4 gisri_row_filter">
                                            <div class="input-group" style="width:100%" id="div_filter_ditte_esecutrici_01" runat="server">
                                                <div>
                                                    <asp:DropDownList ID="ddl_stato_deposito_ext" runat="server" CssClass="form-control gisri_form_filter" AutoPostBack="true">
                                                        <asp:ListItem Text="Tutti i depositi ditte" Value=""></asp:ListItem>
                                                        <asp:ListItem Text="DT Vuoto" Value="50"></asp:ListItem>
                                                        <asp:ListItem Text="DT < 1 Mese" Value="40"></asp:ListItem>
                                                        <asp:ListItem Text="DT < 2 Mesi" Value="30"></asp:ListItem>
                                                        <asp:ListItem Text="DT < 3 Mesi" Value="20"></asp:ListItem>
                                                        <asp:ListItem Text="DT > 3 Mesi" Value="10"></asp:ListItem>
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
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <asp:UpdatePanel ID="upd_master" runat="server">
                    <ContentTemplate>
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
                                    <telerik:GridTemplateColumn UniqueName="TemplateColumnPin" SortExpression="" InitializeTemplatesFirst="false"
                                        HeaderStyle-Width="1%" AllowFiltering="false" Groupable="false">
                                        <ItemStyle Wrap="false" HorizontalAlign="left" />
                                        <HeaderTemplate>
                                            <asp:Label ID="lbl_mappa" runat="server" CssClass="btn btn-xs button-link-w gisri_button_ws label-sito-header red-tooltip"
                                                Style="cursor:default;" ToolTip="Permette lo zoom sulla mappa del sito selezionato"
                                                data-toggle="tooltip" data-placement="right" Height="22">
                                                <i class="fa fa-map-marker"></i>&nbsp;
                                            </asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="btn_mappa" runat="server" CssClass="jumper btn btn-default btn-xs gisri_button_ws"
                                                CommandName="MAPPA" ToolTip="Esegue lo zoom sulla mappa">
                                                <i class=" fa fa-map-marker"></i>&nbsp;
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn SortExpression="st_codice_interno" UniqueName="st_codice_interno"
                                        HeaderText="Codice" DataField="st_codice_interno" HeaderStyle-Width="5%" AllowFiltering="true"
                                        ShowFilterIcon="false" FilterListOptions="VaryByDataType" ItemStyle-Wrap="false" />
                                    <telerik:GridTemplateColumn UniqueName="st_denominazione" SortExpression="st_denominazione"
                                        InitializeTemplatesFirst="false" HeaderStyle-Width="90%" HeaderText="Sito" DataField="st_denominazione"
                                        AllowFiltering="true">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="btn_st_denominazione" runat="server" CommandName="SCHEDA" CssClass="button-link-b"></asp:LinkButton>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="st_provincia_desc" SortExpression="st_provincia_desc"
                                        InitializeTemplatesFirst="false" HeaderStyle-Width="5%" HeaderText="Prov."
                                        DataField="st_provincia_desc" AllowFiltering="true" >
                                        <HeaderStyle CssClass="additionalColumn" />
                                        <ItemStyle CssClass="additionalColumn" />
                                        <ItemTemplate>
                                            <asp:Label ID="lblst_provincia_desc" runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="TemplateColumnSc" SortExpression="" InitializeTemplatesFirst="true"
                                        HeaderStyle-Width="1%" AllowFiltering="false" Groupable="false">
                                        <ItemStyle Wrap="false" HorizontalAlign="Right" />
                                        <Headerstyle Wrap="false" HorizontalAlign="Right" />
                                        <HeaderTemplate>
                                            <asp:Label ID="lbl_stato" runat="server" CssClass="btn btn-xs button-link-w gisri_button_ws label-sito-header red-tooltip"
                                                Style="cursor:default;" ToolTip="Indica lo stato operativo del sito"
                                                data-toggle="tooltip" data-placement="left" title="" Height="23">
                                                <i class="fa fa-flag"></i>&nbsp;
                                            </asp:Label>
                                            <asp:LinkButton ID="btn_scheda" runat="server" CssClass="btn btn-primary btn-xs button-link-w gisri_button_ws red-tooltip"
                                                Style="cursor:pointer;" CommandName="PINS_INT" ToolTip="Identifica sulla mappa i Siti con lo stato del Deposito Temporaneo della Società Titolare"
                                                data-toggle="" data-placement="top" title="" Height="23">
                                                <i class=" fa fa-user"></i>&nbsp;
                                            </asp:LinkButton>
                                            <asp:LinkButton ID="btn_scheda_ext" runat="server" CssClass="btn btn-default btn-xs gisri_button_ws red-tooltip"
                                                Style="cursor:pointer;" CommandName="PINS_OUT" ToolTip="Identifica sulla mappa i Siti con lo stato del Deposito Temporaneo delle Ditte Esecutrici"
                                                data-toggle="" data-placement="top" title="" Height="23">
                                                <i class="fa fa-users"></i>&nbsp;
                                            </asp:LinkButton>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_stato" runat="server" Style="cursor:default;" data-toggle="tooltip" data-placement="left" title=""></asp:Label>
                                            <asp:Label ID="lbl_sito_s" runat="server" Style="cursor:default;" data-toggle="tooltip" data-placement="left" title=""></asp:Label>
                                            <asp:Label ID="lbl_sito_d" runat="server" Style="cursor:default;" data-toggle="tooltip" data-placement="left" title=""></asp:Label>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                </Columns>
                            </MasterTableView>
                            <ClientSettings>
                                <Selecting AllowRowSelect="false" />
                                <ClientEvents OnRowDblClick="RowDblClick" />
                            </ClientSettings>
                        </telerik:RadGrid>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="content-panel map_container_height" style="padding:10px!Important;">
                <div style="width:100%; text-align:center; font-size:14px;">
                    <asp:Literal ID="ltl_titolo_mappa" runat="server"></asp:Literal>
                </div>
                <div class="map_container col-lg-6">
                    <div id="googlemaps" class="map map_canvas map_height">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function goSite(obj, id) {
            //alert(id);
            javascript: __doPostBack(obj, id);
        }
        $(document).ready(function() {
            $(".jumper").on("click", function( e ) {

                e.preventDefault();

                $("body, html").animate({
                    scrollTop: $('.map').offset().top
                    // scrollTop: $( $(this).attr('href') ).offset().top
                }, 600);

            });
        });
    </script>
</asp:Content>

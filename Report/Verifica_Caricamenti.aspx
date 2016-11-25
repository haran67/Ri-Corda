<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Start/GisRI.Master"
    CodeBehind="Verifica_Caricamenti.aspx.vb" Inherits="GisRI_Web.Verifica_Caricamenti" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Src="../Controls/rTextBox.ascx" TagName="rTextBox" TagPrefix="cc" %>
<%@ Register Src="../Controls/rTextData.ascx" TagName="rTextData" TagPrefix="cc" %>
<%@ Register Src="../Controls/rTextNumero.ascx" TagName="rTextNumero" TagPrefix="cc" %>
<%@ Register Src="../Controls/rDropDown.ascx" TagName="rDropDown" TagPrefix="cc" %>
<%@ Register Src="../Controls/rCheckBox.ascx" TagName="rCheckBox" TagPrefix="cc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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

    </script>
    <style>@media (max-width: 768px) { .btn {width: 100% !important;}}</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body_up" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <div class="content-panel">
                <div class="row" style="min-height:40px!Important;">
                    <div class="gisri_panel_title gisri_title_margin">
                        <div class="gisri_title_left">
                            <h3 style="margin:0px!Important;">
                                ELENCO DEGLI INSERIMENTI DA VERIFICARE
                            </h3>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-12">
            <div class="content-panel">

                <h4 style="font-weight: bold; margin: 0px; margin-bottom: 5px;">
                    Seleziona Sito</h4>
                <div id="div_titolarita" runat="server">
                    <div class="row">
                        <div class="col-md-10">
                            <cc:rDropDown ID="ddl_st_sito" runat="server" AutoPostBack="false" Select2="true"
                                Label="" Placeholder="Seleziona..." Form_Vertical="true" />
                        </div>
                        <div class="col-md-2">
                            <label class="control-label col-md-3" style="white-space: nowrap;" id="label_control"
                                runat="server">
                            </label>
                            <asp:LinkButton ID="btn_aggiorna" runat="server" CssClass="btn btn-primary">
                                <i class="fa fa-check"></i> Carica Dati
                            </asp:LinkButton>
                        </div>
                    </div>
                </div>
                <div class="panel-heading">
                    <ul class="nav nav-tabs nav-justified">
                        <li class="active" id="li_rifiuti" runat="server"><a data-toggle="tab" href="#<%=div_rifiuti.ClientID%>"
                            class="tab-font">Produzioni</a> </li>
                        <li id="li_smaltimenti" runat="server"><a data-toggle="tab" href="#<%=div_smaltimenti.ClientID%>"
                            class="tab-font">Avvii a Destino</a> </li>
                        <li id="li_cer" runat="server"><a data-toggle="tab" href="#<%=div_cer.ClientID%>"
                            class="tab-font">Conferme CER</a> </li>
                        <li id="li_carichi" runat="server"><a data-toggle="tab" href="#<%=div_carichi.ClientID%>"
                            class="tab-font">Carichi</a> </li>
                        <li id="li_scarichi" runat="server"><a data-toggle="tab" href="#<%=div_scarichi.ClientID%>"
                            class="tab-font">Scarichi</a> </li>
                        <li id="li_copie" runat="server"><a data-toggle="tab" href="#<%=div_copie.ClientID%>"
                            class="tab-font">4° Copia</a> </li>
                    </ul>
                </div>
                <! --/panel-heading -->
                <div class="panel-body">
                    <div class="tab-content">
                        <div id="div_rifiuti" class="tab-pane active" runat="server" style="background-color:White;">
                            <div class="row">
                                <div class="col-lg-12">
                                    <telerik:RadGrid ID="RGRifiutiVerifica" AutoGenerateColumns="False" CssClass="overflow"
                                        Style="width: 100% !important" runat="server" ShowFooter="false" AllowPaging="True"
                                        AllowSorting="True" GridLines="None" PageSize="25" Width="100%" AllowMultiRowSelection="true"
                                        Skin="MyCustomSkin" EnableEmbeddedSkins="false" AllowFilteringByColumn="true"
                                        Culture="it-IT">
                                        <GroupingSettings CaseSensitive="false" />
                                        <PagerStyle Mode="NextPrevAndNumeric" CssClass=""></PagerStyle>
                                        <HeaderStyle CssClass=""></HeaderStyle>
                                        <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                        <AlternatingItemStyle CssClass="" HorizontalAlign="Left"></AlternatingItemStyle>
                                        <FilterItemStyle HorizontalAlign="Left" />
                                        <MasterTableView ShowFooter="false" Width="100%" DataKeyNames="" AllowMultiColumnSorting="True">
                                            <Columns>
                                                <telerik:GridBoundColumn SortExpression="st_denominazione" UniqueName="st_denominazione"
                                                    HeaderText="Sito" DataField="st_denominazione" HeaderStyle-Width="25%" AllowFiltering="true"
                                                    ShowFilterIcon="false" FilterControlWidth="150px" AutoPostBackOnFilter="true"
                                                    CurrentFilterFunction="Contains" />
                                                <telerik:GridBoundColumn SortExpression="inserito_il" UniqueName="inserito_il"
                                                    HeaderText="Inserito il" DataField="inserito_il" HeaderStyle-Width="10%" AllowFiltering="true"
                                                    ShowFilterIcon="false" FilterControlWidth="150px" AutoPostBackOnFilter="true"
                                                    CurrentFilterFunction="Contains" />
                                                <telerik:GridTemplateColumn SortExpression="rc_codici_cer_actual_cod" UniqueName="rc_codici_cer_actual_cod"
                                                    HeaderText="CER" DataField="rc_codici_cer_actual_cod" HeaderStyle-Width="5%"
                                                    AllowFiltering="true" ShowFilterIcon="false" FilterControlWidth="50px" AutoPostBackOnFilter="true"
                                                    CurrentFilterFunction="Contains">
                                                    <ItemStyle Wrap="false" Font-Bold="true" />
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblrc_codici_cer_cod" runat="server"></asp:Label>
                                                        <asp:Label ID="lblrc_codici_cer_con" runat="server" Visible="false"></asp:Label>
                                                    </ItemTemplate>
                                                </telerik:GridTemplateColumn>
                                                <telerik:GridTemplateColumn SortExpression="rf_proprietario_desc" UniqueName="rf_proprietario_desc"
                                                    HeaderText="Produttore" DataField="rf_proprietario_desc" HeaderStyle-Width="12%"
                                                    AllowFiltering="true" ShowFilterIcon="false" FilterControlWidth="150px" AutoPostBackOnFilter="true"
                                                    CurrentFilterFunction="Contains">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblrf_proprietario_desc" runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                </telerik:GridTemplateColumn>
                                                <telerik:GridTemplateColumn SortExpression="rm_numero" UniqueName="rm_numero"
                                                    HeaderText="Num" DataField="rm_numero" HeaderStyle-Width="3%" AllowFiltering="true"
                                                    ShowFilterIcon="false" FilterControlWidth="150px" AutoPostBackOnFilter="true"
                                                    CurrentFilterFunction="Contains">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblrm_numero" runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                </telerik:GridTemplateColumn>
                                                <telerik:GridTemplateColumn SortExpression="rf_data_produzione" UniqueName="rf_data_produzione"
                                                    HeaderText="Produzione" DataField="rf_data_produzione" HeaderStyle-Width="10%"
                                                    AllowFiltering="false">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblrf_data_produzione" runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                </telerik:GridTemplateColumn>
                                                <telerik:GridBoundColumn SortExpression="rf_descrizione" UniqueName="rf_descrizione"
                                                    HeaderText="Descrizione" DataField="rf_descrizione" HeaderStyle-Width="25%" AllowFiltering="true"
                                                    ShowFilterIcon="false" FilterControlWidth="150px" AutoPostBackOnFilter="true"
                                                    CurrentFilterFunction="Contains" ItemStyle-CssClass="additionalColumn" HeaderStyle-CssClass="additionalColumn" />
                                                <telerik:GridTemplateColumn SortExpression="" UniqueName="rf_peso_volume_iniziale"
                                                    HeaderText="Peso e Volume" DataField="rf_peso_volume_iniziale" HeaderStyle-Width="10%"
                                                    AllowFiltering="false" ItemStyle-CssClass="additionalColumn" HeaderStyle-CssClass="additionalColumn">
                                                    <ItemStyle Wrap="false" />
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblrf_peso_volume_iniziale" runat="server"></asp:Label>
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
                                                    </ItemTemplate>
                                                </telerik:GridTemplateColumn>
                                                <telerik:GridTemplateColumn UniqueName="TemplateColumnOk" SortExpression="" InitializeTemplatesFirst="false"
                                                    HeaderStyle-Width="1%" AllowFiltering="false">
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="btn_conferma" runat="server" CssClass="btn btn-success btn-xs button-link-w gisri_button_list"
                                                            CommandName="CONFERMA">
                                                            <i class=" fa fa-check-circle"></i>&nbsp;CONFERMA</i>
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
                        <div id="div_smaltimenti" class="tab-pane" runat="server">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="table-container">
                                        <telerik:RadGrid ID="RGSmaltimentiVerifica" AutoGenerateColumns="False" CssClass="overflow"
                                            Style="width: 100% !important" runat="server" ShowFooter="false" AllowPaging="True"
                                            AllowSorting="True" GridLines="None" PageSize="25" Width="100%" AllowMultiRowSelection="true"
                                            Skin="MyCustomSkin" EnableEmbeddedSkins="false" AllowFilteringByColumn="true"
                                            Culture="it-IT">
                                            <GroupingSettings CaseSensitive="false" />
                                            <PagerStyle Mode="NextPrevAndNumeric" CssClass=""></PagerStyle>
                                            <HeaderStyle CssClass=""></HeaderStyle>
                                            <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                            <AlternatingItemStyle CssClass="" HorizontalAlign="Left"></AlternatingItemStyle>
                                            <FilterItemStyle HorizontalAlign="Left" />
                                            <MasterTableView ShowFooter="false" Width="100%" DataKeyNames="rifiuto_smaltimento_key"
                                                AllowMultiColumnSorting="True">
                                                <Columns>
                                                    <telerik:GridBoundColumn SortExpression="st_denominazione" UniqueName="st_denominazione"
                                                        HeaderText="Sito" DataField="st_denominazione" HeaderStyle-Width="25%" AllowFiltering="true"
                                                        ShowFilterIcon="false" FilterControlWidth="150px" AutoPostBackOnFilter="true"
                                                        CurrentFilterFunction="Contains" />
                                                    <telerik:GridBoundColumn SortExpression="inserito_il" UniqueName="inserito_il"
                                                        HeaderText="Inserito il" DataField="inserito_il" HeaderStyle-Width="10%" AllowFiltering="true"
                                                        ShowFilterIcon="false" FilterControlWidth="150px" AutoPostBackOnFilter="true"
                                                        CurrentFilterFunction="Contains" />
                                                    <telerik:GridTemplateColumn SortExpression="rs_codici_cer_cod" UniqueName="rs_codici_cer_cod"
                                                        HeaderText="CER" DataField="rs_codici_cer_cod" HeaderStyle-Width="5%" AllowFiltering="true"
                                                        ShowFilterIcon="false" FilterControlWidth="50px" AutoPostBackOnFilter="true"
                                                        CurrentFilterFunction="Contains">
                                                        <ItemStyle Wrap="false" Font-Bold="true" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblrs_codici_cer_cod" runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn SortExpression="rm_numero" UniqueName="rm_numero"
                                                        HeaderText="Num" DataField="rm_numero" HeaderStyle-Width="3%" AllowFiltering="true"
                                                        ShowFilterIcon="false" FilterControlWidth="150px" AutoPostBackOnFilter="true"
                                                        CurrentFilterFunction="Contains">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblrm_numero" runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn SortExpression="rs_proprietario_desc" UniqueName="rs_proprietario_desc"
                                                        HeaderText="Prodotto Da" DataField="rs_proprietario_desc" HeaderStyle-Width="15%"
                                                        AllowFiltering="true" ShowFilterIcon="false" FilterControlWidth="120px" AutoPostBackOnFilter="true"
                                                        CurrentFilterFunction="Contains">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblrs_produttore_desc" runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn SortExpression="rs_data_trasporto" UniqueName="rs_data_trasporto"
                                                        HeaderText="Trasporto" DataField="rs_data_trasporto" HeaderStyle-Width="10%"
                                                        AllowFiltering="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblrs_data_trasporto" runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn SortExpression="rs_formulario_numero" UniqueName="rs_formulario_numero"
                                                        HeaderText="FIR Num/Del" DataField="rs_formulario_numero" HeaderStyle-Width="10%"
                                                        AllowFiltering="true" ShowFilterIcon="false" FilterControlWidth="50px" AutoPostBackOnFilter="true"
                                                        CurrentFilterFunction="Contains">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblformulario_data" runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn SortExpression="rs_destinatario_desc" UniqueName="rs_destinatario_desc"
                                                        HeaderText="Smaltitore" DataField="rs_destinatario_desc" HeaderStyle-Width="20%"
                                                        AllowFiltering="true" ShowFilterIcon="false" FilterControlWidth="100px" AutoPostBackOnFilter="true"
                                                        CurrentFilterFunction="Contains" ItemStyle-CssClass="additionalColumn" HeaderStyle-CssClass="additionalColumn">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblrs_destinatario_desc" runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn SortExpression="" UniqueName="rs_peso_volume_iniziale"
                                                        HeaderText="Peso e Volume" DataField="rs_peso_volume_iniziale" HeaderStyle-Width="10%"
                                                        AllowFiltering="false" ItemStyle-CssClass="additionalColumn" HeaderStyle-CssClass="additionalColumn">
                                                        <ItemStyle Wrap="false" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblrs_peso_volume" runat="server"></asp:Label>
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
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn UniqueName="TemplateColumnOk" SortExpression="" InitializeTemplatesFirst="false"
                                                        HeaderStyle-Width="1%" AllowFiltering="false">
                                                        <ItemStyle HorizontalAlign="Right" />
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="btn_conferma" runat="server" CssClass="btn btn-success btn-xs button-link-w gisri_button_list"
                                                                CommandName="CONFERMA">
                                                                <i class=" fa fa-check-circle"></i>&nbsp;CONFERMA</i>
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
                        <div id="div_cer" class="tab-pane" runat="server">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="table-container">
                                        <telerik:RadGrid ID="RGRifiutiCER" AutoGenerateColumns="False" CssClass="overflow"
                                            Style="width: 100% !important" runat="server" ShowFooter="false" AllowPaging="True"
                                            AllowSorting="True" GridLines="None" PageSize="25" Width="100%" AllowMultiRowSelection="true"
                                            Skin="MyCustomSkin" EnableEmbeddedSkins="false" AllowFilteringByColumn="true"
                                            Culture="it-IT">
                                            <GroupingSettings CaseSensitive="false" />
                                            <PagerStyle Mode="NextPrevAndNumeric" CssClass=""></PagerStyle>
                                            <HeaderStyle CssClass=""></HeaderStyle>
                                            <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                            <AlternatingItemStyle CssClass="" HorizontalAlign="Left"></AlternatingItemStyle>
                                            <FilterItemStyle HorizontalAlign="Left" />
                                            <MasterTableView ShowFooter="false" Width="100%" DataKeyNames="" AllowMultiColumnSorting="True">
                                                <Columns>
                                                    <telerik:GridBoundColumn SortExpression="st_denominazione" UniqueName="st_denominazione"
                                                        HeaderText="Sito" DataField="st_denominazione" HeaderStyle-Width="25%" AllowFiltering="true"
                                                        ShowFilterIcon="false" FilterControlWidth="150px" AutoPostBackOnFilter="true"
                                                        CurrentFilterFunction="Contains" />
                                                    <telerik:GridBoundColumn SortExpression="cer_inserito_il" UniqueName="cer_inserito_il"
                                                        HeaderText="Inserito il" DataField="cer_inserito_il" HeaderStyle-Width="10%" AllowFiltering="true"
                                                        ShowFilterIcon="false" FilterControlWidth="150px" AutoPostBackOnFilter="true"
                                                        CurrentFilterFunction="Contains" />
                                                    <telerik:GridTemplateColumn SortExpression="rc_codici_cer_actual_cod" UniqueName="rc_codici_cer_actual_cod"
                                                        HeaderText="CER" DataField="rc_codici_cer_actual_cod" HeaderStyle-Width="5%"
                                                        AllowFiltering="true" ShowFilterIcon="false" FilterControlWidth="50px" AutoPostBackOnFilter="true"
                                                        CurrentFilterFunction="Contains">
                                                        <ItemStyle Wrap="false" Font-Bold="true" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblrc_codici_cer_cod" runat="server"></asp:Label>
                                                            <asp:Label ID="lblrc_codici_cer_con" runat="server" Visible="false"></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn SortExpression="rf_proprietario_desc" UniqueName="rf_proprietario_desc"
                                                        HeaderText="Produttore" DataField="rf_proprietario_desc" HeaderStyle-Width="15%"
                                                        AllowFiltering="true" ShowFilterIcon="false" FilterControlWidth="150px" AutoPostBackOnFilter="true"
                                                        CurrentFilterFunction="Contains">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblrf_proprietario_desc" runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn SortExpression="rm_numero" UniqueName="rm_numero"
                                                        HeaderText="Num" DataField="rm_numero" HeaderStyle-Width="3%" AllowFiltering="true"
                                                        ShowFilterIcon="false" FilterControlWidth="150px" AutoPostBackOnFilter="true"
                                                        CurrentFilterFunction="Contains">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblrm_numero" runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn SortExpression="rf_data_produzione" UniqueName="rf_data_produzione"
                                                        HeaderText="Produzione" DataField="rf_data_produzione" HeaderStyle-Width="10%"
                                                        AllowFiltering="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblrf_data_produzione" runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridBoundColumn SortExpression="rf_descrizione" UniqueName="rf_descrizione"
                                                        HeaderText="Descrizione" DataField="rf_descrizione" HeaderStyle-Width="25%" AllowFiltering="true"
                                                        ShowFilterIcon="false" FilterControlWidth="150px" AutoPostBackOnFilter="true"
                                                        CurrentFilterFunction="Contains" ItemStyle-CssClass="additionalColumn" HeaderStyle-CssClass="additionalColumn" />
                                                    <telerik:GridTemplateColumn SortExpression="" UniqueName="rf_peso_volume_iniziale"
                                                        HeaderText="Peso e Volume" DataField="rf_peso_volume_iniziale" HeaderStyle-Width="10%"
                                                        AllowFiltering="false" ItemStyle-CssClass="additionalColumn" HeaderStyle-CssClass="additionalColumn">
                                                        <ItemStyle Wrap="false" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblrf_peso_volume_iniziale" runat="server"></asp:Label>
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
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn UniqueName="TemplateColumnOk" SortExpression="" InitializeTemplatesFirst="false"
                                                        HeaderStyle-Width="1%" AllowFiltering="false">
                                                        <ItemStyle HorizontalAlign="Right" />
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="btn_conferma" runat="server" CssClass="btn btn-success btn-xs button-link-w gisri_button_list"
                                                                CommandName="CONFERMA">
                                                                <i class=" fa fa-check-circle"></i>&nbsp;CONFERMA</i>
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
                        <div id="div_carichi" class="tab-pane" runat="server">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="table-container">
                                        <telerik:RadGrid ID="RGCarichi" AutoGenerateColumns="False" CssClass="" runat="server"
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
                                                    <telerik:GridTemplateColumn SortExpression="rm_st_denominazione" UniqueName="rm_st_denominazione"
                                                        HeaderText="Sito" DataField="rm_st_denominazione" HeaderStyle-Width="25%" AllowFiltering="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblrm_st_denominazione" runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridBoundColumn SortExpression="mov_inserito_il" UniqueName="mov_inserito_il"
                                                        HeaderText="Inserito il" DataField="mov_inserito_il" HeaderStyle-Width="10%" AllowFiltering="true"
                                                        ShowFilterIcon="false" FilterControlWidth="150px" AutoPostBackOnFilter="true"
                                                        CurrentFilterFunction="Contains" />
                                                    <telerik:GridTemplateColumn SortExpression="rm_data_op" UniqueName="rm_data_op"
                                                        HeaderText="Data Op." DataField="rm_data_op" HeaderStyle-Width="10%" AllowFiltering="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblrm_data_op" runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn SortExpression="rm_numero" UniqueName="rm_numero"
                                                        HeaderText="Num." DataField="rm_numero" HeaderStyle-Width="5%" AllowFiltering="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblrm_numero" runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn SortExpression="rm_fir" UniqueName="rm_fir"
                                                        HeaderText="N.FIR" DataField="rm_fir" HeaderStyle-Width="5%" AllowFiltering="true">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblrm_fir" runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn SortExpression="rm_riferimento" UniqueName="rm_riferimento"
                                                        HeaderText="Rif." DataField="rm_riferimento" HeaderStyle-Width="10%" AllowFiltering="true">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblrm_riferimento" runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn SortExpression="rm_cer" UniqueName="rm_cer"
                                                        HeaderText="CER" DataField="rm_cer" HeaderStyle-Width="10%" AllowFiltering="true">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblrc_codici_cer_key" runat="server" Font-Bold="true"></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn SortExpression="" UniqueName="rm_descrizione"
                                                        HeaderText="Descrizione" DataField="rm_descrizione" HeaderStyle-Width="25%" AllowFiltering="true"
                                                        ItemStyle-CssClass="additionalColumn" HeaderStyle-CssClass="additionalColumn" >
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblrf_descrizione" runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn SortExpression="" UniqueName="rf_peso"
                                                        HeaderText="Quantità" DataField="rf_peso" HeaderStyle-Width="5%" AllowFiltering="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblrf_peso" runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn SortExpression="" UniqueName="rf_peso_destino"
                                                        HeaderText="Destino" DataField="rf_peso_destino" HeaderStyle-Width="5%" AllowFiltering="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbrf_peso_destino" runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn SortExpression="rm_data" UniqueName="rm_data"
                                                        HeaderText="Data Reg." DataField="rm_data" HeaderStyle-Width="10%" AllowFiltering="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblrm_data" runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn UniqueName="TemplateColumnGo" SortExpression="" InitializeTemplatesFirst="false"
                                                        HeaderStyle-Width="1%" AllowFiltering="false">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="btn_scheda" runat="server" CssClass="btn btn-primary btn-xs button-link-w gisri_button_list"
                                                                CommandName="SCHEDA">
                                                                <i class=" fa fa-edit"></i>&nbsp;SCHEDA
                                                            </asp:LinkButton>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn UniqueName="TemplateColumnOk" SortExpression="" InitializeTemplatesFirst="false"
                                                        HeaderStyle-Width="1%" AllowFiltering="false">
                                                        <ItemStyle HorizontalAlign="Right" />
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="btn_conferma" runat="server" CssClass="btn btn-success btn-xs button-link-w gisri_button_list"
                                                                CommandName="CONFERMA">
                                                                <i class=" fa fa-check-circle"></i>&nbsp;CONFERMA</i>
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
                        <div id="div_scarichi" class="tab-pane" runat="server">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="table-container">
                                        <telerik:RadGrid ID="RGScarichi" AutoGenerateColumns="False" CssClass="" runat="server"
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
                                                    <telerik:GridTemplateColumn SortExpression="rm_st_denominazione" UniqueName="rm_st_denominazione"
                                                        HeaderText="Sito" DataField="rm_st_denominazione" HeaderStyle-Width="25%" AllowFiltering="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblrm_st_denominazione" runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridBoundColumn SortExpression="mov_inserito_il" UniqueName="mov_inserito_il"
                                                        HeaderText="Inserito il" DataField="mov_inserito_il" HeaderStyle-Width="10%" AllowFiltering="true"
                                                        ShowFilterIcon="false" FilterControlWidth="150px" AutoPostBackOnFilter="true"
                                                        CurrentFilterFunction="Contains" />
                                                    <telerik:GridTemplateColumn SortExpression="rm_data_op" UniqueName="rm_data_op"
                                                        HeaderText="Data Op." DataField="rm_data_op" HeaderStyle-Width="10%" AllowFiltering="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblrm_data_op" runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn SortExpression="rm_numero" UniqueName="rm_numero"
                                                        HeaderText="Num." DataField="rm_numero" HeaderStyle-Width="5%" AllowFiltering="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblrm_numero" runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn SortExpression="rm_fir" UniqueName="rm_fir"
                                                        HeaderText="N.FIR" DataField="rm_fir" HeaderStyle-Width="5%" AllowFiltering="true">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblrm_fir" runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn SortExpression="rm_riferimento" UniqueName="rm_riferimento"
                                                        HeaderText="Rif." DataField="rm_riferimento" HeaderStyle-Width="10%" AllowFiltering="true">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblrm_riferimento" runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn SortExpression="rm_cer" UniqueName="rm_cer"
                                                        HeaderText="CER" DataField="rm_cer" HeaderStyle-Width="10%" AllowFiltering="true">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblrc_codici_cer_key" runat="server" Font-Bold="true"></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn SortExpression="" UniqueName="rm_descrizione"
                                                        HeaderText="Descrizione" DataField="rm_descrizione" HeaderStyle-Width="25%" AllowFiltering="true"
                                                        ItemStyle-CssClass="additionalColumn" HeaderStyle-CssClass="additionalColumn" >
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblrf_descrizione" runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn SortExpression="" UniqueName="rf_peso"
                                                        HeaderText="Quantità" DataField="rf_peso" HeaderStyle-Width="5%" AllowFiltering="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblrf_peso" runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn SortExpression="" UniqueName="rf_peso_destino"
                                                        HeaderText="Destino" DataField="rf_peso_destino" HeaderStyle-Width="5%" AllowFiltering="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbrf_peso_destino" runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn SortExpression="rm_data" UniqueName="rm_data"
                                                        HeaderText="Data Reg." DataField="rm_data" HeaderStyle-Width="10%" AllowFiltering="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblrm_data" runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn UniqueName="TemplateColumnGo" SortExpression="" InitializeTemplatesFirst="false"
                                                        HeaderStyle-Width="1%" AllowFiltering="false">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="btn_scheda" runat="server" CssClass="btn btn-primary btn-xs button-link-w gisri_button_list"
                                                                CommandName="SCHEDA">
                                                                <i class=" fa fa-edit"></i>&nbsp;SCHEDA
                                                            </asp:LinkButton>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn UniqueName="TemplateColumnOk" SortExpression="" InitializeTemplatesFirst="false"
                                                        HeaderStyle-Width="1%" AllowFiltering="false">
                                                        <ItemStyle HorizontalAlign="Right" />
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="btn_conferma" runat="server" CssClass="btn btn-success btn-xs button-link-w gisri_button_list"
                                                                CommandName="CONFERMA">
                                                                <i class=" fa fa-check-circle"></i>&nbsp;CONFERMA</i>
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
                        <div id="div_copie" class="tab-pane" runat="server">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="table-container">
                                        <telerik:RadGrid ID="RGQuartaCopia" AutoGenerateColumns="False" CssClass="overflow"
                                            Style="width: 100% !important" runat="server" ShowFooter="false" AllowPaging="True"
                                            AllowSorting="True" GridLines="None" PageSize="25" Width="100%" AllowMultiRowSelection="true"
                                            Skin="MyCustomSkin" EnableEmbeddedSkins="false" AllowFilteringByColumn="true"
                                            Culture="it-IT">
                                            <GroupingSettings CaseSensitive="false" />
                                            <PagerStyle Mode="NextPrevAndNumeric" CssClass=""></PagerStyle>
                                            <HeaderStyle CssClass=""></HeaderStyle>
                                            <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                            <AlternatingItemStyle CssClass="" HorizontalAlign="Left"></AlternatingItemStyle>
                                            <FilterItemStyle HorizontalAlign="Left" />
                                            <MasterTableView ShowFooter="false" Width="100%" DataKeyNames="rifiuto_smaltimento_key"
                                                AllowMultiColumnSorting="True">
                                                <Columns>
                                                    <telerik:GridBoundColumn SortExpression="st_denominazione" UniqueName="st_denominazione"
                                                        HeaderText="Sito" DataField="st_denominazione" HeaderStyle-Width="30%" AllowFiltering="true"
                                                        ShowFilterIcon="false" FilterControlWidth="150px" AutoPostBackOnFilter="true"
                                                        CurrentFilterFunction="Contains" />
                                                    <telerik:GridBoundColumn SortExpression="rs_4c_data_inserimento" UniqueName="rs_4c_data_inserimento"
                                                        HeaderText="Inserito il" DataField="rs_4c_data_inserimento" HeaderStyle-Width="10%" AllowFiltering="true"
                                                        ShowFilterIcon="false" FilterControlWidth="150px" AutoPostBackOnFilter="true"
                                                        CurrentFilterFunction="Contains" />
                                                    <telerik:GridTemplateColumn SortExpression="rs_codici_cer_cod" UniqueName="rs_codici_cer_cod"
                                                        HeaderText="CER" DataField="rs_codici_cer_cod" HeaderStyle-Width="5%" AllowFiltering="true"
                                                        ShowFilterIcon="false" FilterControlWidth="50px" AutoPostBackOnFilter="true"
                                                        CurrentFilterFunction="Contains">
                                                        <ItemStyle Wrap="false" Font-Bold="true" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblrs_codici_cer_cod" runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn SortExpression="rm_numero" UniqueName="rm_numero"
                                                        HeaderText="Num" DataField="rm_numero" HeaderStyle-Width="3%" AllowFiltering="true"
                                                        ShowFilterIcon="false" FilterControlWidth="150px" AutoPostBackOnFilter="true"
                                                        CurrentFilterFunction="Contains">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblrm_numero" runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn SortExpression="rs_proprietario_desc" UniqueName="rs_proprietario_desc"
                                                        HeaderText="Prodotto Da" DataField="rs_proprietario_desc" HeaderStyle-Width="15%"
                                                        AllowFiltering="true" ShowFilterIcon="false" FilterControlWidth="120px" AutoPostBackOnFilter="true"
                                                        CurrentFilterFunction="Contains" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblrs_produttore_desc" runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn SortExpression="rs_data_trasporto" UniqueName="rs_data_trasporto"
                                                        HeaderText="Trasporto" DataField="rs_data_trasporto" HeaderStyle-Width="10%"
                                                        AllowFiltering="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblrs_data_trasporto" runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn SortExpression="rs_formulario_numero" UniqueName="rs_formulario_numero"
                                                        HeaderText="FIR Num/Del" DataField="rs_formulario_numero" HeaderStyle-Width="10%"
                                                        AllowFiltering="true" ShowFilterIcon="false" FilterControlWidth="50px" AutoPostBackOnFilter="true"
                                                        CurrentFilterFunction="Contains">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblformulario_data" runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn SortExpression="rs_destinatario_desc" UniqueName="rs_destinatario_desc"
                                                        HeaderText="Smaltitore" DataField="rs_destinatario_desc" HeaderStyle-Width="25%"
                                                        AllowFiltering="true" ShowFilterIcon="false" FilterControlWidth="100px" AutoPostBackOnFilter="true"
                                                        CurrentFilterFunction="Contains" ItemStyle-CssClass="additionalColumn" HeaderStyle-CssClass="additionalColumn">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblrs_destinatario_desc" runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn SortExpression="" UniqueName="rs_peso_volume_iniziale"
                                                        HeaderText="Peso e Volume" DataField="rs_peso_volume_iniziale" HeaderStyle-Width="10%"
                                                        AllowFiltering="false" ItemStyle-CssClass="additionalColumn" HeaderStyle-CssClass="additionalColumn">
                                                        <ItemStyle Wrap="false" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblrs_peso_volume" runat="server"></asp:Label>
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
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn UniqueName="TemplateColumnOk" SortExpression="" InitializeTemplatesFirst="false"
                                                        HeaderStyle-Width="1%" AllowFiltering="false">
                                                        <ItemStyle HorizontalAlign="Right" />
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="btn_conferma" runat="server" CssClass="btn btn-success btn-xs button-link-w gisri_button_list"
                                                                CommandName="CONFERMA">
                                                                <i class=" fa fa-check-circle"></i>&nbsp;CONFERMA</i>
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
                    </div>
                    <!-- /tab-content -->
                </div>
                <! --/panel-body -->
            </div>
            <div class="content-panel" id="panel_vecchio" runat="server" visible="false">
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

            </div>
        </div>
        <!-- /col-md-12 -->
    </div>
    <!-- /row -->

	<script type="text/javascript" src="../assets/js/fancybox/jquery.fancybox.js"></script>

    <script type="text/javascript">

        $(document).ready(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });

    </script>

</asp:Content>
<asp:Content ID="body" ContentPlaceHolderID="body" runat="server">

    <div class="modal fade" id="myModalConfirm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-lg" id="modal_body">
            <div class="modal-content">
                <asp:UpdatePanel ID="updWizard" runat="server">
                    <ContentTemplate>
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true" id="btn_close" runat="server">
                                &nbsp;&times;</button>
                            <h3 class="modal-title" id="myModalLabel">
                                <asp:Literal ID="ltl_messaggio" runat="server">
                                CONFERMA CARICAMENTO</asp:Literal>&nbsp;<asp:Literal ID="ltl_cer" runat="server"></asp:Literal></h3>
                            <div id="div_supporto" runat="server">
                                <h6 style="color: White; font-weight: bold;">
                                    <asp:Literal ID="ltl_sito" runat="server"></asp:Literal>
                                </h6>
                            </div>
                        </div>
                        <div class="modal-body" style="height: 320px; overflow: auto;">
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
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="compose-mail" style="padding-left: 30px; padding-right: 30px; margin-top: 0px!Important;">
                                        <div class="form-vertical">
                                            <div class="row">
                                                <div class="compose-editor" style="padding-top: 0px;">
                                                    <label for="mail_subject" class="">
                                                        Note sulle verifica effettuata:</label>
                                                    <asp:TextBox ID="txt_verificato_note" Style="display: ;" runat="server" TextMode="MultiLine"
                                                        Rows="10" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="row" id="div_in_lavorazione" runat="server" visible="false">
                                                <div class="form-group">
                                                    <h4>
                                                        In lavorazione da parte di: <asp:Literal ID="ltl_in_lavorazione" runat="server"></asp:Literal>
                                                    </h4>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:LinkButton ID="btn_lavorazione" runat="server" CssClass="btn btn-warning">
                                <i class="fa fa-check"></i> METTI IN LAVORAZIONE
                            </asp:LinkButton>
                            <asp:LinkButton ID="btn_conferma" runat="server" CssClass="btn btn-primary">
                                <i class="fa fa-check"></i> CONFERMA
                            </asp:LinkButton>
                            <button type="button" class="btn btn-default" data-dismiss="modal" id="btn_chiudi" runat="server"
                                onclick="$('.alert-dismissable').alert('close');">
                                CHIUDI</button>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>


</asp:Content>

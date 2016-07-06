<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Start/GisRI.Master"
    CodeBehind="Caricamenti_Verificati.aspx.vb" Inherits="GisRI_Web.Caricamenti_Verificati" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Src="../Controls/rTextData.ascx" TagName="rTextData" TagPrefix="cc" %>
<%@ Register Src="../Controls/rDropDown.ascx" TagName="rDropDown" TagPrefix="cc" %>
<%@ Register Src="../Controls/cAllegati.ascx" TagName="cAllegati" TagPrefix="cc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div style="height: 10px;">
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="content-panel">
                <h2 style="margin: 0px!Important;">
                    <asp:Literal ID="ltl_st_denominazione" runat="server">Elenco delle verifiche effettuate sui movimenti</asp:Literal></h2>
            </div>
        </div>
        <div class="col-lg-12">
            <div class="content-panel" style="padding: 10px!Important;">
                <div style="margin: 20px;">
                    <h4 style="font-weight: bold; margin: 0px; margin-bottom: 5px;">
                        Seleziona Sito ed eventuale tipologia di caricamento</h4>
                    <div class="form-body" style="">
                        <div id="div_titolarita" runat="server">
                            <div class="row">
                                <div class="col-md-8">
                                    <cc:rDropDown ID="ddl_st_sito" runat="server" AutoPostBack="false" Select2="true"
                                        Label="" Placeholder="Seleziona..." Form_Vertical="true" />
                                </div>
                                <div class="col-md-2">
                                    <cc:rDropDown ID="ddl_sistema" runat="server" AutoPostBack="false" Select2="true"
                                        Label="" Placeholder="Seleziona..." Form_Vertical="true" />
                                </div>
                                <div class="col-md-2">
                                    <label class="control-label col-md-3" style="white-space: nowrap;" id="label_control"
                                        runat="server">
                                    </label>
                                    <asp:LinkButton ID="btn_aggiorna" runat="server" CssClass="btn btn-primary">
                                        <i class="fa fa-check"></i> Carica Report
                                    </asp:LinkButton>
                                </div>
                            </div>
                        </div>
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
                </div>
                <div class="content-panel">
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
                                class="tab-font">4 Copia</a> </li>
                        </ul>
                    </div>
                    <! --/panel-heading -->
                    <div class="panel-body">
                        <div class="tab-content">
                            <div id="div_rifiuti" class="tab-pane active" runat="server" style="background-color: White;">
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
                                                    <telerik:GridBoundColumn SortExpression="rc_st_denominazione" UniqueName="rc_st_denominazione"
                                                        HeaderText="Sito" DataField="rc_st_denominazione" HeaderStyle-Width="25%" AllowFiltering="true"
                                                        ShowFilterIcon="false" FilterControlWidth="150px" AutoPostBackOnFilter="true"
                                                        CurrentFilterFunction="Contains" Visible="false" />
                                                    <telerik:GridBoundColumn SortExpression="inserito_il" UniqueName="inserito_il" HeaderText="Inserito il"
                                                        DataField="inserito_il" HeaderStyle-Width="10%" AllowFiltering="true" ShowFilterIcon="false"
                                                        FilterControlWidth="150px" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" />
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
                                                    <telerik:GridTemplateColumn SortExpression="rf_data_produzione" UniqueName="rf_data_produzione"
                                                        HeaderText="Produzione" DataField="rf_data_produzione" HeaderStyle-Width="10%"
                                                        AllowFiltering="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblrf_data_produzione" runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridBoundColumn SortExpression="rf_descrizione" UniqueName="rf_descrizione"
                                                        HeaderText="Descrizione" DataField="rf_descrizione" HeaderStyle-Width="20%" AllowFiltering="true"
                                                        ShowFilterIcon="false" FilterControlWidth="150px" AutoPostBackOnFilter="true"
                                                        CurrentFilterFunction="Contains" ItemStyle-CssClass="additionalColumn" HeaderStyle-CssClass="additionalColumn" />
                                                    <telerik:GridTemplateColumn SortExpression="" UniqueName="rf_peso_volume_iniziale"
                                                        HeaderText="Peso e Volume" DataField="rf_peso_volume_iniziale" HeaderStyle-Width="10%"
                                                        AllowFiltering="false" ItemStyle-CssClass="additionalColumn" HeaderStyle-CssClass="additionalColumn"
                                                        visible=false>
                                                        <ItemStyle Wrap="false" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblrf_peso_volume_iniziale" runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn SortExpression="" UniqueName="rf_verificato_da_key"
                                                        HeaderText="Verificato da" DataField="rf_verificato_da_key" HeaderStyle-Width="10%"
                                                        AllowFiltering="false" ItemStyle-CssClass="additionalColumn" HeaderStyle-CssClass="additionalColumn">
                                                        <ItemStyle Wrap="false" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblrf_verificato_da_key" runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridBoundColumn SortExpression="rf_verificato_note" UniqueName="rf_verificato_note" HeaderText="Note"
                                                        DataField="rf_verificato_note" HeaderStyle-Width="25%" AllowFiltering="true" ShowFilterIcon="false"
                                                        FilterControlWidth="150px" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" />
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
                                                    <telerik:GridBoundColumn SortExpression="rs_st_denominazione" UniqueName="rs_st_denominazione"
                                                        HeaderText="Sito" DataField="rs_st_denominazione" HeaderStyle-Width="25%" AllowFiltering="true"
                                                        ShowFilterIcon="false" FilterControlWidth="150px" AutoPostBackOnFilter="true"
                                                        CurrentFilterFunction="Contains" Visible="false" />
                                                    <telerik:GridBoundColumn SortExpression="inserito_il" UniqueName="inserito_il" HeaderText="Inserito il"
                                                        DataField="inserito_il" HeaderStyle-Width="10%" AllowFiltering="true" ShowFilterIcon="false"
                                                        FilterControlWidth="150px" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" />
                                                    <telerik:GridTemplateColumn SortExpression="rs_codici_cer_cod" UniqueName="rs_codici_cer_cod"
                                                        HeaderText="CER" DataField="rs_codici_cer_cod" HeaderStyle-Width="5%" AllowFiltering="true"
                                                        ShowFilterIcon="false" FilterControlWidth="50px" AutoPostBackOnFilter="true"
                                                        CurrentFilterFunction="Contains">
                                                        <ItemStyle Wrap="false" Font-Bold="true" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblrs_codici_cer_cod" runat="server"></asp:Label>
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
                                                        AllowFiltering="false" ItemStyle-CssClass="additionalColumn" HeaderStyle-CssClass="additionalColumn"
                                                        visible="false">
                                                        <ItemStyle Wrap="false" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblrs_peso_volume" runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn SortExpression="" UniqueName="rs_verificato_da_key"
                                                        HeaderText="Verificato da" DataField="rs_verificato_da_key" HeaderStyle-Width="10%"
                                                        AllowFiltering="false" ItemStyle-CssClass="additionalColumn" HeaderStyle-CssClass="additionalColumn">
                                                        <ItemStyle Wrap="false" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblrs_verificato_da_key" runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridBoundColumn SortExpression="rs_verificato_note" UniqueName="rs_verificato_note" HeaderText="Note"
                                                        DataField="rs_verificato_note" HeaderStyle-Width="25%" AllowFiltering="true" ShowFilterIcon="false"
                                                        FilterControlWidth="150px" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" />
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
                                                </Columns>
                                            </MasterTableView>
                                            <ClientSettings EnableRowHoverStyle="true">
                                                <Selecting AllowRowSelect="false" />
                                            </ClientSettings>
                                        </telerik:RadGrid>
                                    </div>
                                </div>
                            </div>
                            <div id="div_cer" class="tab-pane" runat="server">
                                <div class="row">
                                    <div class="col-lg-12">
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
                                                    <telerik:GridBoundColumn SortExpression="rc_st_denominazione" UniqueName="rc_st_denominazione"
                                                        HeaderText="Sito" DataField="rc_st_denominazione" HeaderStyle-Width="25%" AllowFiltering="true"
                                                        ShowFilterIcon="false" FilterControlWidth="150px" AutoPostBackOnFilter="true"
                                                        CurrentFilterFunction="Contains" Visible="false" />
                                                    <telerik:GridBoundColumn SortExpression="cer_inserito_il" UniqueName="cer_inserito_il"
                                                        HeaderText="Inserito il" DataField="cer_inserito_il" HeaderStyle-Width="10%"
                                                        AllowFiltering="true" ShowFilterIcon="false" FilterControlWidth="150px" AutoPostBackOnFilter="true"
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
                                                        AllowFiltering="false" ItemStyle-CssClass="additionalColumn" HeaderStyle-CssClass="additionalColumn"
                                                        visible="false">
                                                        <ItemStyle Wrap="false" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblrf_peso_volume_iniziale" runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn SortExpression="" UniqueName="rc_verificato_da_key"
                                                        HeaderText="Verificato da" DataField="rc_verificato_da_key" HeaderStyle-Width="10%"
                                                        AllowFiltering="false" ItemStyle-CssClass="additionalColumn" HeaderStyle-CssClass="additionalColumn">
                                                        <ItemStyle Wrap="false" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblrc_verificato_da_key" runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn SortExpression="rc_verificato_note" UniqueName="rc_verificato_note" HeaderText="Note"
                                                        DataField="rc_verificato_note" HeaderStyle-Width="25%" AllowFiltering="true" ShowFilterIcon="false"
                                                        FilterControlWidth="150px" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" >
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblrc_verificato_note" runat="server"></asp:Label>
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
                                                </Columns>
                                            </MasterTableView>
                                            <ClientSettings EnableRowHoverStyle="true">
                                                <Selecting AllowRowSelect="false" />
                                            </ClientSettings>
                                        </telerik:RadGrid>
                                    </div>
                                </div>
                            </div>
                            <div id="div_carichi" class="tab-pane" runat="server">
                                <div class="row">
                                    <div class="col-lg-12">
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
                                            <MasterTableView ShowFooter="false" Width="100%" DataKeyNames="registro_rifiuti_key"
                                                AllowMultiColumnSorting="True">
                                                <Columns>
                                                    <telerik:GridTemplateColumn SortExpression="rm_st_denominazione" UniqueName="rm_st_denominazione"
                                                        HeaderText="Sito" DataField="rm_st_denominazione" HeaderStyle-Width="25%" AllowFiltering="false"
                                                         Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblrm_st_denominazione" runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridBoundColumn SortExpression="mov_inserito_il" UniqueName="mov_inserito_il"
                                                        HeaderText="Inserito il" DataField="mov_inserito_il" HeaderStyle-Width="10%"
                                                        AllowFiltering="true" ShowFilterIcon="false" FilterControlWidth="150px" AutoPostBackOnFilter="true"
                                                        CurrentFilterFunction="Contains" />
                                                    <telerik:GridTemplateColumn SortExpression="rm_data_op" UniqueName="rm_data_op" HeaderText="Data Op."
                                                        DataField="rm_data_op" HeaderStyle-Width="10%" AllowFiltering="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblrm_data_op" runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn SortExpression="rm_numero" UniqueName="rm_numero" HeaderText="Num."
                                                        DataField="rm_numero" HeaderStyle-Width="5%" AllowFiltering="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblrm_numero" runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn SortExpression="rm_fir" UniqueName="rm_fir" HeaderText="N.FIR"
                                                        DataField="rm_fir" HeaderStyle-Width="5%" AllowFiltering="true">
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
                                                    <telerik:GridTemplateColumn SortExpression="rm_cer" UniqueName="rm_cer" HeaderText="CER"
                                                        DataField="rm_cer" HeaderStyle-Width="10%" AllowFiltering="true">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblrc_codici_cer_key" runat="server" Font-Bold="true"></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn SortExpression="" UniqueName="rm_descrizione" HeaderText="Descrizione"
                                                        DataField="rm_descrizione" HeaderStyle-Width="25%" AllowFiltering="true" ItemStyle-CssClass="additionalColumn"
                                                        HeaderStyle-CssClass="additionalColumn">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblrf_descrizione" runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn SortExpression="" UniqueName="rf_peso" HeaderText="Quantità"
                                                        DataField="rf_peso" HeaderStyle-Width="5%" AllowFiltering="false" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblrf_peso" runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn SortExpression="" UniqueName="rf_peso_destino" HeaderText="Destino"
                                                        DataField="rf_peso_destino" HeaderStyle-Width="5%" AllowFiltering="false" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbrf_peso_destino" runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn SortExpression="rm_data" UniqueName="rm_data" HeaderText="Data Reg."
                                                        DataField="rm_data" HeaderStyle-Width="10%" AllowFiltering="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblrm_data" runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn SortExpression="" UniqueName="rm_verificato_da_key"
                                                        HeaderText="Verificato da" DataField="rm_verificato_da_key" HeaderStyle-Width="10%"
                                                        AllowFiltering="false" ItemStyle-CssClass="additionalColumn" HeaderStyle-CssClass="additionalColumn">
                                                        <ItemStyle Wrap="false" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblrm_verificato_da_key" runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn SortExpression="rm_verificato_note" UniqueName="rm_verificato_note" HeaderText="Note"
                                                        DataField="rm_verificato_note" HeaderStyle-Width="25%" AllowFiltering="true" ShowFilterIcon="false"
                                                        FilterControlWidth="150px" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" >
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblrm_verificato_note" runat="server"></asp:Label>
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
                                                </Columns>
                                            </MasterTableView>
                                            <ClientSettings EnableRowHoverStyle="true">
                                                <Selecting AllowRowSelect="false" />
                                            </ClientSettings>
                                        </telerik:RadGrid>
                                    </div>
                                </div>
                            </div>
                            <div id="div_scarichi" class="tab-pane" runat="server">
                                <div class="row">
                                    <div class="col-lg-12">
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
                                            <MasterTableView ShowFooter="false" Width="100%" DataKeyNames="registro_rifiuti_key"
                                                AllowMultiColumnSorting="True">
                                                <Columns>
                                                    <telerik:GridTemplateColumn SortExpression="rm_st_denominazione" UniqueName="rm_st_denominazione"
                                                        HeaderText="Sito" DataField="rm_st_denominazione" HeaderStyle-Width="25%" AllowFiltering="false"
                                                         Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblrm_st_denominazione" runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridBoundColumn SortExpression="mov_inserito_il" UniqueName="mov_inserito_il"
                                                        HeaderText="Inserito il" DataField="mov_inserito_il" HeaderStyle-Width="10%"
                                                        AllowFiltering="true" ShowFilterIcon="false" FilterControlWidth="150px" AutoPostBackOnFilter="true"
                                                        CurrentFilterFunction="Contains" />
                                                    <telerik:GridTemplateColumn SortExpression="rm_data_op" UniqueName="rm_data_op" HeaderText="Data Op."
                                                        DataField="rm_data_op" HeaderStyle-Width="10%" AllowFiltering="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblrm_data_op" runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn SortExpression="rm_numero" UniqueName="rm_numero" HeaderText="Num."
                                                        DataField="rm_numero" HeaderStyle-Width="5%" AllowFiltering="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblrm_numero" runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn SortExpression="rm_fir" UniqueName="rm_fir" HeaderText="N.FIR"
                                                        DataField="rm_fir" HeaderStyle-Width="5%" AllowFiltering="true">
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
                                                    <telerik:GridTemplateColumn SortExpression="rm_cer" UniqueName="rm_cer" HeaderText="CER"
                                                        DataField="rm_cer" HeaderStyle-Width="10%" AllowFiltering="true">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblrc_codici_cer_key" runat="server" Font-Bold="true"></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn SortExpression="" UniqueName="rm_descrizione" HeaderText="Descrizione"
                                                        DataField="rm_descrizione" HeaderStyle-Width="25%" AllowFiltering="true" ItemStyle-CssClass="additionalColumn"
                                                        HeaderStyle-CssClass="additionalColumn">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblrf_descrizione" runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn SortExpression="" UniqueName="rf_peso" HeaderText="Quantità"
                                                        DataField="rf_peso" HeaderStyle-Width="5%" AllowFiltering="false" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblrf_peso" runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn SortExpression="" UniqueName="rf_peso_destino" HeaderText="Destino"
                                                        DataField="rf_peso_destino" HeaderStyle-Width="5%" AllowFiltering="false" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbrf_peso_destino" runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn SortExpression="rm_data" UniqueName="rm_data" HeaderText="Data Reg."
                                                        DataField="rm_data" HeaderStyle-Width="10%" AllowFiltering="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblrm_data" runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn SortExpression="" UniqueName="rm_verificato_da_key"
                                                        HeaderText="Verificato da" DataField="rm_verificato_da_key" HeaderStyle-Width="10%"
                                                        AllowFiltering="false" ItemStyle-CssClass="additionalColumn" HeaderStyle-CssClass="additionalColumn">
                                                        <ItemStyle Wrap="false" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblrm_verificato_da_key" runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn SortExpression="rm_verificato_note" UniqueName="rm_verificato_note" HeaderText="Note"
                                                        DataField="rm_verificato_note" HeaderStyle-Width="25%" AllowFiltering="true" ShowFilterIcon="false"
                                                        FilterControlWidth="150px" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" >
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblrm_verificato_note" runat="server"></asp:Label>
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
                                                </Columns>
                                            </MasterTableView>
                                            <ClientSettings EnableRowHoverStyle="true">
                                                <Selecting AllowRowSelect="false" />
                                            </ClientSettings>
                                        </telerik:RadGrid>
                                    </div>
                                </div>
                            </div>
                            <div id="div_copie" class="tab-pane" runat="server">
                                <div class="row">
                                    <div class="col-lg-12">
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
                                                    <telerik:GridBoundColumn SortExpression="rs_st_denominazione" UniqueName="rs_st_denominazione"
                                                        HeaderText="Sito" DataField="rs_st_denominazione" HeaderStyle-Width="30%" AllowFiltering="true"
                                                        ShowFilterIcon="false" FilterControlWidth="150px" AutoPostBackOnFilter="true"
                                                        CurrentFilterFunction="Contains" Visible="false" />
                                                    <telerik:GridBoundColumn SortExpression="modificato_il" UniqueName="modificato_il"
                                                        HeaderText="Inserito il" DataField="modificato_il" HeaderStyle-Width="10%" AllowFiltering="true"
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
                                                    <telerik:GridBoundColumn SortExpression="registro_scarico_key" UniqueName="registro_scarico_key"
                                                        HeaderText="Mov." DataField="registro_scarico_key" HeaderStyle-Width="5%" AllowFiltering="true"
                                                        ShowFilterIcon="false" FilterControlWidth="150px" AutoPostBackOnFilter="true"
                                                        CurrentFilterFunction="Contains" />
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
                                                        AllowFiltering="false" ItemStyle-CssClass="additionalColumn" HeaderStyle-CssClass="additionalColumn"
                                                        Visible=false >
                                                        <ItemStyle Wrap="false" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblrs_peso_volume" runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn SortExpression="" UniqueName="rs_qc_verificato_da_key"
                                                        HeaderText="Verificato da" DataField="rs_qc_verificato_da_key" HeaderStyle-Width="10%"
                                                        AllowFiltering="false" ItemStyle-CssClass="additionalColumn" HeaderStyle-CssClass="additionalColumn">
                                                        <ItemStyle Wrap="false" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblrs_qc_verificato_da_key" runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridBoundColumn SortExpression="rs_qc_verificato_note" UniqueName="rs_qc_verificato_note" HeaderText="Note"
                                                        DataField="rs_qc_verificato_note" HeaderStyle-Width="25%" AllowFiltering="true" ShowFilterIcon="false"
                                                        FilterControlWidth="150px" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" />
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
                        <!-- /tab-content -->
                    </div>
                    <! --/panel-body -->
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Start/GisRI.Master"
    CodeBehind="Movimenti.aspx.vb" Inherits="GisRI_Web.fMovimenti" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Src="../Controls/rTextBox.ascx" TagName="rTextBox" TagPrefix="cc" %>
<%@ Register Src="../Controls/rTextData.ascx" TagName="rTextData" TagPrefix="cc" %>
<%@ Register Src="../Controls/rTextNumero.ascx" TagName="rTextNumero" TagPrefix="cc" %>
<%@ Register Src="../Controls/rDropDown.ascx" TagName="rDropDown" TagPrefix="cc" %>
<%@ Register Src="../Controls/rCheckBox.ascx" TagName="rCheckBox" TagPrefix="cc" %>
<%@ Register Src="../Controls/rRadioButton.ascx" TagName="rRadioButton" TagPrefix="cc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function grid_search(sender, eventArgs, uniqueName) {
            eventArgs.cancelBubble = true;
            eventArgs.returnValue = false;
            if (eventArgs.stopPropagation) {
                eventArgs.stopPropagation();
                eventArgs.preventDefault();
            }
            var masterTableView = $find("<%= RGMovimentiRegistri.ClientID %>").get_masterTableView();

            if (uniqueName == "rm_tipologia") {
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
    <div style="height:10px;"></div>
    <div class="row">
        <div class="col-lg-12">
            <div class="content-panel" style="padding-left:10px!Important;padding-top:0px!Important; margin-bottom:10px;">
                <div class="row" style="min-height:40px!Important;">
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
            <div class="content-panel" id="panel_elenco" runat="server" visible="true" style="padding-left:10px!Important;padding-top:0px!Important; margin-bottom:10px;">
                <div class="row" style="min-height:50px!Important;">
                    <div class="gisri_panel_title gisri_title_margin">
                        <div class="gisri_title_left">
                            <asp:LinkButton ID="btn_filtri" runat="server" CssClass="btn btn-default"
                                ToolTip="Visualizza maschera dei filtri" Style="padding-top:6px; padding-left:10px;">
                                <i class="fa fa-filter"></i>
                            </asp:LinkButton>
                        </div>
                        <div class="gisri_title_left">
                            <h3 style="padding-left: 10px; margin-top: 0px!Important;">
                                ELENCO MOVIMENTI DEL REGISTRO: <asp:Literal ID="ltl_registro" runat="server"></asp:Literal> </h3>
                        </div>
                    </div>
                </div>
                <div class="row" id="div_filtri" runat="server" visible="false">
                    <div class="form-body" style="margin-left: 30px!Important; margin-right: 35px!Important; margin-bottom:10px;">
                        <div class="row">
                            <div class="col-xs-2 gisri_row_filter">
                                <div>
                                    <asp:DropDownList ID="ddl_filter_tipologia" runat="server" CssClass="form-control gisri_form_filter placeholder"
                                        onChange="grid_search(this, event, 'rm_tipologia');" >
                                        <asp:ListItem Text="Tipologia" Value=""></asp:ListItem>
                                        <asp:ListItem Text="Carico" Value="Carico"></asp:ListItem>
                                        <asp:ListItem Text="Scarico" Value="Scarico"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-xs-3 gisri_row_filter">
                                <div>
                                    <asp:TextBox ID="txt_filter_descrizione" runat="server" CssClass="form-control gisri_form_filter"
                                        placeholder="Descrizione" onChange="grid_search(this, event, 'rm_descrizione');" ></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-xs-2 gisri_row_filter">
                                <div>
                                    <asp:TextBox ID="txt_filter_cer" runat="server" CssClass="form-control gisri_form_filter"
                                        placeholder="CER" onChange="grid_search(this, event, 'rm_cer');" ></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-xs-2 gisri_row_filter">
                                <div>
                                    <asp:TextBox ID="txt_filter_fir" runat="server" CssClass="form-control gisri_form_filter"
                                        placeholder="FIR" onChange="grid_search(this, event, 'rm_fir');" ></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-xs-2 gisri_row_filter">
                                <div>
                                    <asp:TextBox ID="txt_filter_rif" runat="server" CssClass="form-control gisri_form_filter"
                                        placeholder="Rif. Carico" onChange="grid_search(this, event, 'rm_riferimento');" ></asp:TextBox>
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
                <div class=" table-container">
                    <telerik:RadGrid ID="RGMovimentiRegistri" AutoGenerateColumns="False" CssClass="" runat="server"
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
                                <telerik:GridTemplateColumn SortExpression="rm_tipologia" UniqueName="rm_tipologia"
                                    HeaderText="Tipologia" DataField="rm_tipologia" HeaderStyle-Width="10%" AllowFiltering="true"
                                    ShowFilterIcon="false" FilterControlWidth="150px" AutoPostBackOnFilter="true"
                                    CurrentFilterFunction="Contains">
                                    <ItemTemplate>
                                        <asp:Label ID="lblrm_tipologia" runat="server"></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
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
                                    HeaderText="Descrizione" DataField="rm_descrizione" HeaderStyle-Width="30%" AllowFiltering="true"
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
                                <telerik:GridTemplateColumn UniqueName="rf_stato_allegati" SortExpression="" DataField=""
                                    InitializeTemplatesFirst="false" HeaderStyle-Width="1%" HeaderText="" AllowFiltering="false" >
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btn_allegati" runat="server" CssClass="btn btn-primary btn-xs button-link-w gisri_button_list"
                                            CommandName="ZIP" Style="padding-bottom:3px; padding-top:3px; padding-right:2px;">
                                            <i class=" fa fa-paperclip"></i>
                                        </asp:LinkButton>
                                        <asp:Hyperlink ID="lnk_allegati" runat="server" Target="_blank" Style="width: 100%;">
                                        </asp:Hyperlink>
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
            <!-- /content-panel lista-->
        </div>
        <!-- /col-md-12 -->
    </div>
    <!-- /row -->
    <iframe id="ifZip" runat="server" src="" style="display: none;"></iframe>
</asp:Content>

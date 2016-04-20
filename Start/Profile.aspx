<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Start/GisRI.Master"
    CodeBehind="Profile.aspx.vb" Inherits="GisRI_Web.Profile" EnableEventValidation="false" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Src="../Controls/rTextBox.ascx" TagName="rTextBox" TagPrefix="cc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body_up" runat="server">
    <div class="row mt">
        <div class="col-lg-12">
            <div class="content-panel" id="panel_dati" runat="server">
                <h3 style="padding-left: 10px; margin-top: 0px!Important;">
                    <i class="fa fa-angle-right"></i>PROFILO UTENTE DI:
                    <asp:Label ID="ltl_rs_denominazione" runat="server" /></h3>
            </div>
            <!-- /content-panel dettali-->
            <div style="margin: 10px;">
            </div>
            <div class="col-sm-3" style="padding-left: 0px!Important; padding-right: 0px!Important;">
                <div class="content-panel">
                    <div class="panel-body">
                        <div style="width:100%; text-align:center;">
                            <div style="width:250px;height:250px;overflow:hidden; margin: 0 auto;">
                                <asp:ImageButton ID="img_dipendente" runat="server" Style=" width:100%; min-width:200px;" />
                            </div>
                            <ul class="nav nav-pills nav-stacked mail-nav">
                                <li id="li_dati" runat="server" class="gisri_mail-nav-btn active">
                                    <asp:LinkButton ID="btn_dati" runat="server" CssClass="btn btn-compose gisri_mail-nav-btn">
                                        <i class="fa fa-user"></i> Dati Personali
                                    </asp:LinkButton>
                                </li>
                                <li id="li_siti" runat="server" class="gisri_mail-nav-btn">
                                    <asp:LinkButton ID="btn_siti" runat="server" CssClass="btn btn-compose gisri_mail-nav-btn">
                                        <i class="fa fa-building-o"></i> Siti
                                    </asp:LinkButton>
                                </li>
                                <li id="li_password" runat="server">
                                    <asp:LinkButton ID="btn_password" runat="server" CssClass="btn btn-compose gisri_mail-nav-btn">
                                        <i class="fa fa-lock"></i> Cambio Password
                                    </asp:LinkButton>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-9" style="padding-right: 0px!Important;">
                <div class="content-panel">
                    <div style="margin-left: 15px!Important; margin-right: 15px!Important;">
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
                    <div class="panel-body minimal">
                        <div class="form-body" style="margin-left: 15px!Important; margin-right: 15px!Important;"
                            id="div_dati" runat="server">
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
                                <div class="col-md-12">
                                    <cc:rTextBox ID="txt_dp_ditta" runat="server" MaxLength="128" AutoPostBack="false"
                                        Label="Società" Icon="" Form_Vertical="true" Read_Only="true" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <cc:rTextBox ID="txt_dp_telefono" runat="server" MaxLength="15" AutoPostBack="false"
                                        Label="Telefono" Icon="" Form_Vertical="true" />
                                </div>
                                <div class="col-md-6">
                                    <cc:rTextBox ID="txt_dp_cellulare" runat="server" MaxLength="15" AutoPostBack="false"
                                        Label="Cellulare" Icon="" Form_Vertical="true" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <cc:rTextBox ID="txt_dp_email" runat="server" MaxLength="60" AutoPostBack="false"
                                        Label="Mail Aziendale" Icon="fa fa-envelope" Form_Vertical="true" Required="true"
                                        Required_Help="Email obbligatoria!" />
                                </div>
                                <div class="col-md-6">
                                </div>
                            </div>
                            <div style="height: 20px;">
                            </div>
                            <div class="form-actions right">
                                <asp:LinkButton ID="btn_registra" runat="server" CssClass="btn btn-primary">
                                        <i class="fa fa-check"></i> Salva
                                </asp:LinkButton>
                            </div>
                        </div>
                        <div class="form-body" style="margin-left: 15px!Important; margin-right: 15px!Important;" id="div_siti" runat="server">
                            <h3 id="h_titolarita" runat="server">SITI SU CUI HAI UNA TITOLARITA</h3>
                            <telerik:RadGrid ID="RGSitiACT" AutoGenerateColumns="False" CssClass="" runat="server"
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
                                        <telerik:GridBoundColumn SortExpression="st_codice_interno" UniqueName="st_codice_interno"
                                            HeaderText="Codice" DataField="st_codice_interno" HeaderStyle-Width="5%" AllowFiltering="true"
                                            ShowFilterIcon="false" FilterListOptions="VaryByDataType" />
                                        <telerik:GridTemplateColumn UniqueName="st_denominazione" SortExpression="st_denominazione"
                                            InitializeTemplatesFirst="false" HeaderStyle-Width="25%" HeaderText="Sito" DataField="st_denominazione"
                                            AllowFiltering="true">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btn_st_denominazione" runat="server" CommandName="HOME" CssClass="button-link-b"></asp:LinkButton>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn UniqueName="st_provincia_desc" SortExpression="st_provincia_desc"
                                            InitializeTemplatesFirst="false" HeaderStyle-Width="15%" HeaderText="Prov." DataField="st_provincia_desc"
                                            AllowFiltering="true">
                                            <HeaderStyle CssClass="additionalColumn" />
                                            <ItemStyle CssClass="additionalColumn" />
                                            <ItemTemplate>
                                                <asp:Label ID="lblst_provincia_desc" runat="server"></asp:Label>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn UniqueName="st_comune_desc" SortExpression="st_comune_desc"
                                            InitializeTemplatesFirst="false" HeaderStyle-Width="15%" HeaderText="Comune" DataField="st_comune_desc"
                                            AllowFiltering="true">
                                            <HeaderStyle CssClass="additionalColumn" />
                                            <ItemStyle CssClass="additionalColumn" />
                                            <ItemTemplate>
                                                <asp:Label ID="lbst_comune_desc" runat="server"></asp:Label>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridBoundColumn SortExpression="st_titolarita_dip_desc" UniqueName="st_titolarita_dip_desc"
                                            HeaderText="Ruolo" DataField="st_titolarita_dip_desc" HeaderStyle-Width="5%" AllowFiltering="true"
                                            ShowFilterIcon="false" FilterListOptions="VaryByDataType" />
                                        <telerik:GridTemplateColumn UniqueName="TemplateColumnSc" SortExpression="" InitializeTemplatesFirst="true"
                                            HeaderStyle-Width="1%" AllowFiltering="false" Groupable="false">
                                            <ItemStyle Wrap="false" HorizontalAlign="Right" />
                                            <HeaderStyle Wrap="true" HorizontalAlign="Right" />
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btn_home" runat="server" CssClass="btn btn-success btn-xs button-link-w"
                                                    CommandName="HOME">
                                                            <i class=" fa fa-home"></i>&nbsp;HOME</i>
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                    </Columns>
                                </MasterTableView>
                                <ClientSettings>
                                    <Selecting AllowRowSelect="false" />
                                    <ClientEvents OnRowDblClick="RowDblClick" />
                                </ClientSettings>
                            </telerik:RadGrid>
                            <h3 id="h_visibilita" runat="server" style="margin-top:15px;">SITI CON DIRITTI ATTIVATI PER L'UTENTE</h3>
                            <telerik:RadGrid ID="RGSitiSTO" AutoGenerateColumns="False" CssClass="" runat="server"
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
                                        <telerik:GridBoundColumn SortExpression="st_codice_interno" UniqueName="st_codice_interno"
                                            HeaderText="Codice" DataField="st_codice_interno" HeaderStyle-Width="5%" AllowFiltering="true"
                                            ShowFilterIcon="false" FilterListOptions="VaryByDataType" />
                                        <telerik:GridTemplateColumn UniqueName="st_denominazione" SortExpression="st_denominazione"
                                            InitializeTemplatesFirst="false" HeaderStyle-Width="25%" HeaderText="Sito" DataField="st_denominazione"
                                            AllowFiltering="true">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btn_st_denominazione" runat="server" CommandName="HOME" CssClass="button-link-b"></asp:LinkButton>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn UniqueName="st_provincia_desc" SortExpression="st_provincia_desc"
                                            InitializeTemplatesFirst="false" HeaderStyle-Width="15%" HeaderText="Prov." DataField="st_provincia_desc"
                                            AllowFiltering="true">
                                            <HeaderStyle CssClass="additionalColumn" />
                                            <ItemStyle CssClass="additionalColumn" />
                                            <ItemTemplate>
                                                <asp:Label ID="lblst_provincia_desc" runat="server"></asp:Label>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn UniqueName="st_comune_desc" SortExpression="st_comune_desc"
                                            InitializeTemplatesFirst="false" HeaderStyle-Width="15%" HeaderText="Comune" DataField="st_comune_desc"
                                            AllowFiltering="true">
                                            <HeaderStyle CssClass="additionalColumn" />
                                            <ItemStyle CssClass="additionalColumn" />
                                            <ItemTemplate>
                                                <asp:Label ID="lbst_comune_desc" runat="server"></asp:Label>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn UniqueName="TemplateColumnSc" SortExpression="" InitializeTemplatesFirst="true"
                                            HeaderStyle-Width="1%" AllowFiltering="false" Groupable="false">
                                            <ItemStyle Wrap="false" HorizontalAlign="Right" />
                                            <HeaderStyle Wrap="true" HorizontalAlign="Right" />
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btn_home" runat="server" CssClass="btn btn-success btn-xs button-link-w"
                                                    CommandName="HOME">
                                                            <i class=" fa fa-home"></i>&nbsp;HOME</i>
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                    </Columns>
                                </MasterTableView>
                                <ClientSettings>
                                    <Selecting AllowRowSelect="false" />
                                    <ClientEvents OnRowDblClick="RowDblClick" />
                                </ClientSettings>
                            </telerik:RadGrid>
                        </div>
                        <div class="form-body" style="margin-left: 15px!Important; margin-right: 15px!Important;" id="div_password" runat="server">
                            <div class="row">
                                <div class="col-md-12">
                                    <cc:rTextBox ID="txt_username" runat="server" MaxLength="64" AutoPostBack="false"
                                        Label="User Name" Icon="" Form_Vertical="true" Read_Only="true" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <cc:rTextBox ID="txt_act_password" runat="server" MaxLength="32" AutoPostBack="false"
                                        Label="Password attuale" Icon="fa fa-lock" Form_Vertical="true" TextMode="Password" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <cc:rTextBox ID="txt_new_password" runat="server" MaxLength="32" AutoPostBack="false"
                                        Label="Nuova password" Icon="fa fa-lock" Form_Vertical="true" TextMode="Password" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <cc:rTextBox ID="txt_rty_password" runat="server" MaxLength="32" AutoPostBack="false"
                                        Label="Conferma nuova password" Icon="fa fa-lock" Form_Vertical="true" TextMode="Password" />
                                </div>
                            </div>
                            <div style="height: 20px;">
                            </div>
                            <div class="form-actions right">
                                <asp:LinkButton ID="btn_change_password" runat="server" CssClass="btn btn-primary">
                                        <i class="fa fa-check"></i> Modifica
                                </asp:LinkButton>
                            </div>
                        </div>
                        <div class="form-body" style="margin-left: 15px!Important; margin-right: 15px!Important;" id="div_immagine" runat="server">
                            <div class="row">
                                <div class="col-md-12">
                                    <telerik:RadAsyncUpload runat="server" ID="img_upload" MultipleFileSelection="Disabled" Culture="it-IT" Localization-Select="Seleziona"
                                        AllowedFileExtensions="jpg,png,jpeg,gif" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                <asp:LinkButton ID="btn_carica" runat="server" CssClass="btn btn-primary">
                                        <i class="fa fa-check"></i> Carica
                                </asp:LinkButton>
                                </div>
                            </div>
                            <div style="height: 20px;">
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <asp:LinkButton ID="btn_cancella_foto" runat="server" CssClass="btn btn-danger button-link-w">
                                            <i class=" fa fa-trash-o"></i>&nbsp;Cancella Immagine
                                    </asp:LinkButton>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

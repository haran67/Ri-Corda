<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Start/GisRI.Master" EnableEventValidation="false"
    CodeBehind="Esportazione_mud.aspx.vb" Inherits="GisRI_Web.Esportazione_mud" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Src="../Controls/rTextData.ascx" TagName="rTextData" TagPrefix="cc" %>
<%@ Register Src="../Controls/rDropDown.ascx" TagName="rDropDown" TagPrefix="cc" %>
<%@ Register Src="../Controls/cAllegati.ascx" TagName="cAllegati" TagPrefix="cc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style>@media (max-width: 768px) { .btn {width: 100% !important;}}</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div style="height:10px;"></div>
    <div class="row">
        <div class="col-lg-12">
            <div class="content-panel">
                <h2 style="margin:0px!Important;">
                    <asp:Literal ID="ltl_st_denominazione" runat="server">Elenco delle movimentazioni sui registri</asp:Literal></h2>
            </div>
        </div>
        <div class="col-lg-12">
            <div class="content-panel" style="padding:10px!Important;">
                <div style="margin:20px;" >
                    <h4 style="font-weight:bold; margin:0px; margin-bottom:5px;">Seleziona Produttore o Sito </h4>
                    <div class="form-body" style="">
                        <div id="div_titolarita" runat="server">
                            <div class="row">
                                <div class="col-md-4">
                                    <cc:rDropDown ID="ddL_st_produttore" runat="server" AutoPostBack="false" Select2="true"
                                        Label="" Placeholder="Seleziona..." Form_Vertical="true" />
                                </div>
                                <div class="col-md-4">
                                    <cc:rDropDown ID="ddl_st_sito" runat="server" AutoPostBack="false" Select2="true"
                                        Label="" Placeholder="Seleziona..." Form_Vertical="true" />
                                </div>
                                <div class="col-md-2">
                                    <label class="control-label col-md-3" style="white-space:nowrap;" id="label_control" runat="server">
                                    </label>
                                    <asp:LinkButton ID="btn_aggiorna" runat="server" CssClass="btn btn-primary">
                                        <i class="fa fa-check"></i> Aggiorna Report
                                    </asp:LinkButton>
                                </div>
                                <div class="col-md-2">
                                    <label class="control-label col-md-3" style="white-space:nowrap;" id="label_control_1" runat="server">
                                    </label>
                                    <asp:LinkButton ID="btn_esporta" runat="server" CssClass="btn btn-success">
                                        <i class="fa fa-download"></i> Esporta dati
                                    </asp:LinkButton>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <asp:Repeater ID="rpt_siti" runat="server">
                    <ItemTemplate>
                        <h3 style="color:#666;font-weight:bold;">
                            <asp:Image ID="img_societa" runat="server" ImageUrl="../favicon/android-icon-192x192.png" Height="40" Style="padding-bottom:5px;" />
                            <asp:Literal ID="ltl_sc_ragione_sociale" runat="server"></asp:Literal>
                        </h3>
                        <h4 style="margin:0px!Important; font-weight:bold;"><asp:Literal ID="ltl_st_denominazione" runat="server"></asp:Literal></h4>
                        <div class="overflow">
                            <telerik:RadGrid ID="dg_movimenti" AutoGenerateColumns="true" CssClass="" style="width: 100% !important" runat="server"
                                ShowFooter="false" AllowPaging="True" AllowSorting="false" GridLines="None" PageSize="5"
                                Width="100%" AllowMultiRowSelection="false" Skin="MyCustomSkin" EnableEmbeddedSkins="false"
                                AllowFilteringByColumn="false" Culture="it-IT"
                                OnNeedDataSource="RGMovimenti_NeedDataSource" >
                                <PagerStyle Mode="NextPrevAndNumeric" CssClass=""></PagerStyle>
                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                <AlternatingItemStyle CssClass="" HorizontalAlign="Left"></AlternatingItemStyle>
                                <MasterTableView ShowFooter="false" Width="100%" DataKeyNames="" AllowMultiColumnSorting="True">
                                </MasterTableView>
                            </telerik:RadGrid>
                        </div>
                        <hr />
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
</asp:Content>

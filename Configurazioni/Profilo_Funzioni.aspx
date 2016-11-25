<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Start/GisRI.Master"
    CodeBehind="Profilo_Funzioni.aspx.vb" Inherits="GisRI_Web.Profilo_Funzioni" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Src="../Controls/rTextBox.ascx" TagName="rTextBox" TagPrefix="cc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">

        function Init_Dirty() {
            $("#<%=div_overview.ClientID%>").dirtyForms();
            $("#<%=div_visibilita.ClientID%>").dirtyForms();
        }

    </script>
    <style>@media (max-width: 768px) { .btn {width: 100% !important;}}</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body_up" runat="server">
    <div class="row mt">
        <div class="col-md-12">
            <div class="content-panel" id="panel_dati" runat="server" style="padding-left: 10px!Important;
                padding-top: 0px!Important; margin-bottom: 10px;">
                <div class="row" style="min-height: 40px!Important;">
                    <div class="gisri_panel_title gisri_title_margin">
                        <div class="gisri_title_left">
                            <h3 style="padding-left: 10px; margin-top: 0px!Important;">
                                <i class="fa fa-angle-right"></i>PROFILATURA FUNZIONI</h3>
                        </div>
                        <div class="gisri_button_right" id="div_ritorno" runat="server">
                        </div>
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
                                    data-toggle="tab" href="#<%=div_overview.ClientID%>" class="tab-font">Profili Funzioni</a>
                                </li>
                                <li id="li_visibilita" runat="server"><a data-toggle="tab" href="#<%=div_visibilita.ClientID%>"
                                    class="tab-font">Profili Siti</a> </li>
                            </ul>
                        </div>
                        <! --/panel-heading -->
                        <div class="panel-body">
                            <div class="tab-content">
                                <div id="div_overview" class="tab-pane active" runat="server">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <asp:Repeater ID="rpt_profili" runat="server">
                                                <ItemTemplate>
                                                    <div class="row">
                                                        <div class="col-lg-12">
                                                            <cc:rTextBox ID="txt_tab_profilo_desc" runat="server" MaxLength="256" AutoPostBack="false"
                                                                Label="Denominazione" Icon="" Form_Vertical="true"/>
                                                        </div>
                                                    </div>
                                                    <div class="row" id="div_funzioni" runat="server" visible="false">
                                                        <div class="col-lg-12">
                                                            <h5>FUNZIONI</h5>
                                                            <div class="overflow">
                                                                <asp:Repeater ID="rpt_funzioni_padre" runat="server" OnItemDataBound="rpt_funzioni_padre_ItemDataBound">
                                                                    <HeaderTemplate>
                                                                        <table class="table table-striped table-advance table-hover">
                                                                            <thead>
                                                                                <tr>
                                                                                    <th style="width: 1%;"></th>
                                                                                    <th style="width: 5%;">
                                                                                        Numero
                                                                                    </th>
                                                                                    <th style="width: 10%;">
                                                                                        Menu
                                                                                    </th>
                                                                                    <th style="width: 20%;">
                                                                                        Gruppo Funzione
                                                                                    </th>
                                                                                    <th style="width: 5%;">
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
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-lg-12">
                                                            <asp:LinkButton ID="btn_open" runat="server" CssClass="btn btn-warning btn-xs"
                                                                CommandName="OPEN">
                                                                <i class="fa fa-check"></i> Dettagli
                                                            </asp:LinkButton>
                                                            <asp:LinkButton ID="btn_registra" runat="server" CssClass="btn btn-primary btn-xs"
                                                                CommandName="SAL">
                                                                <i class="fa fa-check"></i> Salva
                                                            </asp:LinkButton>
                                                            <asp:LinkButton ID="btn_cancella" runat="server" CssClass="btn btn-danger btn-xs"
                                                                CommandName="DEL">
                                                                <i class="fa fa-trash-o"></i> Cancella
                                                            </asp:LinkButton>
                                                        </div>
                                                    </div>
                                                    <hr />
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            <div class="row" style="margin-top:20px;">
                                                <div class="col-lg-12">
                                                    <asp:LinkButton ID="btn_Aggiungi" runat="server" CssClass="btn btn-primary"
                                                        CommandName="ADD">
                                                        <i class="fa fa-plus"></i> Aggiungi
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
                                            <asp:Repeater ID="rpt_profili_siti" runat="server">
                                                <ItemTemplate>
                                                    <div class="row">
                                                        <div class="col-lg-12">
                                                            <cc:rTextBox ID="txt_tab_profilo_siti_desc" runat="server" MaxLength="256" AutoPostBack="false"
                                                                Label="Denominazione" Icon="" Form_Vertical="true"/>
                                                        </div>
                                                    </div>
                                                    <div class="row" id="div_funzioni" runat="server" visible="false">
                                                        <div class="col-lg-12">
                                                            <h5>SITI</h5>
                                                            <div class="overflow">
                                                                <asp:Repeater ID="rpt_siti" runat="server" OnItemDataBound="rpt_siti_ItemDataBound">
                                                                    <HeaderTemplate>
                                                                        <table class="table table-striped table-advance table-hover">
                                                                            <thead>
                                                                                <tr>
                                                                                    <th style="width: 1%;"></th>
                                                                                    <th style="width: 10%; white-space:nowrap;">
                                                                                        Codice
                                                                                    </th>
                                                                                    <th style="width: 40%;">
                                                                                        Sito
                                                                                    </th>
                                                                                    <th style="width: 30%;">
                                                                                        Città
                                                                                    </th>
                                                                                    <th style="width: 20%;">
                                                                                        Provincia
                                                                                    </th>
                                                                                </tr>
                                                                            </thead>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <tbody>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:CheckBox ID="chk_scelta" runat="server" />
                                                                                    <asp:Label ID="lbl_sito_key" runat="server" Visible="false"></asp:Label>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:Label ID="lbl_st_codice_interno" runat="server"></asp:Label>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:Label ID="lbl_st_denominazione" runat="server"></asp:Label>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:Label ID="lbl_st_comune_desc" runat="server"></asp:Label>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:Label ID="lbl_st_provincia_desc" runat="server"></asp:Label>
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
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-lg-12">
                                                            <asp:LinkButton ID="btn_open" runat="server" CssClass="btn btn-warning btn-xs"
                                                                CommandName="OPEN">
                                                                <i class="fa fa-check"></i> Dettagli
                                                            </asp:LinkButton>
                                                            <asp:LinkButton ID="btn_registra" runat="server" CssClass="btn btn-primary btn-xs"
                                                                CommandName="SAL">
                                                                <i class="fa fa-check"></i> Salva
                                                            </asp:LinkButton>
                                                            <asp:LinkButton ID="btn_cancella" runat="server" CssClass="btn btn-danger btn-xs"
                                                                CommandName="DEL">
                                                                <i class="fa fa-trash-o"></i> Cancella
                                                            </asp:LinkButton>
                                                        </div>
                                                    </div>
                                                    <hr />
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            <div class="row" style="margin-top:20px;">
                                                <div class="col-lg-10">
                                                    <asp:LinkButton ID="btn_aggiungi_profilo_siti" runat="server" CssClass="btn btn-primary"
                                                        CommandName="ADD">
                                                        <i class="fa fa-plus"></i> Aggiungi
                                                    </asp:LinkButton>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <! --/OVERVIEW -->
                                </div>
                                <! --/tab-pane -->
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
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>

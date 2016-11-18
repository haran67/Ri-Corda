<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Start/GisRI.Master"
    CodeBehind="Tabelle_Supporto.aspx.vb" Inherits="GisRI_Web.Tabelle_Supporto" EnableEventValidation="false" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Src="../Controls/rTextBox.ascx" TagName="rTextBox" TagPrefix="cc" %>
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
        }

        function Init_Dirty() {
            $("#<%=div_documenti.ClientID%>").dirtyForms();
            $("#<%=div_siti.ClientID%>").dirtyForms();
            $("#<%=div_ruoli.ClientID%>").dirtyForms();
            $("#<%=div_alert.ClientID%>").dirtyForms();
        }
    </script>
    <style>@media (max-width: 768px) { .btn {width: 100% !important;}}</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body_up" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <div class="content-panel" id="panel_dati" runat="server">
                <h3 style="padding-left: 10px; margin-top: 0px!Important;">
                    <i class="fa fa-angle-right"></i>TABELLE DI SUPPORTO</h3>
            </div>
            <!-- /content-panel dettali-->
            <div style="margin: 10px;">
            </div>
            <div class="col-sm-3 conf-menu">
                <div class="content-panel" style="padding-top:0px!Important;">
                    <div class="panel-body"  style="padding-top:0px!Important;">
                        <div style="width:100%; text-align:center; padding-top:5px;">
                            ELENCO TABELLE
                            <ul class="nav nav-pills nav-stacked mail-nav">
                                <li id="li_documenti" runat="server" class="gisri_mail-nav-btn active">
                                    <asp:LinkButton ID="btn_documenti" runat="server" CssClass="btn btn-compose gisri_mail-nav-btn">
                                        <i class="fa fa-angle-right"></i> Tipo Documenti
                                    </asp:LinkButton>
                                </li>
                                <li id="li_siti" runat="server" class="gisri_mail-nav-btn">
                                    <asp:LinkButton ID="btn_siti" runat="server" CssClass="btn btn-compose gisri_mail-nav-btn">
                                        <i class="fa fa-angle-right"></i> Tipologia Siti
                                    </asp:LinkButton>
                                </li>
                                <li id="li_ruoli" runat="server" class="gisri_mail-nav-btn">
                                    <asp:LinkButton ID="btn_ruoli" runat="server" CssClass="btn btn-compose gisri_mail-nav-btn">
                                        <i class="fa fa-angle-right"></i> Ruoli Aziendali
                                    </asp:LinkButton>
                                </li>
                                <li id="li_alert" runat="server" class="gisri_mail-nav-btn">
                                    <asp:LinkButton ID="btn_alert" runat="server" CssClass="btn btn-compose gisri_mail-nav-btn">
                                        <i class="fa fa-angle-right"></i> Alert
                                    </asp:LinkButton>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-9 conf-content">
                <div class="content-panel">
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
                    </div>
                    <div class="panel-body minimal">
                        <div id="div_documenti" runat="server">
                            <div class="form-body">
                                <h3>TIPO DI DOCUMENTI</h3>
                                <div class="overflow">
                                    <table class="table table-striped table-advance table-hover">
                                        <thead>
                                            <tr>
                                                <th style="width: 50%;">
                                                    Relativo a
                                                </th>
                                                <th style="width: 50%;">
                                                    Descrizione
                                                </th>
                                                <th style="width: 1%;">
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:Repeater ID="rpt_tipo_documenti" runat="server">
                                                <ItemTemplate>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="lbl_tab_tipo_documento_gruppo" runat="server"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="lbl_tab_tipo_documento_desc" runat="server"></asp:Label>
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
                            </div>
                            <div class="">
                                <div class="form-body">
                                    <div id="div_modifica_tipo_documento" runat="server">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <hr />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <cc:rDropDown ID="ddl_tab_tipo_documento_gruppo" runat="server" AutoPostBack="false"
                                                    Label="Gruppo del documento" Placeholder="Seleziona..." Form_Vertical="true" Required="true"
                                                    Required_Help="gruppo obbligatorio!" />
                                            </div>
                                            <div class="col-md-6">
                                                <cc:rTextBox ID="txt_tab_tipo_documento_desc" runat="server" MaxLength="128" AutoPostBack="false"
                                                    Label="Descrizione" Icon="" Form_Vertical="true" Required="true" Required_Help="descrizione obbligatoria!" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-actions right">
                                <asp:LinkButton ID="btn_registra_tipo_documento" runat="server" CssClass="btn btn-primary">
                                    <i class="fa fa-check"></i> Salva
                                </asp:LinkButton>
                                <asp:LinkButton ID="btn_nuovo_documento" runat="server" CssClass="btn btn-primary">
                                    <i class="fa fa-plus"></i> Aggiungi
                                </asp:LinkButton>
                            </div>
                            <asp:Label ID="lbl_tab_tipo_documento_cod" runat="server" Visible="false"></asp:Label>
                        </div>
                        <div id="div_siti" runat="server">
                            <div class="form-body">
                                <h3>TIPOLOGIA DEI SITI</h3>
                                <div class="overflow">
                                    <table class="table table-striped table-advance table-hover">
                                        <thead>
                                            <tr>
                                                <th style="width: 30%;">
                                                    Società
                                                </th>
                                                <th style="width: 20%;">
                                                    Codice
                                                </th>
                                                <th style="width: 50%;">
                                                    Descrizione
                                                </th>
                                                <th style="width: 1%;">
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:Repeater ID="rpt_tipologia_sito" runat="server">
                                                <ItemTemplate>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="lbl_tab_tipologia_sito_societa" runat="server"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="lbl_tab_tipologia_sito_cod" runat="server"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="lbl_tab_tipologia_sito_desc" runat="server"></asp:Label>
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
                            </div>
                            <div class="">
                                <div class="form-body">
                                    <div id="div_modifica_tipologia_sito" runat="server">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <hr />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <cc:rDropDown ID="ddl_tab_tipologia_sito_societa" runat="server" AutoPostBack="false"
                                                    Label="Società" Placeholder="Seleziona..." Form_Vertical="true" Required="true"
                                                    Required_Help="Società obbligatoria!" />
                                            </div>
                                            <div class="col-md-6">
                                                <cc:rTextBox ID="txt_tab_tipologia_sito_cod" runat="server" MaxLength="3" AutoPostBack="false"
                                                    Label="Codice" Icon="" Form_Vertical="true" Required="true" Required_Help="Codice obbligatorio!" />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <cc:rTextBox ID="txt_tab_tipologia_sito_desc" runat="server" MaxLength="128" AutoPostBack="false"
                                                    Label="Descrizione" Icon="" Form_Vertical="true" Required="true" Required_Help="Descrizione obbligatoria!" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-actions right">
                                <asp:LinkButton ID="btn_registra_tipologia_sito" runat="server" CssClass="btn btn-primary">
                                    <i class="fa fa-check"></i> Salva
                                </asp:LinkButton>
                                <asp:LinkButton ID="btn_nuova_tipologia_sito" runat="server" CssClass="btn btn-primary">
                                    <i class="fa fa-plus"></i> Aggiungi
                                </asp:LinkButton>
                            </div>
                            <asp:Label ID="lbl_tab_tipologia_sito_key" runat="server" Visible="false"></asp:Label>
                        </div>
						<div id="div_ruoli" runat="server">
                            <div class="form-body">
                                <h3>RUOLI AZIENDALI</h3>
                                <div class="overflow">
                                    <table class="table table-striped table-advance table-hover">
                                        <thead>
                                            <tr>
                                                <th style="width: 40%;">
                                                    Relativo a
                                                </th>
                                                <th style="width: 50%;">
                                                    Descrizione
                                                </th>
                                                <th style="width: 10%;">
                                                    Ordinamento
                                                </th>
                                                <th style="width: 1%;">
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:Repeater ID="rpt_ruoli_aziendali" runat="server">
                                                <ItemTemplate>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="lbl_tab_ruolo_aziendale_tipo" runat="server"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="lbl_tab_ruolo_aziendale_desc" runat="server"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="lbl_tab_ruolo_aziendale_order" runat="server"></asp:Label>
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
                            </div>
                            <div class="">
                                <div class="form-body">
                                    <div id="div_modifica_ruolo_aziendale" runat="server">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <hr />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <cc:rDropDown ID="ddl_tab_ruolo_aziendale_tipo" runat="server" AutoPostBack="false"
                                                    Label="Gruppo del ruolo" Placeholder="Seleziona..." Form_Vertical="true" Required="true"
                                                    Required_Help="Gruppo obbligatorio!" />
                                            </div>
                                            <div class="col-md-6">
                                                <cc:rTextBox ID="txt_tab_ruolo_aziendale_order" runat="server" MaxLength="128" AutoPostBack="false"
                                                    Label="Ordinamento" Icon="" Form_Vertical="true" Required="true" Required_Help="Ordinamento obbligatoria!" />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <cc:rTextBox ID="txt_tab_ruolo_aziendale_desc" runat="server" MaxLength="128" AutoPostBack="false"
                                                    Label="Descrizione" Icon="" Form_Vertical="true" Required="true" Required_Help="Descrizione obbligatoria!" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-actions right">
                                <asp:LinkButton ID="btn_registra_ruolo_aziendale" runat="server" CssClass="btn btn-primary">
                                    <i class="fa fa-check"></i> Salva
                                </asp:LinkButton>
                                <asp:LinkButton ID="btn_nuovo_ruolo_aziendale" runat="server" CssClass="btn btn-primary">
                                    <i class="fa fa-plus"></i> Aggiungi
                                </asp:LinkButton>
                            </div>
                            <asp:Label ID="lbl_tab_ruolo_aziendale_cod" runat="server" Visible="false"></asp:Label>
                        </div>
                        <div id="div_alert" runat="server">
                            <div class="form-body">
                                <h3>TIPO ALERT</h3>
                                <div class="overflow">
                                    <table class="table table-striped table-advance table-hover">
                                        <thead>
                                            <tr>
                                                <th style="width: 30%;">
                                                    Alert
                                                </th>
                                                <th style="width: 5%;">
                                                    Attivo
                                                </th>
                                                <th style="width: 5%;">
                                                    Mail
                                                </th>
                                                <th style="width: 15%;">
                                                    Cadenza
                                                </th>
                                                <th style="width: 15%;">
                                                    Giorno
                                                </th>
                                                <th style="width: 30%;">
                                                    Ruolo
                                                </th>
                                                <th style="width: 1%;">
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:Repeater ID="rpt_alert" runat="server">
                                                <ItemTemplate>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="lbl_alert_titolo" runat="server"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="lbl_alert_attivo" runat="server"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="lbl_alert_mail" runat="server"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="lbl_alert_cadenza" runat="server"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="lbl_alert_giorno" runat="server"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="lbl_alert_ruolo_aziendale" runat="server"></asp:Label>
                                                        </td>
                                                        <td style="white-space: nowrap;">
                                                            <asp:LinkButton ID="btn_scheda" runat="server" CssClass="btn btn-primary btn-xs button-link-w"
                                                                CommandName="SCHEDA">
                                                            <i class=" fa fa-edit"></i>&nbsp;Modifica</i>
                                                            </asp:LinkButton>
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="">
                                <div class="form-body">
                                    <div id="div_modifica_alert" runat="server">

                                        <div class="row">
                                            <div class="col-md-12">
                                                <hr />
                                            </div>
                                        </div>
                                        <div class="row" id="div_societa_gestione" runat="server">
                                            <div class="col-md-12">
                                                <cc:rDropDown ID="ddl_societa_gestione_key" runat="server" AutoPostBack="false"
                                                    Label="Societa Gestione" Placeholder="Seleziona..." Form_Vertical="true" Required="true"
                                                    Required_Help="societa gestione obbligatorio!" />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <cc:rTextBox ID="txt_alert_titolo" runat="server" MaxLength="128" AutoPostBack="false"
                                                    Label="Titolo" Icon="" Form_Vertical="true" Required="true" Required_Help="titolo obbligatorio!" />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <cc:rCheckBox ID="chk_attivo" runat="server" Values="S|" Classes="make-switch|SI|NO|success|"
                                                    Label="Attivo" AutoPostBack="false" Checked="false" Form_Vertical="true" />
                                            </div>
                                            <div class="col-md-6">
                                                <cc:rCheckBox ID="chk_mail" runat="server" Values="S|" Classes="make-switch|SI|NO|success|"
                                                    Label="Invia Mail" AutoPostBack="false" Checked="false" Form_Vertical="true" />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <cc:rDropDown ID="ddl_alert_cadenza" runat="server" AutoPostBack="false"
                                                    Label="Frequenza" Placeholder="Seleziona..." Form_Vertical="true" Required="true"
                                                    Required_Help="societa gestione obbligatorio!" />
                                            </div>
                                            <div class="col-md-6">
                                                <cc:rDropDown ID="ddl_alert_giorno" runat="server" AutoPostBack="false"
                                                    Label="Giorno di invio" Placeholder="Seleziona..." Form_Vertical="true" Required="true"
                                                    Required_Help="societa gestione obbligatorio!" />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <cc:rTextNumero ID="txt_alert_giorno_fisso" runat="server" MaxLength="128" AutoPostBack="false"
                                                    Label="Giorno puntuale di invio" CifreDecimali="0" Icon="" Form_Vertical="true" Required="false" />
                                            </div>
                                            <div class="col-md-6">
                                                <cc:rTextNumero ID="txt_alert_scadenza" runat="server" MaxLength="128" AutoPostBack="false"
                                                    Label="Parametro scadenza" CifreDecimali="0" Icon="" Form_Vertical="true" Required="false" />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <cc:rDropDown ID="ddl_alert_ruolo_aziendale_tipo" runat="server" AutoPostBack="true"
                                                    Label="Gruppo " Placeholder="Seleziona..." Form_Vertical="true"  />
                                            </div>
                                            <div class="col-md-6">
                                                <cc:rDropDown ID="ddl_alert_ruolo_aziendale_cod" runat="server" AutoPostBack="false"
                                                    Label="Ruolo aziendale" Placeholder="Seleziona..." Form_Vertical="true"  />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-actions right">
                                <asp:LinkButton ID="btn_registra_alert" runat="server" CssClass="btn btn-primary">
                                    <i class="fa fa-check"></i> Salva
                                </asp:LinkButton>
                            </div>
                            <asp:Label ID="lbl_tab_alert_key" runat="server" Visible="false"></asp:Label>
                            <asp:Label ID="lbl_alert_funzione" runat="server" Visible="false"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

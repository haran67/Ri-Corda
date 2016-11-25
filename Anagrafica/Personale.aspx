<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Start/GisRI.Master"
    CodeBehind="Personale.aspx.vb" Inherits="GisRI_Web.fPersonale" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Src="../Controls/rTextBox.ascx" TagName="rTextBox" TagPrefix="cc" %>
<%@ Register Src="../Controls/rTextData.ascx" TagName="rTextData" TagPrefix="cc" %>
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
    </script>
    <style>@media (max-width: 768px) { .btn {width: 100% !important;}}</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body_up" runat="server">
    <div class="row mt">
        <div class="col-lg-12">
            <div class="content-panel" style="padding-left:10px!Important;padding-top:0px!Important; margin-bottom:10px;">
                <div class="row" style="min-height:50px!Important;">
                    <div class="gisri_panel_title gisri_title_margin">
                        <div class="gisri_title_left">
                            <h3 style="margin:0px!Important;">
                                <asp:Literal ID="ltl_denominazione" runat="server"></asp:Literal>
                            </h3>
                        </div>
                        <div class="gisri_button_right">
                            <asp:LinkButton ID="btn_return" runat="server" ToolTip="Torna all'elenco" CssClass="btn btn-warning"><i class="fa fa-angle-left"></i>&nbsp;&nbsp;Torna indietro</asp:LinkButton>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-12">
            <div class="content-panel" id="panel_dati" runat="server" visible="false" style="padding-left:10px!Important;padding-top:0px!Important; margin-bottom:10px;">
                <div class="row" style="min-height:40px!Important;">
                    <div class="gisri_panel_title gisri_title_margin">
                        <div class="gisri_title_left">
                            <h3 style="padding-left: 10px; margin-top: 0px!Important;">
                                <i class="fa fa-angle-right"></i>DETTAGLIO DIPENDENTE</h3>
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
                        <div class="panel-body">
                            <div class="tab-content">
                                <div id="div_overview" class="tab-pane active" runat="server">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="form-body">
                                                <h6><asp:Label ID="ltl_ultima_modifica" runat="server"></asp:Label></h6>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <cc:rTextBox ID="txt_dp_cognome" runat="server" MaxLength="64" AutoPostBack="false"
                                                            Label="Cognome" Icon="" Form_Vertical="true" Required="true" Required_Help="Cognome dipendente obbligatorio!" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <cc:rTextBox ID="txt_dp_nome" runat="server" MaxLength="64" AutoPostBack="false"
                                                            Label="Nome" Icon="" Form_Vertical="true" Required="true" Required_Help="Nome dipendente obbligatorio!" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <cc:rTextBox ID="txt_dp_codicefiscale" runat="server" MaxLength="16" AutoPostBack="false"
                                                            Label="Codice Fiscale" Icon="" Form_Vertical="true" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <cc:rTextBox ID="txt_dp_email" runat="server" MaxLength="60" AutoPostBack="false"
                                                            Label="Mail Aziendale" Icon="fa fa-envelope" Form_Vertical="true" Required="true" Required_Help="Email dipendente obbligatoria!" />
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
                                                        <cc:rTextBox ID="txt_dp_matricola" runat="server" MaxLength="12" Label="Matricola" Form_Vertical="true" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <cc:rDropDown ID="ddl_dp_ruolo_aziendale_cod" runat="server" AutoPostBack="false"
                                                            Label="Ruolo Aziendale" Placeholder="Seleziona..." Form_Vertical="true" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <cc:rCheckBox ID="chk_dp_attivo" runat="server" Values="S|" Classes="make-switch|SI|NO|success|danger"
                                                            Label="Attivo" AutoPostBack="false" Checked="false" Form_Vertical="true" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="control-label" style="white-space: nowrap;">
                                                                Fotografia</label>
                                                            <div>
                                                                <div class="col-sm-4">
                                                                    <div class="centered img-circle" style="width:100px;height:100px;overflow:hidden; margin: 0 auto;">
                                                                        <asp:Image ID="img_dp_foto" runat="server" Width="100" class="img-responsive" />
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-8">
                                                                    <telerik:RadAsyncUpload runat="server" ID="img_upload" MultipleFileSelection="Disabled" Culture="it-IT" Localization-Select="Seleziona"
                                                                        AllowedFileExtensions="jpg,png,jpeg,gif" />
                                                                    <asp:LinkButton ID="btn_cancella_foto" runat="server" CssClass="btn btn-danger btn-xs button-link-w">
                                                                            <i class=" fa fa-trash-o"></i>&nbsp;Cancella
                                                                    </asp:LinkButton>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <cc:rTextBox ID="txt_dp_note" runat="server" TextMode="MultiLine" Rows="3" MaxLength="40"
                                                            AutoPostBack="false" Label="Note" Icon="" Form_Vertical="true" />
                                                    </div>
                                                </div>
                                                <div class="form-actions right">
                                                    <asp:LinkButton ID="btn_registra" runat="server" CssClass="btn btn-primary">
                                                            <i class="fa fa-check"></i> Salva
                                                    </asp:LinkButton>
                                                    <asp:LinkButton ID="btn_nuovo" runat="server" CssClass="btn btn-primary">
                                                            <i class="fa fa-plus"></i>&nbsp;&nbsp;Salva e Nuovo
                                                    </asp:LinkButton>
                                                    <asp:LinkButton ID="btn_cancella" runat="server" CssClass="btn btn-danger">
                                                            <i class="fa fa-trash-o"></i> Cancella
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

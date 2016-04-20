<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Start/GisRI.Master"
    CodeBehind="Conferma.aspx.vb" Inherits="GisRI_Web.fConferma" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Src="../Controls/rTextBox.ascx" TagName="rTextBox" TagPrefix="cc" %>
<%@ Register Src="../Controls/rTextData.ascx" TagName="rTextData" TagPrefix="cc" %>
<%@ Register Src="../Controls/rDropDown.ascx" TagName="rDropDown" TagPrefix="cc" %>
<%@ Register Src="../Controls/rCheckBox.ascx" TagName="rCheckBox" TagPrefix="cc" %>
<%@ Register Src="../Controls/rRadioButton.ascx" TagName="rRadioButton" TagPrefix="cc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function Init_bootstrapSwitch() {
            if (!$().bootstrapSwitch) {
                return;
            }
            $('.make-switch').bootstrapSwitch();
            $('[data-toggle="tooltip"]').tooltip();
        }
        function Init_Dirty() {
            $("#<%=div_overview.ClientID%>").dirtyForms();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body_up" runat="server">
    <div class="row mt">
        <div style="height:10px;"></div> 
        <div class="col-lg-12">
            <div class="content-panel" style="padding-left:10px!Important;padding-top:0px!Important; margin-bottom:10px;">
                <div class="row" style="height:39px!Important;">
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
            <div class="content-panel" id="panel_dati" runat="server" style="display: none;">
                <h3 style="padding-left: 10px; margin-top: 0px!Important;">
                    <i class="fa fa-angle-right"></i>CONFERMA CODICE CER</h3>
                <div style="margin: 10px;">
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
                                            <div class="form-body" style="margin-left: 30px!Important; margin-right: 30px!Important;">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <cc:rTextBox ID="txt_rc_codici_cer_cod_pre" runat="server" MaxLength="16" AutoPostBack="false"
                                                            Read_Only="true" Label="Codice Presunto" Icon="" Text="" Form_Vertical="true" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <cc:rTextBox ID="txt_rf_rifiuto_stato_fisico_pre" runat="server" MaxLength="32" AutoPostBack="false"
                                                            Read_Only="true" Label="Stato fisico iniziale" Icon="" Text="" Form_Vertical="true" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12" id="div_classi_pericolosita_presunte" runat="server">
                                                        <cc:rTextBox ID="txt_rc_classi_pericolosita_pre" runat="server" MaxLength="16" AutoPostBack="false"
                                                            Read_Only="true" Label="Classe di pericolosità presunta" Icon="" Text="" Form_Vertical="true" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <cc:rTextBox ID="txt_rf_descrizione" runat="server" MaxLength="4000" AutoPostBack="false"
                                                            Read_Only="true" Label="Descrizione" TextMode="MultiLine" Rows="2" Icon="" Text=""
                                                            Form_Vertical="true" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <cc:rDropDown ID="ddl_rc_codici_cer_key" runat="server" AutoPostBack="true" Label="Codice CER"
                                                            Placeholder="Seleziona..." Form_Vertical="true" Select2="true" 
                                                            Required="true" Required_Help="Codice CER obbligatorio!" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <cc:rDropDown ID="ddl_rf_rifiuto_stato_fisico_cod" runat="server" AutoPostBack="false" Label="Stato fisico finale"
                                                            Placeholder="Seleziona..." Form_Vertical="true" 
                                                            Required="true" Required_Help="Stato fisico finale obbligatorio!" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12" id="div_classi_pericolosita" runat="server">
                                                        <div class="form-body">
                                                            <label class="control-label" style="white-space:nowrap;font-weight:bold;">
                                                                Classi di pericolosità</label>
                                                            <asp:Repeater ID="rpt_con_classi_pericolosita" runat="server">
                                                                <HeaderTemplate>
                                                                    <div class="form-inline">
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <div class="form-group" style="white-space:normal; padding:5px; vertical-align:top;">
                                                                        <label class="control-label red-tooltip" style="white-space:;" id="label_control" runat="server"
                                                                            data-toggle="tooltip" data-placement="top" title="">
                                                                            <i class="fa fa-info-circle gisri_fa_color_info"></i>
                                                                            &nbsp;<asp:Literal ID="ltl_rc_classi_pericolosita_cod" runat="server"></asp:Literal>
                                                                            </label>
                                                                        <div style="max-width:150px;">
                                                                            <div class="checkbox-list" style="padding-top:0px;">
                                                                                <asp:CheckBox ID="chk_rc_classi_pericolosita_key" runat="server" />
                                                                            </div>
                                                                            <span style="font-size:10px;">
                                                                                <asp:Literal ID="ltl_rc_classi_pericolosita_desc" runat="server" Visible="false"></asp:Literal>
                                                                            </span> 
                                                                        </div>
                                                                    </div>
                                                                    <asp:Label ID="rc_classi_pericolosita_key" runat="server" Visible="false"></asp:Label>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    </div>
                                                                </FooterTemplate>
                                                            </asp:Repeater>
                                                            <div class="form-group has-error">
                                                            <span class="help-block" id="span_per_con_help" runat="server">
                                                                <asp:Literal ID="ltl_per_con_help" runat="server"></asp:Literal></span>
                                                            </div> 
                                                        </div> 
                                                    </div>
                                                </div>
                                                <div class="form-actions right">
                                                    <asp:LinkButton ID="btn_registra" runat="server" CssClass="btn btn-primary">
                                                            <i class="fa fa-check"></i> Conferma
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

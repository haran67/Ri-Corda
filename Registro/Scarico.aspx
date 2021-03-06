<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Start/GisRI.Master"
    CodeBehind="Scarico.aspx.vb" Inherits="GisRI_Web.fScarico" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Src="../Controls/rTextBox.ascx" TagName="rTextBox" TagPrefix="cc" %>
<%@ Register Src="../Controls/rTextData.ascx" TagName="rTextData" TagPrefix="cc" %>
<%@ Register Src="../Controls/rDropDown.ascx" TagName="rDropDown" TagPrefix="cc" %>
<%@ Register Src="../Controls/rCheckBox.ascx" TagName="rCheckBox" TagPrefix="cc" %>
<%@ Register Src="../Controls/rRadioButton.ascx" TagName="rRadioButton" TagPrefix="cc" %>
<%@ Register Src="../Controls/cFileUpload.ascx" TagName="cFileUpload" TagPrefix="cc" %>
<%@ Register Src="../Controls/cAllegati.ascx" TagName="cAllegati" TagPrefix="cc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../assets/js/fancybox/jquery.fancybox.css" rel="stylesheet" />
    <script type="text/javascript">
        function Init_Dirty() {
            $("#<%=div_overview.ClientID%>").dirtyForms();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body_up" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <div class="content-panel" style="padding-left:10px!Important;padding-top:0px!Important; margin-bottom:10px;">
                <div class="row clearix">
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
                    <i class="fa fa-angle-right"></i>SCARICO SUL REGISTRO</h3>
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
                        <div class="panel-heading">
                            <ul class="nav nav-tabs nav-justified">
                                <li class="active" id="li_overview" runat="server"><a data-toggle="tab" href="#<%=div_overview.ClientID%>"
                                    class="tab-font">Dati Scarico</a> </li>
                                <li id="li_allegati" runat="server"><a data-toggle="tab" href="#<%=div_allegati.ClientID%>"
                                    class="tab-font">Allegati</a> </li>
                            </ul>
                        </div>
                        <! --/panel-heading -->
                        <div class="panel-body">
                            <div class="tab-content">
                                <div id="div_overview" class="tab-pane active" runat="server">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="form-body">
                                                <h6><asp:Label ID="ltl_ultima_modifica" runat="server"></asp:Label></h6>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <cc:rTextBox ID="txt_rs_rifiuto_cer_cod" runat="server" MaxLength="16" AutoPostBack="false"
                                                            Read_Only="true" Label="Codice Rifiuto" Icon="" Text="" Form_Vertical="true" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <cc:rTextBox ID="txt_rs_peso_iniziale" runat="server" MaxLength="16" AutoPostBack="false"
                                                            Read_Only="true" Text="" Label="Quantita" Icon="" Form_Vertical="true" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <cc:rTextBox ID="txt_rs_formulario_numero" runat="server" MaxLength="16" AutoPostBack="false"
                                                            Read_Only="true" Label="Formulario Num." Icon="" Text="" Form_Vertical="true" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <cc:rTextBox ID="txt_rs_formulario_data" runat="server" MaxLength="10" AutoPostBack="false"
                                                            Read_Only="true" Label="Del" Icon="fa fa-calendar" Text="" Form_Vertical="true" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <cc:rTextBox ID="txt_rs_riferimenti_carico" runat="server" MaxLength="16" AutoPostBack="false"
                                                            Read_Only="true" Label="Rif Carico." Icon="" Text="" Form_Vertical="true" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <cc:rTextBox ID="txt_rs_data_trasporto" runat="server" MaxLength="16" AutoPostBack="false"
                                                            Read_Only="true" Label="Data trasporto" Icon="fa fa-calendar" Text="" Form_Vertical="true" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <cc:rDropDown ID="ddl_registro_rifiuti_key" runat="server" AutoPostBack="true" 
                                                            Label="Registro Scarico"
                                                            Placeholder="Seleziona..." Form_Vertical="true" 
                                                            Required="true" Required_Help="Registro scarico obbligatorio!" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <cc:rTextData ID="txt_rm_data" runat="server" MaxLength="10" AutoPostBack="false"
                                                            Label="Data Registrazione" Icon="fa fa-calendar" Form_Vertical="true" 
                                                            Required="true" Required_Help="Data obbligatoria!" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <cc:rTextBox ID="txt_rm_numero" runat="server" MaxLength="16" AutoPostBack="false"
                                                            Read_Only="true" Label="Progressivo" Icon="" Form_Vertical="true" 
                                                            Required="true" Required_Help="Progressivo obbligatorio!" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <cc:rTextBox ID="txt_rm_numero_scritto" runat="server" MaxLength="32" AutoPostBack="false"
                                                            Label="Progressivo alternativo/integrato" Icon="" Form_Vertical="true" 
                                                            Required="true" Required_Help="Numero sul registro obbligatorio!" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <cc:rDropDown ID="ddl_rm_personale_indicante_key" runat="server" AutoPostBack="false"
                                                            Label="Personale Indicante" Placeholder="Seleziona..." Form_Vertical="true" 
                                                            Required="true" Required_Help="Personale indicante obbligatorio!" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div id="div_doc_upload" runat="server" class="form-group" visible="false">
                                                            <label style="white-space:nowrap;font-weight:bold;" class="control-label">
                                                                Copia digitale dell�annotazione dello scarico nel RCS</label>
                                                            <div id="">
                                                                <div id="" class="">
                                                                    <telerik:RadAsyncUpload runat="server" ID="doc_upload" MultipleFileSelection="Disabled" Culture="it-IT" Localization-Select="Seleziona"
                                                                        AllowedFileExtensions="jpg,png,jpeg,gif,pdf,doc,docx"/>
                                                                </div>
                                                                <span class="help-block" id="span_allegato" runat="server" visible="false">
                                                                    Allegato obbligatorio!
                                                                </span>
                                                            </div>
                                                        </div>
                                                        <cc:rTextBox ID="txt_doc_upload" runat="server" Label="File caricato" Read_Only="false"
                                                            Visible="false" Form_Vertical="true" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <cc:rTextBox ID="txt_rm_note" runat="server" MaxLength="40" Label="Note" TextMode="MultiLine"
                                                            Rows="4" Visible="true" Form_Vertical="true" />
                                                    </div>
                                                </div>
                                                <div class="form-actions right">
                                                    <asp:LinkButton ID="btn_registra" runat="server" CssClass="btn btn-primary">
                                                            <i class="fa fa-check"></i> Salva
                                                    </asp:LinkButton>
                                                    <asp:LinkButton ID="btn_cancella" runat="server" CssClass="btn btn-danger">
                                                            <i class="fa fa-trash-o"></i> Cancella
                                                    </asp:LinkButton>
                                                    <asp:LinkButton ID="btn_scheda" runat="server" CssClass="btn btn-warning">
                                                            <i class="fa fa-external-link"></i> Dettaglio FIR
                                                    </asp:LinkButton>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <! --/OVERVIEW -->
                                </div>
                                <div id="div_allegati" class="tab-pane" runat="server">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="form-horizontal">
                                                <div class="form-body" style="margin-left: 0px!Important; margin-right: 0px!Important;">
                                                    <cc:cAllegati ID="cAllegati1" runat="server" />
                                                </div>
                                                <div class="form-actions right">
                                                    <asp:LinkButton ID="btn_allega" runat="server" CssClass="btn btn-primary">
                                                <i class="fa fa-plus"></i> Carica Files
                                                    </asp:LinkButton>
                                                </div>
                                            </div>
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
            <!-- /content-panel dettali-->
        </div>
        <!-- /col-md-12 -->
    </div>
    <!-- /row -->
	<script type="text/javascript" src="../assets/js/fancybox/jquery.fancybox.js"></script>    

    <script type="text/javascript">
        $(function () {
            //    fancybox
            jQuery(".fancybox").fancybox();
        });

    </script>
  
</asp:Content>
<asp:Content ID="ttt" runat="server" ContentPlaceHolderID="body">
    <cc:cFileUpload ID="cFileUpload" runat="server" />
</asp:Content>

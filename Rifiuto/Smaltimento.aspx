<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Start/GisRI.Master"
    CodeBehind="Smaltimento.aspx.vb" Inherits="GisRI_Web.fSmaltimento" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Src="../Controls/rTextBox.ascx" TagName="rTextBox" TagPrefix="cc" %>
<%@ Register Src="../Controls/rTextData.ascx" TagName="rTextData" TagPrefix="cc" %>
<%@ Register Src="../Controls/rTextNumero.ascx" TagName="rTextNumero" TagPrefix="cc" %>
<%@ Register Src="../Controls/rDropDown.ascx" TagName="rDropDown" TagPrefix="cc" %>
<%@ Register Src="../Controls/rCheckBox.ascx" TagName="rCheckBox" TagPrefix="cc" %>
<%@ Register Src="../Controls/rRadioButton.ascx" TagName="rRadioButton" TagPrefix="cc" %>
<%@ Register Src="../Controls/cFileUpload.ascx" TagName="cFileUpload" TagPrefix="cc" %>
<%@ Register Src="../Controls/cAllegati.ascx" TagName="cAllegati" TagPrefix="cc" %>

<%@ Register TagPrefix="cc" Namespace="GisRI_Classi.Controls" Assembly="GisRI_Classi" %>

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
        function Init_Dirty() {
            $("#<%=div_overview.ClientID%>").dirtyForms();
            $("#<%=div_viaggi.ClientID%>").dirtyForms();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body_up" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <div class="content-panel clearfix">
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
                            <asp:LinkButton ID="btn_return" runat="server" ToolTip="Torna indietro" CssClass="btn btn-warning"><i class="fa fa-angle-left"></i>&nbsp;&nbsp;Torna Indietro</asp:LinkButton>
                        </div>
                    </div>
                </div> 
            </div> 
        </div> 
        <div class="col-md-12">
            <div class="content-panel" id="panel_dati" runat="server">
                <h3 style="padding-left: 10px; margin-top: 0px!Important;">
                    <i class="fa fa-angle-right"></i>DETTAGLIO FIR: <asp:Label ID="ltl_rs_denominazione" runat="server" /></h3>
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
                                    class="tab-font">Dati Destino</a> </li>
                                <li id="li_viaggi" runat="server" visible="false"><a data-toggle="tab" href="#<%=div_viaggi.ClientID%>"
                                    class="tab-font">Dati Trasporto</a> </li>
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
                                                        <cc:rTextBox ID="txt_rs_formulario_numero" runat="server" MaxLength="32" AutoPostBack="false"
                                                            Label="Formulario Num" Icon="" Form_Vertical="true" 
                                                            Required="true" Required_Help="Numero FIR obbligatorio!" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <cc:rTextData ID="txt_rs_formulario_data" runat="server" MaxLength="10" AutoPostBack="false"
                                                            Label="Formulario Data" Icon="fa fa-calendar" Form_Vertical="true" 
                                                            Required="true" Required_Help="Data del FIR obbligatoria!" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <cc:rDropDown ID="ddl_rs_destinatario_key" runat="server" AutoPostBack="true" Label="Destinatario"
                                                            Placeholder="Seleziona..." Form_Vertical="true" 
                                                            Required="true" Required_Help="Smaltitore del rifiuto obbligatorio!" />
                                                    </div>
                                                    <div class="col-md-6">
                                                    </div>
                                                </div>
                                                <div class="row" id="div_autorizzazione_sito_visible" runat="server">
                                                    <div class="col-md-6">
                                                        <cc:rDropDown ID="ddl_rs_destinatario_sito_key" runat="server" AutoPostBack="true"
                                                            Label="Sito Destinazione" Placeholder="Seleziona..." Form_Vertical="true" 
                                                            Required="true" Required_Help="Sito di destinazione obbligatorio!" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <cc:rDropDown ID="ddl_rs_autorizzazione_sito_key" runat="server" AutoPostBack="false"
                                                            Label="Autorizzazione Destinatario" Placeholder="Seleziona..." Form_Vertical="true" 
                                                            Required="true" Required_Help="Nessuna autorizzazione allo smaltimento in corso di validità selezionata!" />
                                                    </div>
                                                </div>
                                                <!--VIAGGI INIZO-->
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <cc:rDropDown ID="ddl_rs_rifiuto_destinazione_cod" runat="server" AutoPostBack="false"
                                                            Label="Tipo destinazione" Placeholder="Seleziona..." Form_Vertical="true" 
                                                            Required="true" Required_Help="Destinazione del rifiuto obbligatoria!" />
                                                    </div>
                                                    <div class="col-md-6">
                                                    </div>
                                                </div>
                                                <!--VIAGGI FINE-->
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <cc:rDropDown ID="ddl_rs_produttore_key" runat="server" AutoPostBack="false" Label="Produttore"
                                                            Placeholder="Seleziona..." Form_Vertical="true" 
                                                            Required="true" Required_Help="Produttore rifuto obbligatorio!" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <cc:rDropDown ID="ddl_rs_codici_cer_key" runat="server" AutoPostBack="true" Label="Rifiuto (CER)"
                                                            Placeholder="Seleziona..." Form_Vertical="true" 
                                                            Required="true" Required_Help="Codice CER obbligatorio!" />
                                                    </div>
                                                </div>
                                                <div class="row" id="div_dettagli_smaltimento" runat="server" visible="false">
                                                    <div class="col-md-12 overflow">
                                                        <table class="table table-striped table-advance table-hover">
                                                            <thead>
                                                                <tr>
                                                                    <th style="width: 10%;">
                                                                        N° Carico
                                                                    </th>
                                                                    <th style="width: 10%;">
                                                                        Del
                                                                    </th>
                                                                    <th style="width: 15%;">
                                                                        Quantità Caricata
                                                                    </th>
                                                                    <th style="width: 15%;">
                                                                        Smaltito alla data
                                                                    </th>
                                                                    <th style="width: 20%;">
                                                                        Da smaltire
                                                                    </th>
                                                                    <th style="width: 5%;">
                                                                        UM
                                                                    </th>
                                                                    <th style="width: 20%;">
                                                                        Volume
                                                                    </th>
                                                                    <th style="width: 5%;">
                                                                        UM
                                                                    </th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <asp:Repeater ID="rpt_dettaglio_smaltimenti" runat="server">
                                                                    <ItemTemplate>
                                                                        <tr class="gisri_table_smaltimento">
                                                                            <td>
                                                                                <asp:Label ID="lbl_rm_numero" runat="server"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="lbl_rf_data_produzione" runat="server"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="lbl_rf_peso_iniziale" runat="server" Visible="false"></asp:Label>
                                                                                <asp:Label ID="lbl_rf_peso_iniziale_desc" runat="server"></asp:Label>
                                                                                &nbsp;/&nbsp;
                                                                                <asp:Label ID="lbl_rf_volume_iniziale" runat="server" Visible="false"></asp:Label>
                                                                                <asp:Label ID="lbl_rf_volume_iniziale_desc" runat="server"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="lbl_rsd_peso_smaltito" runat="server" Visible="false"></asp:Label>
                                                                                <asp:Label ID="lbl_rsd_peso_smaltito_desc" runat="server"></asp:Label>
                                                                                &nbsp;/&nbsp;
                                                                                <asp:Label ID="lbl_rsd_volume_smaltito" runat="server" Visible="false"></asp:Label>
                                                                                <asp:Label ID="lbl_rsd_volume_smaltito_desc" runat="server"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="lbl_rifiuto_key" runat="server" Visible="false"></asp:Label>
                                                                                <asp:Label ID="lbl_rifiuto_smaltimento_dettagli_key" runat="server" Visible="false"></asp:Label>
                                                                                <cc:rTextNumero ID="txt_rs_peso_iniziale" Form_Vertical="true" runat="server" CssClass="form-control" CifreDecimali="1" />
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="lbl_rs_peso_misura_cod" runat="server" Visible="false"></asp:Label>
                                                                                <asp:Label ID="lbl_rs_peso_misura_desc" runat="server" Font-Bold="true"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <cc:rTextNumero ID="txt_rs_volume_iniziale" Form_Vertical="true" runat="server" CssClass="form-control" CifreDecimali="1" />
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="lbl_rs_volume_misura_cod" runat="server" Visible="false"></asp:Label>
                                                                                <asp:Label ID="lbl_rs_volume_misura_desc" runat="server" Font-Bold="true"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                    </ItemTemplate>
                                                                </asp:Repeater>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6" id="div_trasportatore" runat="server">
                                                        <cc:rDropDown ID="ddl_rs_trasportatore_key" runat="server" AutoPostBack="true" Label="Trasportatore"
                                                            Placeholder="Seleziona..." Form_Vertical="true" 
                                                            Required="true" Required_Help="Trasportatore del rifiuto obbligatorio!" />
                                                    </div>
                                                    <div class="col-md-6" id="div_autorizzazione_trasporto_visibile" runat="server">
                                                        <cc:rDropDown ID="ddl_rs_autorizzazione_trasp_key" runat="server" AutoPostBack="false"
                                                            Label="Autorizzazione Trasporto" Placeholder="Seleziona..." Form_Vertical="true" 
                                                            Required="true" Required_Help="Nessuna autorizzazione al trasporto in corso di validità selezionata!" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <cc:rDropDown ID="ddl_rs_intermediario_key" runat="server" AutoPostBack="true" Label="Intermediario"
                                                            Placeholder="Seleziona..." Form_Vertical="true" />
                                                    </div>
                                                    <div class="col-md-6" id="div_autorizzazione_intermiedario_visibile" runat="server">
                                                        <cc:rDropDown ID="ddl_rs_autorizzazione_inter_key" runat="server" AutoPostBack="false"
                                                            Label="Autorizzazione Intermediario" Placeholder="Seleziona..." Form_Vertical="true" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <cc:rDropDown ID="ddl_rs_rifiuto_imballaggio_cod" runat="server" AutoPostBack="false"
                                                            Label="Imballaggio" Placeholder="Seleziona..." Form_Vertical="true" 
                                                            Required="true" Required_Help="Tipo Imballo del rifiuto obbligatorio!" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <cc:rTextBox ID="txt_rs_rifiuto_imballaggio_altro" runat="server" MaxLength="256" AutoPostBack="false"
                                                            Label="Note Imballaggio" Icon="" Form_Vertical="true" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <cc:rTextBox ID="txt_rs_imballaggio_quantita" runat="server" MaxLength="16" AutoPostBack="false"
                                                            Label="Colli" Icon="" Form_Vertical="true" 
                                                            Required="true" Required_Help="Quantità imballaggio obbligatorio!" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <cc:rCheckBox ID="chk_rs_peso_stimato" runat="server" Values="S|" Classes="make-switch|SI|NO|success|"
                                                            Label="Peso da verificare a destino" AutoPostBack="false" Checked="true" Form_Vertical="true" />
                                                    </div>
                                                </div>
                                                <!--VIAGGI INIZO-->
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <cc:rCheckBox ID="chk_rs_adr" runat="server" Values="S|" Classes="make-switch|SI|NO|success|"
                                                            Label="ADR" AutoPostBack="true" Checked="false" Form_Vertical="true" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <cc:rTextBox ID="txt_rs_adr_note" runat="server" MaxLength="4000" AutoPostBack="false"
                                                            Label="Note ADR" Icon="" Form_Vertical="true" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <cc:rTextBox ID="txt_rs_percorso" runat="server" MaxLength="16" AutoPostBack="false"
                                                            Label="Dettagli percorso" TextMode="MultiLine" Rows="2" Icon="" Form_Vertical="true" />
                                                    </div>
                                                </div>
                                                <!--VIAGGI FINE-->
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <cc:rTextBox ID="txt_rs_nominativo_firmatario" runat="server" MaxLength="128" AutoPostBack="false"
                                                            Label="Firmatario" Icon="" Form_Vertical="true" 
                                                            Required="true" Required_Help="Nome del firmatario del FIR obbligatorio!" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <cc:rDropDown ID="ddl_rs_personale_indicante_key" runat="server" AutoPostBack="false"
                                                            Label="Personale Indicante" Placeholder="Seleziona..." Form_Vertical="true" 
                                                            Required="true" Required_Help="Personale indicante obbligatorio!" />
                                                    </div>
                                                </div>
                                                
                                                <!--VIAGGI INIZO-->
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <cc:rTextBox ID="txt_rs_targa_mezzo_motrice" runat="server" MaxLength="7" AutoPostBack="false"
                                                            Label="Targa Motrice/Autocarro" Icon="" Form_Vertical="true" 
                                                            Required="true" Required_Help="Targa del mezzo obbligatoria!" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <cc:rTextBox ID="txt_rs_targa_rimorchio" runat="server" MaxLength="7" AutoPostBack="false"
                                                            Label="Targa Rimorchio" Icon="" Form_Vertical="true" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <cc:rTextData ID="txt_rs_data_trasporto" runat="server" MaxLength="10" AutoPostBack="false"
                                                            Label="Data Trasporto" Icon="fa fa-calendar" Form_Vertical="true" 
                                                            Required="true" Required_Help="Data del trasporto obbligatoria!" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <cc:rTextBox ID="txt_rs_ora_trasporto" runat="server" MaxLength="5" AutoPostBack="false"
                                                            Label="Ora Trasporto" Icon="fa fa-clock-o" Form_Vertical="true" Placeholder="HH:MM" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <cc:rTextBox ID="txt_rs_nominativo_conducente" runat="server" MaxLength="128" AutoPostBack="false"
                                                            Label="Conducente" Icon="" Form_Vertical="true" 
                                                            Required="true" Required_Help="Nome del conducente obbligatorio!" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div id="div_doc_upload" runat="server" class="form-group" visible="false">
                                                            <label style="white-space:nowrap;font-weight:bold;" class="control-label">
                                                                Prima copia digitale del FIR</label>
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
                                                        <cc:rTextBox ID="txt_rs_note" runat="server" MaxLength="4000" AutoPostBack="false"
                                                            Label="Annotazioni" Icon="" Form_Vertical="true" TextMode="MultiLine" Rows="3" />
                                                    </div>
                                                </div>
                                                <!--VIAGGI FINE-->

                                                <div class="form-actions right">
                                                    <asp:LinkButton ID="btn_registra_smaltimento" runat="server" CssClass="btn btn-primary"
                                                        OnClick="btn_registra_Click">
                                                            <i class="fa fa-check"></i> Salva
                                                    </asp:LinkButton>
                                                    <asp:LinkButton ID="btn_salva_nuovo" runat="server" CssClass="btn btn-primary"
                                                        OnClick="btn_salva_nuovo_Click">
                                                            <i class="fa fa-plus"></i>&nbsp;&nbsp;Salva e Nuovo
                                                    </asp:LinkButton>
                                                    <asp:LinkButton ID="btn_cancella_smaltimento" runat="server" CssClass="btn btn-danger"
                                                        OnClick="btn_cancella_Click">
                                                            <i class="fa fa-trash-o"></i> Cancella
                                                    </asp:LinkButton>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <! --/OVERVIEW -->
                                </div>
                                <div id="div_viaggi" class="tab-pane" runat="server" visible="false">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="form-body">
                                                <div class="form-actions right">
                                                    <asp:LinkButton ID="btn_registra_viaggio" runat="server" CssClass="btn btn-primary"
                                                        OnClick="btn_registra_Click">
                                                            <i class="fa fa-check"></i> Salva
                                                    </asp:LinkButton>
                                                    <asp:LinkButton ID="btn_salva_nuovo_viaggio" runat="server" CssClass="btn btn-primary"
                                                        OnClick="btn_salva_nuovo_Click">
                                                            <i class="fa fa-plus"></i>&nbsp;&nbsp;Salva e Nuovo
                                                    </asp:LinkButton>
                                                    <asp:LinkButton ID="btn_cancella_viaggio" runat="server" CssClass="btn btn-danger"
                                                        OnClick="btn_cancella_Click">
                                                            <i class="fa fa-trash-o"></i> Cancella
                                                    </asp:LinkButton>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="div_allegati" class="tab-pane" runat="server">
                                    <div class="form-body">
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
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="form-horizontal">
                                        <div class="form-body">
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
</asp:Content>
<asp:Content ID="ttt" runat="server" ContentPlaceHolderID="body">
    <cc:cFileUpload ID="cFileUpload" runat="server" />
</asp:Content>

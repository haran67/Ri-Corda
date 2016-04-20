<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Start/GisRI.Master"
    CodeBehind="Rientro.aspx.vb" Inherits="GisRI_Web.fRientri" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Src="../Controls/rTextBox.ascx" TagName="rTextBox" TagPrefix="cc" %>
<%@ Register Src="../Controls/rTextData.ascx" TagName="rTextData" TagPrefix="cc" %>
<%@ Register Src="../Controls/rTextNumero.ascx" TagName="rTextNumero" TagPrefix="cc" %>
<%@ Register Src="../Controls/rDropDown.ascx" TagName="rDropDown" TagPrefix="cc" %>
<%@ Register Src="../Controls/rCheckBox.ascx" TagName="rCheckBox" TagPrefix="cc" %>
<%@ Register Src="../Controls/rRadioButton.ascx" TagName="rRadioButton" TagPrefix="cc" %>
<%@ Register Src="../Controls/cFileUpload.ascx" TagName="cFileUpload" TagPrefix="cc" %>
<%@ Register Src="../Controls/cAllegati.ascx" TagName="cAllegati" TagPrefix="cc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function Init_Dirty() {
            $("#<%=div_overview.ClientID%>").dirtyForms();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body_up" runat="server">
    <div class="row mt">
        <div style="height:10px;"></div> 
        <div class="col-lg-12">
            <div class="content-panel gisri_content_panel">
                <div class="row" style="height:35px!Important;">
                    <div class="gisri_panel_title gisri_title_margin_lr">
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
                    <i class="fa fa-angle-right"></i>DETTAGLIO RICEZIONE 4° COPIA: <asp:Label ID="ltl_rs_denominazione" runat="server" /></h3>
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
                                    class="tab-font">Dati 4° Copia</a> </li>
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
                                            <div class="form-body" style="margin-left: 30px!Important; margin-right: 30px!Important;">
                                                <h6><asp:Label ID="ltl_ultima_modifica" runat="server"></asp:Label></h6>
                                                <div class="row" id="div_societa_gestione" runat="server">
                                                    <div class="col-md-6">
                                                        <cc:rTextData ID="txt_rs_data_rientro" runat="server" MaxLength="10" AutoPostBack="false"
                                                            Label="Data Ricezione" Icon="fa fa-calendar" Form_Vertical="true" 
                                                            Required="true" Required_Help="Data rientro obbligatoria!" />
                                                    </div>
                                                    <div class="col-md-6">
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <cc:rDropDown ID="ddl_rs_rifiuto_accettato_cod" runat="server" AutoPostBack="true"
                                                            Label="Accettazione" Placeholder="Seleziona..." Form_Vertical="true" 
                                                            Required="true" Required_Help="Tipologia accettazione obbligatorio!" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <cc:rTextNumero ID="txt_rs_rifiuto_accettato_qta" runat="server" MaxLength="16" AutoPostBack="false"
                                                            Label="Quantita" Icon="" Form_Vertical="true" CifreDecimali="1" 
                                                            Required="true" Required_Help="Quantita accettata obbligatoria!" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <cc:rTextBox ID="txt_rs_rifiuto_accettato_note" runat="server" MaxLength="4000" AutoPostBack="false"
                                                            Label="Note Accettazione" TextMode="MultiLine" Rows="2" Icon="" Form_Vertical="true" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <cc:rTextNumero ID="txt_rs_peso_iniziale" runat="server" MaxLength="16" AutoPostBack="true"
                                                            Label="Peso stimato" Icon="" Form_Vertical="true" CifreDecimali="1" 
                                                            Read_Only="true" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <cc:rTextNumero ID="txt_rs_volume_iniziale" runat="server" MaxLength="16" AutoPostBack="true"
                                                            Label="Volume stimato" Icon="" Form_Vertical="true" CifreDecimali="1" 
                                                            Read_Only="true" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <cc:rTextNumero ID="txt_rs_peso_finale" runat="server" MaxLength="16" AutoPostBack="true"
                                                            Label="Peso a destino" Icon="" Form_Vertical="true" CifreDecimali="1" 
                                                            Required="true" Required_Help="Peso a destino obbligatorio!" />
                                                    </div>
                                                    <div class="col-md-2">
                                                        <cc:rDropDown ID="ddl_rs_peso_finale_misura_cod" runat="server" AutoPostBack="false"
                                                            Label="UM" Placeholder="Seleziona..." Form_Vertical="true" 
                                                            Required="true" Required_Help="Unità di misura obbligatoria!" />
                                                    </div>
                                                    <div class="col-md-4">
                                                        <cc:rTextNumero ID="txt_rs_volume_finale" runat="server" MaxLength="16" AutoPostBack="true"
                                                            Label="Volume a destino" Icon="" Form_Vertical="true" CifreDecimali="1" />
                                                    </div>
                                                    <div class="col-md-2">
                                                        <cc:rDropDown ID="ddl_rs_volume_finale_misura_cod" runat="server" AutoPostBack="false"
                                                            Label="UM" Placeholder="Seleziona..." Form_Vertical="true" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <cc:rTextBox ID="txt_rs_note" runat="server" MaxLength="4000" AutoPostBack="false"
                                                            Label="Note" TextMode="MultiLine" Rows="2" Icon="" Form_Vertical="true" />
                                                    </div>
                                                </div>
                                                <div class="form-actions right">
                                                    <asp:LinkButton ID="btn_registra" runat="server" CssClass="btn btn-primary">
                                                            <i class="fa fa-check"></i> Salva
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
                                <div id="div_allegati" class="tab-pane" runat="server">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="form-horizontal">
                                                <div class="form-body" style="margin-left: 30px!Important; margin-right: 30px!Important;">
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
</asp:Content>
<asp:Content ID="ttt" runat="server" ContentPlaceHolderID="body">
    <cc:cFileUpload ID="cFileUpload" runat="server" />
</asp:Content>

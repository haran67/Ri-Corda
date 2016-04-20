<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="cFileUpload.ascx.vb"
    Inherits="GisRI_Web.cFileUpload" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Src="../Controls/rTextBox.ascx" TagName="rTextBox" TagPrefix="cc" %>
<!-- Button trigger modal -->
<!-- Modal -->
<script type="text/javascript">
    jQuery(document).ready(function () {
        doc_upload.init();
    });

    var doc_upload.init = function () {

        $ = $telerik.$;

        if (!Telerik.Web.UI.RadAsyncUpload.Modules.FileApi.isAvailable()) {

            //Hide dropZone
            var dropZone1 = $(document).find("#DropZone1");
            dropZone1[0].style.display = 'none';

        }

        else {

            $(document).bind({ "drop": function (e) { e.preventDefault(); } });
            var dropZone1 = $(document).find("#DropZone1");
            dropZone1.bind({ "dragenter": function (e) { dragEnterHandler(e, dropZone1); } })
                     .bind({ "dragleave": function (e) { dragLeaveHandler(e, dropZone1); } })
                     .bind({ "drop": function (e) { dropHandler(e, dropZone1); } });
        }

    };


    function dropHandler(e, dropZone) {
        dropZone[0].style.backgroundColor = "#357A2B";
    }

    function dragEnterHandler(e, dropZone) {
        var dt = e.originalEvent.dataTransfer;
        var isFile = (dt.types != null && (dt.types.indexOf ? dt.types.indexOf('Files') != -1 : dt.types.contains('application/x-moz-file')));
        if (isFile || $telerik.isSafari5 || $telerik.isIE10Mode || $telerik.isOpera)
            dropZone[0].style.backgroundColor = "#000000";
    }


    function dragLeaveHandler(e, dropZone) {
        if (!$telerik.isMouseOverElement(dropZone[0], e.originalEvent))
            dropZone[0].style.backgroundColor = "#357A2B";
    }

</script>

<div class="modal fade" id="myModalFiles" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
    aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;</button>
                <h4 class="modal-title" id="myModalLabel">
                    FILE ED ALLEGATI</h4>
            </div>
            <div class="modal-body" style="height: 400px; overflow: auto;">
                <div class="row">
                    <div class="col-md-12">
                        <asp:UpdatePanel ID="updWizard" runat="server">
                            <ContentTemplate>
                                <div class="portlet box blue" id="form_wizard_1">
                                    <div class="portlet-title">
                                        <div class="caption">
                                            <i class="fa fa-gift"></i>&nbsp;&nbsp;Wizard di caricamento files - <span class="step-title">
                                                Step
                                                <asp:Literal ID="ltl_step" runat="server"></asp:Literal>
                                                di 3 </span>
                                        </div>
                                        <div class="tools hidden-xs">
                                        </div>
                                    </div>
                                    <div class="portlet-body form">
                                        <div class="form-horizontal" id="submit_form">
                                            <div class="form-wizard">
                                                <div class="form-body">
                                                    <ul class="nav nav-pills nav-justified steps">
                                                        <li id="li_tab1" runat="server">
                                                            <asp:LinkButton CssClass="step active" ID="lnk_tab1" runat="server" Enabled="false">
                                                                <span class="number">1&nbsp;&nbsp;</span><span class="desc">
                                                                <i class="fa fa-check"></i>&nbsp;Scelta files </span>
                                                            </asp:LinkButton>
                                                        </li>
                                                        <li id="li_tab2" runat="server">
                                                            <asp:LinkButton CssClass="step active" ID="lnk_tab2" runat="server" Enabled="false">
                                                                <span class="number">2&nbsp;&nbsp;</span><span
                                                                class="desc"><i class="fa fa-check"></i>&nbsp;Dettagli files </span>
                                                            </asp:LinkButton>
                                                        </li>
                                                        <li id="li_tab3" runat="server">
                                                            <asp:LinkButton CssClass="step" ID="lnk_tab3" runat="server" Enabled="false">
                                                                <span class="number">3&nbsp;&nbsp;</span><span
                                                                class="desc"><i class="fa fa-check"></i>&nbsp;Conferma e salva</span>
                                                            </asp:LinkButton>
                                                        </li>
                                                    </ul>
                                                    <div id="bar" class="progress progress-striped" role="progressbar">
                                                        <div class="progress-bar progress-bar-success" id="div_progress" runat="server">
                                                        </div>
                                                    </div>
                                                    <div class="tab-content">
                                                        <div class="alert alert-danger" id="div_message" runat="server" visible="false">
                                                            <button class="close" data-dismiss="alert">
                                                            </button>
                                                            <asp:Literal ID="ltl_messaggio" runat="server">
                                                            </asp:Literal>
                                                        </div>
                                                        <div class="alert alert-warning" id="div_message_warning" runat="server" visible="false">
                                                            <button class="close" data-dismiss="alert">
                                                            </button>
                                                            <asp:Literal ID="ltl_messaggio_warning" runat="server">
                                                            </asp:Literal>
                                                        </div>
                                                        <div class="tab-pane active" id="tab1" runat="server">
                                                            <h3 class="block">
                                                                Scegli i files da caricare</h3>
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <div class="horizontal-form">
                                                                        <telerik:RadAsyncUpload runat="server" ID="doc_upload" MultipleFileSelection="Automatic" Culture="it-IT"
                                                                            DropZones="#DropZone1" AllowedFileExtensions="doc,docx,pdf,xls,xlsx,jpg,msg,txt" Localization-Select="Seleziona" />
                                                                        <br />
                                                                    </div> 
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <div id="DropZone1" class="note note-success" style="text-align:center; font-size:15px;">
                                                                        PUOI TRASCINARE QUI I TUOI FILES
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="tab-pane active" id="tab2" runat="server">
                                                            <h3 class="block">
                                                                Inserisci tipo, titolo e descrizione dei files scelti</h3>
                                                            </h3>
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <asp:DataList ID="dl_doc_upload" runat="server" RepeatDirection="Horizontal" RepeatColumns="3" Width="100%">
                                                                        <ItemTemplate>
                                                                        <div class="form-body">
                                                                            <div class="row">
                                                                                <div class="col-md-12">
                                                                                    <asp:HyperLink ID="lnk_file" runat="server" Target="_blank" Font-Size="15"></asp:HyperLink>
                                                                                </div>
                                                                            </div>
                                                                            <div class="row">
                                                                                <div class="col-md-12">
                                                                                    <asp:DropDownList ID="ddl_tipologia" runat="server" CssClass="form-control" placeholder="Inserisci qui la tipologia"></asp:DropDownList>
                                                                                </div>
                                                                            </div>
                                                                            <div class="row">
                                                                                <div class="col-md-12">
                                                                                    <asp:TextBox ID="txt_titolo" runat="server" MaxLength="128" CssClass="form-control" placeholder="Inserisci qui il titolo"></asp:TextBox>
                                                                                </div>
                                                                            </div>
                                                                            <div class="row">
                                                                                <div class="col-md-12">
                                                                                    <asp:TextBox ID="txt_descrizione" runat="server" MaxLength="4000" CssClass="form-control" TextMode="MultiLine" Rows="4" placeholder="Inserisci qui la descrizione"></asp:TextBox>
                                                                                </div>
                                                                            </div>
                                                                        </div> 
                                                                        </ItemTemplate>
                                                                    </asp:DataList>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="tab-pane active" id="tab3" runat="server">
                                                            <h3 class="block">
                                                                Conferma i files che hai inserito</h3>
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <asp:DataList ID="dl_doc_confirm" runat="server" RepeatDirection="Horizontal" RepeatColumns="3" Width="100%">
                                                                        <ItemTemplate>
                                                                            <div class="form-body">
                                                                                <div class="row">
                                                                                    <div class="col-md-12">
                                                                                        <asp:HyperLink ID="lnk_file" runat="server" Target="_blank" Font-Size="15"></asp:HyperLink>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="row">
                                                                                    <div class="col-md-12">
                                                                                        <asp:Label ID="lbl_tipologia" runat="server" Font-Bold="true" Font-Size="13"></asp:Label>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="row">
                                                                                    <div class="col-md-12">
                                                                                        <asp:Label ID="lbl_titolo" runat="server" Font-Bold="true"></asp:Label>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="row">
                                                                                    <div class="col-md-12">
                                                                                        <asp:Label ID="lbl_descrizione" runat="server" Font-Bold="false"></asp:Label>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </ItemTemplate>
                                                                    </asp:DataList>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-actions right">
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <div style="padding-top:10px;">
                                                                <asp:LinkButton ID="btn_prev" runat="server" CssClass="btn btn-default">
                                                                    <i class="m-icon-swapleft"></i>Indietro 
                                                                </asp:LinkButton>
                                                                <asp:LinkButton ID="btn_cont" runat="server" CssClass="btn btn-primary">
                                                                    Continua <i class="m-icon-swapright m-icon-white"></i>
                                                                </asp:LinkButton>
                                                                <asp:LinkButton ID="btn_save" runat="server" CssClass="btn btn-success">
                                                                    Salva <i class="m-icon-swapright m-icon-white"></i>
                                                                </asp:LinkButton>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">
                    CHIUDI</button>
            </div>
        </div>
    </div>
</div>
<!-- /Modal -->

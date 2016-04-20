<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Start/GisRI.Master"
    CodeBehind="Nuovo.aspx.vb" Inherits="GisRI_Web.fMessaggiNuovo" ValidateRequest="false" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Src="../Controls/rTextBox.ascx" TagName="rTextBox" TagPrefix="cc" %>
<%@ Register Src="../Controls/rTextData.ascx" TagName="rTextData" TagPrefix="cc" %>
<%@ Register Src="../Controls/rDropDown.ascx" TagName="rDropDown" TagPrefix="cc" %>
<%@ Register Src="../Controls/rCheckBox.ascx" TagName="rCheckBox" TagPrefix="cc" %>
<%@ Register Src="../Controls/rRadioButton.ascx" TagName="rRadioButton" TagPrefix="cc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../assets/plugins/bootstrap-summernote/summernote.css" rel="stylesheet" />
    <script type="text/javascript">
        function Init_bootstrapSwitch() {
            if (!$().bootstrapSwitch) {
                return;
            }
            $('.make-switch').bootstrapSwitch();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body_up" runat="server">
    <div class="row mt">
        <div style="height: 10px;">
        </div>
        <div class="col-md-12">
            <section class="content-panel">
                <header class="panel-heading wht-bg">
                    <div class="mail-header row">
                        <div class="col-md-6">
                                <h4 class="gen-case"> Nuovo messaggio</h4>
                        </div>
                        <div class="col-md-6">
                            <div class="compose-btn pull-right">
                                <div id="div_cerca" runat="server">
                                    <div class="form-inline">
                                        <asp:LinkButton ID="btn_return" runat="server" ToolTip="Vai alla mailbox" CssClass="btn btn-primary"><i class="fa fa-envelope"></i>&nbsp;&nbsp;Vai alla mailbox</asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </header>
                <div class="panel-body">
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
                    <div class="compose-mail" style="padding-left:30px; padding-right:30px;">
                        <div class="form-vertical">
                            <div class="row">
                                <div class="form-group">
                                    <label for="to" class="">Destinatario:</label>
                                    <asp:DropDownList ID="ddl_destinatario_01" runat="server" CssClass="select2me form-control" placeholder="Seleziona il destinatario"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group">
                                    <label for="to" class="">Per conoscenza:</label>
                                    <asp:DropDownList ID="ddl_destinatario_02" runat="server" multiple="multiple" CssClass="select2me form-control"
                                        placeholder="Seleziona gli indrizzi">
                                    </asp:DropDownList>
                                </div>
                            </div> 
                            <div class="row">
                                <div class="form-group">
                                    <label for="mail_subject" class="">Oggetto:</label>
                                    <asp:TextBox ID="txt_soggetto" name="mail_subject" runat="server" MaxLength="256" CssClass="form-control" placeholder="Inserisci l'oggetto del messaggio"></asp:TextBox>
                                </div> 
                            </div> 
                            <div class="row">
                                <div class="compose-editor" style="padding-top:0px;">
                                    <label for="mail_subject" class="">Messaggio:</label>
							        <div name="summernote"  id="summernote_1" runat="server">
							        </div>
                                    <asp:TextBox ID="txt_messaggio_html" style="display:none;" runat="server" TextMode="MultiLine" Rows="10" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div> 
                            <div class="row" id="div_messaggistica_invio" runat="server">
                                <div class="form-group">
                                    <cc:rCheckBox ID="chk_messaggistica_invio" runat="server" Values="S|" Classes="make-switch|SI|NO|success|"
                                        Label="Invia anche via mail" Checked="true" Form_Vertical="true" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group">
                                    <label for="allegati" class="">Allegati:</label>
                                    <br />
                                    <telerik:RadAsyncUpload runat="server" ID="RadUpload1" MultipleFileSelection="Automatic" Culture="it-IT"
                                        AllowedFileExtensions="doc,docx,pdf,xls,xlsx,jpg,msg,txt" Localization-Select="Seleziona" />
                                </div>
                            </div> 
                            <div class="row">
                            <div class="form-group">
                                <asp:LinkButton ID="btnInvia" runat="server" CssClass="btn btn-primary">
                                        <i class="fa fa-check"></i> Invia il messaggio
                                </asp:LinkButton>
                            </div>
                            </div> 
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <!-- /col-md-12 -->
    </div>
    <!-- /row -->

    <!--script for this page-->
	<script type="text/javascript" src="../assets/plugins/bootstrap-summernote/summernote.min.js"></script>
	<script type="text/javascript" src="../assets/plugins/bootstrap-summernote/lang/summernote-it-IT.js"></script>
    
    <script type="text/javascript">
        $(document).ready(function () {
            setSummerNote(true);
        });

        function setSummerNote(init) {
            $('#<%=summernote_1.ClientID %>').summernote({
                onkeyup: function (e) {
                    $("#<%=txt_messaggio_html.ClientID %>").val($("#<%=summernote_1.ClientID %>").code());
                },
                height: 300,
                lang: 'it-IT' // default: 'en-US'
            });
            if (!init) {
                $("#<%=summernote_1.ClientID %>").code($("#<%=txt_messaggio_html.ClientID %>").val());
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>

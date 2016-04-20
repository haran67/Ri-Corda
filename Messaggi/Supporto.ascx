<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="Supporto.ascx.vb" Inherits="GisRI_Web.Supporto" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Src="../Controls/rCheckBox.ascx" TagName="rCheckBox" TagPrefix="cc" %>
<div class="modal fade" id="myModalSupport" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
    aria-hidden="true">
    <div class="modal-dialog modal-lg" id="modal_body">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true" id="btn_close" runat="server">
                    &nbsp;&times;</button>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true" 
                    onclick="NewWindows('../Messaggi/Supporto.aspx','_Supporto',600,800,'no');" id="btn_detach" runat="server">
                    <i class="fa fa-external-link-square"></i></button>
                <h3 class="modal-title" id="myModalLabel">
                    <asp:Literal ID="ltl_messaggio" runat="server">
                    INVIA MESSAGGIO</asp:Literal></h3>
                <div id="div_supporto_ERR" runat="server" visible="true">
                    <h6 style="color: White; font-weight: bold;">
                        Scegli tra i destinatari l'opportuna voce di supporto</h6>
                </div>
            </div>
            <asp:UpdatePanel ID="updWizard" runat="server">
                <ContentTemplate>
                    <div class="modal-body" style="height: 430px; overflow: auto;">
                        <div class="row">
                            <div class="col-md-12">
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
                                <div class="compose-mail" style="padding-left: 30px; padding-right: 30px; margin-top: 0px!Important;">
                                    <div class="form-vertical">
                                        <div class="row">
                                            <div class="form-group">
                                                <label for="to" class="">
                                                    Destinatario:</label>
                                                <asp:DropDownList ID="ddl_destinatario_01" runat="server" CssClass="select2me form-control"
                                                    placeholder="Seleziona il destinatario">
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group">
                                                <label for="to" class="">
                                                    Per conoscenza:</label>
                                                <asp:DropDownList ID="ddl_destinatario_02" runat="server" multiple="multiple" CssClass="select2me form-control"
                                                    placeholder="Seleziona gli indrizzi">
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group">
                                                <label for="mail_subject" class="">
                                                    Oggetto:</label>
                                                <asp:TextBox ID="txt_soggetto" MaxLength="256" name="mail_subject" runat="server"
                                                    CssClass="form-control" placeholder="Inserisci l'oggetto del messaggio"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="compose-editor" style="padding-top: 0px;">
                                                <label for="mail_subject" class="">
                                                    Messaggio:</label>
                                                <asp:TextBox ID="txt_messaggio_html" Style="display: ;" runat="server" TextMode="MultiLine"
                                                    Rows="5" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-9 form-group">
                                                <label for="allegati" class="">
                                                    Allegati:</label>
                                                <br />
                                                <telerik:RadAsyncUpload runat="server" ID="RadUpload1" MultipleFileSelection="Automatic"
                                                    Culture="it-IT" AllowedFileExtensions="doc,docx,pdf,xls,xlsx,jpg,msg,txt" Localization-Select="Seleziona" />
                                            </div>
                                            <div class="col-lg-3" style="text-align: right;">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <asp:LinkButton ID="btnInvia" runat="server" CssClass="btn btn-primary">
                            <i class="fa fa-check"></i> Invia il messaggio
                        </asp:LinkButton>
                        <asp:HyperLink ID="lnk_manuale" runat="server" CssClass="btn btn-warning" Target="_blank">
                            <i class="fa fa-book"></i>&nbsp;&nbsp;SCARICA IL MANUALE DI Ri.-C.O.R.D.A.
                        </asp:HyperLink>
                        <button type="button" class="btn btn-default" data-dismiss="modal" id="btn_chiudi" runat="server"
                            onclick="$('#<%=btnInvia.ClientID%>').css('display', ''); $('.alert-dismissable').alert('close');">
                            CHIUDI</button>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</div>
<!-- /Modal -->

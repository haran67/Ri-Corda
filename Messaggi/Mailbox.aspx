<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Start/GisRI.Master"
    CodeBehind="Mailbox.aspx.vb" Inherits="GisRI_Web.fMessaggi" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Src="../Controls/rTextBox.ascx" TagName="rTextBox" TagPrefix="cc" %>
<%@ Register Src="../Controls/rTextData.ascx" TagName="rTextData" TagPrefix="cc" %>
<%@ Register Src="../Controls/rDropDown.ascx" TagName="rDropDown" TagPrefix="cc" %>
<%@ Register Src="../Controls/rCheckBox.ascx" TagName="rCheckBox" TagPrefix="cc" %>
<%@ Register Src="../Controls/rRadioButton.ascx" TagName="rRadioButton" TagPrefix="cc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
    </script>
    <style>@media (max-width: 768px) { .btn {width: 100% !important;}}</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body_up" runat="server">
    <div class="row mt">
        <div class="">
            <div class="col-sm-3" style="display:none;">
                <section class="panel">
                    <div class="panel-body">
                        <asp:LinkButton ID="btn_nuova" runat="server" CssClass="btn btn-compose">
                            <i class="fa fa-pencil"></i>  Nuovo Messaggio
                        </asp:LinkButton>
                        <ul class="nav nav-pills nav-stacked mail-nav">
                            <li id="li_inbox" runat="server" class="gisri_mail-nav-btn active">
                                <asp:LinkButton ID="btn_inbox" runat="server" CssClass="btn btn-compose gisri_mail-nav-btn">
                                    <i class="fa fa-inbox"></i> Ingresso
                                </asp:LinkButton>
                                <span class="label label-theme pull-right inbox-notification" id="span_inbox" runat="server">
                                    <asp:Literal ID="ltl_inbox_count" runat="server"></asp:Literal>
                                </span>
                            </li>
                            <li id="li_outbox" runat="server" class="gisri_mail-nav-btn">
                                <asp:LinkButton ID="btn_outbox" runat="server" CssClass="btn btn-compose gisri_mail-nav-btn">
                                    <i class="fa fa-envelope-o"></i> Uscita
                                </asp:LinkButton>
                            </li>
                            <li id="li_trash" runat="server">
                                <asp:LinkButton ID="btn_trash" runat="server" CssClass="btn btn-compose gisri_mail-nav-btn">
                                    <i class="fa fa-trash-o"></i> Cestino
                                </asp:LinkButton>
                            </li>
                        </ul>
                    </div>
                </section>
            </div>
            <div class="col-sm-12">
                <section class="panel">
                    <header class="panel-heading wht-bg" style="padding:  10px">
                        <div class="mail-header row">
                            <div class="col-sm-6">
                                 <h4 class="gen-case"><asp:Literal ID="ltl_title" runat="server"></asp:Literal></h4>
                            </div>
                            <div class="col-sm-6">
                                <div class="">
                                    <div id="div_cerca" runat="server">
                                        <div class="form-inline" style="text-align: right;">
                                            <asp:TextBox ID="txt_search" runat="server" CssClass="form-control" placeholder="Cerca nei messaggi" style="margin-top: 5px;"></asp:TextBox>
                                            <asp:LinkButton ID="btn_cerca" runat="server" CssClass="btn btn-default" style="margin-top: 5px;">
                                                <i class="fa fa-search"></i>&nbsp;Cerca
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                    <div id="div_return" runat="server" style="text-align: right;">
                                        <asp:LinkButton ID="btn_return" runat="server" ToolTip="Torna indietro" CssClass="btn btn-warning"><i class="fa fa-angle-left"></i>&nbsp;&nbsp;Torna indietro</asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </header>
                    <div class="panel-body minimal" style="padding: 10px">
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
                        <div class="mail-option">
                            <!-- actions for inbox -->
                            <div id="div_btn_int" runat="server">
                                <div class="form-actions pull-right">
                                    <asp:LinkButton ID="btn_msgin_delete" runat="server" CssClass="btn btn-danger">
                                            <i class="fa fa-trash-o"></i> Elimina
                                    </asp:LinkButton>
                                </div>
                            </div>
                            <div id="div_btn_out" runat="server">
                                <div class="form-actions pull-right">
                                    <asp:LinkButton ID="btn_msgout_delete" runat="server" CssClass="btn btn-danger">
                                            <i class="fa fa-trash-o"></i> Elimina
                                    </asp:LinkButton>
                                </div>
                            </div>
                            <div id="div_btn_trash" runat="server">
                                <div class="form-actions pull-right">
                                    <asp:LinkButton ID="btn_msgtr_delete" runat="server" CssClass="btn btn-danger">
                                            <i class="fa fa-trash-o"></i> Elimina Definitivamente
                                    </asp:LinkButton>
                                </div>
                            </div>
                        </div>
                        <div class="table-inbox-wrap overflow" id="div_inbox" runat="server">
                            <telerik:RadGrid ID="RGInBox" AutoGenerateColumns="False" CssClass="" style="width: 100%;" runat="server"
                                ShowFooter="false" AllowPaging="True" AllowSorting="True" GridLines="None" PageSize="25"
                                Width="100%" AllowMultiRowSelection="true" Skin="MyCustomSkin" EnableEmbeddedSkins="false"
                                AllowFilteringByColumn="false" Culture="it-IT">
                                <GroupingSettings CaseSensitive="false" />
                                <PagerStyle Mode="NextPrevAndNumeric" CssClass=""></PagerStyle>
                                <HeaderStyle CssClass=""></HeaderStyle>
                                <ItemStyle CssClass=""></ItemStyle>
                                <AlternatingItemStyle CssClass=""></AlternatingItemStyle>
                                <GroupHeaderItemStyle BorderColor="Black" BackColor="Silver"></GroupHeaderItemStyle>
                                <MasterTableView ShowFooter="True" Width="100%" DataKeyNames="messaggi_key" AllowMultiColumnSorting="True">
                                    <Columns>
                                        <telerik:GridClientSelectColumn UniqueName="CheckboxSelectColumn" ItemStyle-HorizontalAlign="Center"
                                            HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="40" />
                                        <telerik:GridTemplateColumn UniqueName="Preferito" SortExpression="preferito" AllowFiltering="false"
                                            InitializeTemplatesFirst="false" HeaderStyle-Width="40">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnk_star" runat="server" CommandName="STAR">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star fa-star-started"></i>
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridBoundColumn UniqueName="mittente_key" SortExpression="mittente_key"
                                            HeaderText="Mittente" DataField="mittente_desc" HeaderStyle-Width="40%" AllowFiltering="false"
                                            ShowFilterIcon="false" FilterControlWidth="150px" AutoPostBackOnFilter="true"
                                            CurrentFilterFunction="Contains" Groupable="false" />
                                        <telerik:GridButtonColumn SortExpression="soggetto" UniqueName="soggetto" HeaderText="Oggetto"
                                            CommandName="Go" DataTextField="soggetto" HeaderStyle-Width="40%" >
                                        </telerik:GridButtonColumn>
                                        <telerik:GridTemplateColumn UniqueName="Allegati" SortExpression="Allegati" InitializeTemplatesFirst="false"
                                            HeaderStyle-Width="40" AllowFiltering="false" >
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnk_scarica" runat="server" CommandName="ZIP">
                                                    <i class="fa fa-paperclip"></i>
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridBoundColumn UniqueName="data" SortExpression="data" HeaderText="Data"
                                            DataField="data" HeaderStyle-Width="10%" DataFormatString="{0:dd/MM/yyyy}" AllowFiltering="false" />
                                        <telerik:GridTemplateColumn UniqueName="TemplateColumn" SortExpression="data" InitializeTemplatesFirst="false"
                                            HeaderStyle-Width="40" AllowFiltering="false" >
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btnVediMsg" runat="server" CssClass="btn btn-primary btn-xs button-link-w gisri_button_ws"
                                                    CommandName="GO" ToolTip="Vedi il messaggio">
                                                    <i class=" fa fa-envelope"></i>&nbsp;</i>
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </telerik:GridTemplateColumn>
                                    </Columns>
                                </MasterTableView>
                                <ClientSettings>
                                    <Selecting AllowRowSelect="true" />
                                </ClientSettings>
                            </telerik:RadGrid>
                            <!--table class="table table-inbox table-hover">
                            <tbody>
                            <tr class="unread">
                                <td class="inbox-small-cells">
                                    <input type="checkbox" class="mail-checkbox">
                                </td>
                                <td class="inbox-small-cells"><i class="fa fa-star"></i></td>
                                <td class="view-message  dont-show"><a href="mail_view.html">Google Inc.</a></td>
                                <td class="view-message "><a href="mail_view.html">Your new account is ready.</a></td>
                                <td class="view-message  inbox-small-cells"><i class="fa fa-paperclip"></i></td>
                                <td class="view-message  text-right">08:10 AM</td>
                            </tr>
                            <tr class="">
                                <td class="inbox-small-cells">
                                    <input type="checkbox" class="mail-checkbox">
                                </td>
                                <td class="inbox-small-cells"><i class="fa fa-star inbox-started"></i></td>
                                <td class="view-message dont-show"><a href="mail_view.html">Mark Webber <span class="label label-danger pull-right">urgent</span></a></td>
                                <td class="view-message"><a href="mail_view.html">The server is down</a></td>
                                <td class="view-message inbox-small-cells"></td>
                                <td class="view-message text-right">March 09</td>
                            </tr>
                            </tbody>
                            </table-->
                        </div>
                        <div class="table-inbox-wrap overflow" id="div_outbox" runat="server">
                            <telerik:RadGrid ID="RGOutBox" AutoGenerateColumns="False" CssClass="" style="width: 100%;" runat="server"
                                ShowFooter="false" AllowPaging="True" AllowSorting="True" GridLines="None" PageSize="25"
                                Width="100%" AllowMultiRowSelection="true" Skin="MyCustomSkin" EnableEmbeddedSkins="false" Culture="it-IT">
                                <PagerStyle Mode="NextPrevAndNumeric" CssClass=""></PagerStyle>
                                <HeaderStyle CssClass=""></HeaderStyle>
                                <ItemStyle CssClass=""></ItemStyle>
                                <AlternatingItemStyle CssClass=""></AlternatingItemStyle>
                                <GroupHeaderItemStyle BorderColor="Black" BackColor="Silver"></GroupHeaderItemStyle>
                                <MasterTableView ShowFooter="True" Width="100%" DataKeyNames="messaggi_key" AllowMultiColumnSorting="True">
                                    <Columns>
                                        <telerik:GridClientSelectColumn UniqueName="CheckboxSelectColumn" ItemStyle-HorizontalAlign="Center"
                                            HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="40" />
                                        <telerik:GridBoundColumn UniqueName="destinatario_key" SortExpression="destinatario_key"
                                            HeaderText="Destinatario" DataField="destinatario_desc" HeaderStyle-Width="40%" />
                                        <telerik:GridButtonColumn SortExpression="soggetto" UniqueName="soggetto" HeaderText="Oggetto"
                                            CommandName="Go" DataTextField="soggetto" HeaderStyle-Width="40%">
                                        </telerik:GridButtonColumn>
                                        <telerik:GridTemplateColumn UniqueName="Allegati" SortExpression="Allegati" InitializeTemplatesFirst="false"
                                            HeaderStyle-Width="40">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnk_scarica" runat="server" CommandName="ZIP">
                                                    <i class="fa fa-paperclip"></i>
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridBoundColumn UniqueName="data" SortExpression="data" HeaderText="Data"
                                            DataField="data" HeaderStyle-Width="10%" DataFormatString="{0:dd/MM/yyyy}" />
                                        <telerik:GridTemplateColumn UniqueName="TemplateColumn" SortExpression="data" InitializeTemplatesFirst="false"
                                            HeaderStyle-Width="40">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btnVediMsg" runat="server" CssClass="btn btn-primary btn-xs button-link-w gisri_button_ws"
                                                    CommandName="GO" ToolTip="Vedi il messaggio">
                                                    <i class=" fa fa-envelope"></i>&nbsp;</i>
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </telerik:GridTemplateColumn>
                                    </Columns>
                                </MasterTableView>
                                <ClientSettings>
                                    <Selecting AllowRowSelect="true" />
                                </ClientSettings>
                            </telerik:RadGrid>
                        </div>
                        <div class="table-inbox-wrap overflow" id="div_trash" runat="server">
                            <telerik:RadGrid ID="RGTrash" AutoGenerateColumns="False" CssClass="" style="width: 100%;" runat="server"
                                ShowFooter="false" AllowPaging="True" AllowSorting="True" GridLines="None" PageSize="25"
                                Width="100%" AllowMultiRowSelection="true" Skin="MyCustomSkin" EnableEmbeddedSkins="false" Culture="it-IT">
                                <PagerStyle Mode="NextPrevAndNumeric" CssClass=""></PagerStyle>
                                <HeaderStyle CssClass=""></HeaderStyle>
                                <ItemStyle CssClass=""></ItemStyle>
                                <AlternatingItemStyle CssClass=""></AlternatingItemStyle>
                                <GroupHeaderItemStyle BorderColor="Black" BackColor="Silver"></GroupHeaderItemStyle>
                                <MasterTableView ShowFooter="True" Width="100%" DataKeyNames="messaggi_key" AllowMultiColumnSorting="True">
                                    <Columns>
                                        <telerik:GridClientSelectColumn UniqueName="CheckboxSelectColumn" ItemStyle-HorizontalAlign="Center"
                                            HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="40" />
                                        <telerik:GridBoundColumn UniqueName="mittente_key" SortExpression="mittente_key"
                                            HeaderText="Mittente" DataField="mittente_desc" HeaderStyle-Width="25%" />
                                        <telerik:GridBoundColumn UniqueName="destinatario_key" SortExpression="destinatario_key"
                                            HeaderText="Destinatario" DataField="destinatario_desc" HeaderStyle-Width="25%" />
                                        <telerik:GridButtonColumn SortExpression="soggetto" UniqueName="soggetto" HeaderText="Oggetto"
                                            CommandName="Go" DataTextField="soggetto" HeaderStyle-Width="40%">
                                        </telerik:GridButtonColumn>
                                        <telerik:GridBoundColumn UniqueName="data" SortExpression="data" HeaderText="Data"
                                            DataField="data" HeaderStyle-Width="10%" DataFormatString="{0:dd/MM/yyyy}" />
                                        <telerik:GridTemplateColumn UniqueName="TemplateColumn" SortExpression="data" InitializeTemplatesFirst="false"
                                            HeaderStyle-Width="40">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btnVediMsg" runat="server" CssClass="btn btn-primary btn-xs button-link-w gisri_button_ws"
                                                    CommandName="GO" ToolTip="Vedi il messaggio">
                                                    <i class=" fa fa-envelope"></i>&nbsp;
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </telerik:GridTemplateColumn>
                                    </Columns>
                                </MasterTableView>
                                <ClientSettings>
                                    <Selecting AllowRowSelect="true" />
                                </ClientSettings>
                            </telerik:RadGrid>
                        </div>
                        <div class="table-inbox-wrap" id="div_message" runat="server">
                            <div class="panel-body ">
                                <div class="mail-header row">
                                    <div class="col-md-6">
                                        <h4 class="pull-left"><asp:Literal ID="ltl_oggetto" runat="server"></asp:Literal></h4>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-actions right" style="text-align: right;">
                                            <asp:LinkButton ID="btn_rispondi" runat="server" CssClass="btn btn-primary">
                                                    <i class="fa fa-mail-reply"></i> Rispondi
                                            </asp:LinkButton>
                                            <asp:LinkButton ID="btn_inoltra" runat="server" CssClass="btn btn-primary">
                                                    <i class="fa fa-mail-forward"></i> Inoltra
                                            </asp:LinkButton>
                                            <asp:LinkButton ID="btn_cancella" runat="server" CssClass="btn btn-danger">
                                                    <i class="fa fa-trash-o"></i> Elimina
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                                <div class="mail-sender">
                                    <div class="row">
                                        <div class="col-md-12" style="white-space: normal;">
                                            <asp:Image ID="img_dp_foto" runat="server" style="float:left" />
                                            <div style="margin-left: 40px;">
                                            <h5 style="margin:0">
                                                Da:&nbsp;
                                            <strong><asp:Literal ID="ltl_mittente" runat="server"></asp:Literal></strong>
                                            <span>[<asp:Literal ID="ltl_mittente_mail" runat="server"></asp:Literal>]</span><br />
                                            A:&nbsp;
                                            <strong><asp:Literal ID="ltl_destinatario" runat="server"></asp:Literal></strong>
                                            </h5>
                                            <span style="font-style: italic; color: #999;"><asp:Literal ID="ltl_data" runat="server"></asp:Literal></span>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="view-mail"><asp:Literal ID="ltl_messaggio" runat="server"></asp:Literal>
                                </div>
                                <div class="attachment-mail" id="div_attach" runat="server">
                                    <p>
                                        <span><i class="fa fa-paperclip"></i> <asp:Literal ID="ltl_num_attach" runat="server"></asp:Literal> attachments </span>
                                        <asp:LinkButton ID="lnk_Scarica" runat="server">Scarica tutti gli attachments</asp:LinkButton>
                                    </p>
                                    <ul>
                                    <asp:Repeater ID="rpt_attach" runat="server">
                                        <ItemTemplate>
                                            <li>
                                                <asp:HyperLink ID="lnk_attach" runat="server" Target="_blank"></asp:HyperLink>
                                            </li>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
        <!-- /col-md-12 -->
    </div>
    <!-- /row -->
    <iframe id="ifZip" runat="server" src="" style="display: none;"></iframe>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>

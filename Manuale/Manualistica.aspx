<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Manualistica.aspx.vb" Inherits="GisRI_Web.Manualistica" MasterPageFile="~/Start/GisRI.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body_up" runat="server">
    <div style="height:10px;"></div>
    <div class="row">
        <div class="col-md-12">
            <div class="content-panel" id="panel_elenco" runat="server" visible="true" style="padding-left:10px!Important;padding-top:0px!Important; margin-bottom:10px;">
                <div class="row" style="height:50px!Important;">
                    <div class="gisri_panel_title gisri_title_margin">
                        <div class="gisri_title_left">
                            <h3 style="padding-left: 10px; margin-top: 0px!Important;">
                                MANUALISTICA DI RICORDA</h3>
                        </div>
                    </div> 
                </div> 
                <div class="row">
                    <asp:Repeater ID="rpt_documenti" runat="server">
                        <ItemTemplate>
                            <div class="col-lg-4">
                                <div class="box1">
                                    <h4 class="center-block" style="text-align:center;">
                                        <asp:Literal ID="ltl_documento" runat="server"></asp:Literal>
                                        <div style="padding-top:20px; margin-top:10px;"></div>
                                        <asp:HyperLink ID="lnk_documento" Target="_blank" runat="server">
                                            <i class="fa fa-2x fa-download"></i>
                                        </asp:HyperLink>
                                    </h4>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div> 
            </div>
            <!-- /content-panel lista-->
        </div>
        <!-- /col-md-12 -->
    </div>

</asp:Content>
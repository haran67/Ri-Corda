<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="Menu.ascx.vb" Inherits="GisRI_Web.Menu" %>
<!-- BEGIN SIDEBAR -->
<div class="page-sidebar-wrapper">
    <!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
    <!-- DOC: Change data-auto-speed="200" to adjust the sub menu slide up/down speed -->
    <div class="page-sidebar navbar-collapse collapse">
        <!-- BEGIN SIDEBAR MENU -->
        <ul class="page-sidebar-menu" data-auto-scroll="true" data-slide-speed="200">
            <!-- DOC: To remove the sidebar toggler from the sidebar you just need to completely remove the below "sidebar-toggler-wrapper" LI element -->
            <li class="sidebar-toggler-wrapper">
                <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
                <div class="sidebar-toggler">
                </div>
                <!-- END SIDEBAR TOGGLER BUTTON -->
            </li>
            <!-- DOC: To remove the search box from the sidebar you just need to completely remove the below "sidebar-search-wrapper" LI element -->
            <li class="sidebar-search-wrapper hidden-xs">
                <!-- BEGIN RESPONSIVE QUICK SEARCH FORM -->
                <!-- DOC: Apply "sidebar-search-bordered" class the below search form to have bordered search box -->
                <!-- DOC: Apply "sidebar-search-bordered sidebar-search-solid" class the below search form to have bordered & solid search box -->
                <div class="sidebar-search">
                    <a href="javascript:;" class="remove"><i class="icon-close"></i></a>
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search...">
                        <span class="input-group-btn"><a href="javascript:;" class="btn submit"><i class="icon-magnifier">
                        </i></a></span>
                    </div>
                </div>
                <!-- END RESPONSIVE QUICK SEARCH FORM -->
            </li>
            <asp:Repeater ID="rpt_menu" runat="server">
                <ItemTemplate>
                    <li id="li_menu" runat="server">
                        <asp:HyperLink ID="lnk_menu" runat="server">
                            <i class="" id="i_icon" runat="server"></i>
                            <span class="title">
                                <asp:Literal ID="ltl_menu" runat="server"></asp:Literal>
                            </span>
                            <span class="arrow" id="span_arrow" runat="server"></span>
                            <span class="" id="span_selected" runat="server"></span>
                        </asp:HyperLink>
                        <asp:Repeater ID="rpt_submenu" runat="server" OnItemDataBound="rpt_submenu_ItemDataBound">
                            <HeaderTemplate>
                                <ul class="sub-menu">        
                            </HeaderTemplate>
                            <ItemTemplate>
                                <li id="li_submenu" runat="server">
                                    <asp:HyperLink ID="lnk_submenu" runat="server">
                                        <i class="" id="i_icon" runat="server"></i>&nbsp;
                                        <asp:Literal ID="ltl_submenu" runat="server"></asp:Literal>
                                        <span class="arrow" id="span_arrow" runat="server"></span>
                                    </asp:HyperLink>
                                    <asp:Repeater ID="rpt_submenu" runat="server" OnItemDataBound="rpt_submenu_ItemDataBound">
                                        <HeaderTemplate>
                                            <ul class="sub-menu">        
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <li id="li_submenu" runat="server">
                                                <asp:HyperLink ID="lnk_submenu" runat="server">
                                                    <i class="" id="i_icon" runat="server"></i>&nbsp;
                                                    <asp:Literal ID="ltl_submenu" runat="server"></asp:Literal>
                                                    <span class="arrow" id="span_arrow" runat="server"></span>
                                                </asp:HyperLink>
                                            </li>
                                        </ItemTemplate>
                                        <FooterTemplate >
                                            </ul> 
                                        </FooterTemplate>
                                    </asp:Repeater>
                                </li>
                            </ItemTemplate>
                            <FooterTemplate >
                                </ul> 
                            </FooterTemplate>
                        </asp:Repeater>
                    </li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
        <!-- END SIDEBAR MENU -->
    </div>
</div>
<!-- END SIDEBAR -->

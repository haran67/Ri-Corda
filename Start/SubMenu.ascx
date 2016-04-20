<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="SubMenu.ascx.vb" Inherits="GisRI_Web.SubMenu" %>
<ul class="sub-menu">
    <asp:Repeater ID="rpt_menu" runat="server">
        <ItemTemplate>
            <li id="li_submenu" runat="server">
                <asp:HyperLink ID="lnk_submenu" runat="server">
                    <i class="icon-pencil" id="i_icon" runat="server"></i>&nbsp;
                    <asp:Literal ID="ltl_submenu" runat="server"></asp:Literal>
                </asp:HyperLink>
                <asp:Repeater ID="rpt_submenu" runat="server">
                    <ItemTemplate>
                        <li id="li_submenu" runat="server">
                            <asp:HyperLink ID="lnk_submenu" runat="server">
                                <i class="icon-pencil" id="i_icon" runat="server"></i>&nbsp;
                                <asp:Literal ID="ltl_submenu" runat="server"></asp:Literal>
                            </asp:HyperLink>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
            </li>
        </ItemTemplate>
    </asp:Repeater>
</ul>


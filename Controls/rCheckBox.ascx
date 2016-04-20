<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="rCheckBox.ascx.vb" Inherits="GisRI_Web.rCheckBox" %>
<div class="form-group" id="div_form" runat="server" style="white-space:nowrap;">
    <label class="control-label col-md-3" style="white-space:nowrap;" id="label_control" runat="server">
        <asp:Literal ID="ltl_label" runat="server"></asp:Literal></label>
    <div class="col-md-9" id="div_col" runat="server">
        <div class="checkbox-list" style="padding-top:0px;">
            <label class="" id="lbl_chk_01" runat="server" visible="false">
                <asp:CheckBox ID="chk_value_01" runat="server" />
                <asp:Literal ID="ltl_chk_01" runat="server"></asp:Literal>
            </label>
            <label class="" id="lbl_chk_02" runat="server" visible="false">
                <asp:CheckBox ID="chk_value_02" runat="server" />
                <asp:Literal ID="ltl_chk_02" runat="server"></asp:Literal>
            </label>
            <label class="" id="lbl_chk_03" runat="server" visible="false">
                <asp:CheckBox ID="chk_value_03" runat="server" />
                <asp:Literal ID="ltl_chk_03" runat="server"></asp:Literal>
            </label>
        </div>
        <span class="help-block" id="span_help" runat="server">
            <asp:Literal ID="ltl_help" runat="server"></asp:Literal></span>
    </div>
</div>

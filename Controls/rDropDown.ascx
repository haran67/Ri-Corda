<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="rDropDown.ascx.vb" Inherits="GisRI_Web.rDropDown" %>

<div class="form-group" id="div_form" runat="server">
    <label class="control-label col-md-3" style="white-space:nowrap;" id="label_control" runat="server">
        <asp:Literal ID="ltl_label" runat="server"></asp:Literal></label>
    <div class="col-md-9" id="div_col" runat="server">
        <div class="" id="div_icon" runat="server">
            <span class="input-group-addon" id="span_icon" runat="server" visible="false"><i class="" id="i_icon"
                runat="server"></i></span>
            <asp:DropDownList ID="ddl_value" runat="server" CssClass="form-control placeholder" placeholder=""></asp:DropDownList>
        </div>
        <span class="help-block">
            <asp:Literal ID="ltl_help" runat="server"></asp:Literal></span>
    </div>
</div>


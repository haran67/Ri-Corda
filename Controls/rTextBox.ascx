<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="rTextBox.ascx.vb" Inherits="GisRI_Web.rTextBox" %>
<div class="form-group" id="div_form" runat="server">
    <label class="control-label col-md-3" style="white-space:nowrap;" id="label_control" runat="server">
        <asp:Literal ID="ltl_label" runat="server"></asp:Literal></label>
    <div class="col-md-9" id="div_col" runat="server">
        <div class="input-group" id="div_input" runat="server" style="width:100%">
            <div class="" id="div_icon" runat="server">
                <span class="input-group-addon" id="span_icon" runat="server" visible="false"><i class="" id="i_icon"
                    runat="server"></i></span>
                <asp:TextBox ID="txt_value" runat="server" CssClass="form-control" placeholder=""></asp:TextBox>
            </div>
            <span class="input-group-btn" id="span_button" runat="server" visible="false">
                <asp:LinkButton ID="btn_action" runat="server" CssClass="btn green">
                    <i class="fa fa-arrow-left fa-fw"></i> <asp:Literal ID="ltl_action" runat="server"></asp:Literal>
                </asp:LinkButton>
		    </span>
        </div>
        <span class="help-block">
            <asp:Literal ID="ltl_help" runat="server"></asp:Literal></span>
    </div>
</div>

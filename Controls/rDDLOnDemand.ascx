<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="rDDLOnDemand.ascx.vb" Inherits="GisRI_Web.rDDLOnDemand" %>

<div class="form-group" id="div_form" runat="server">
    <label class="control-label col-md-3" style="white-space:nowrap;" id="label_control" runat="server">
        <asp:Literal ID="ltl_label" runat="server"></asp:Literal></label>
    <div class="col-md-9" id="div_col" runat="server">
        <div class="" id="div_icon" runat="server">
            <span class="input-group-addon" id="span_icon" runat="server" visible="false"><i class="" id="i_icon"
                runat="server"></i></span>
            <input type="hidden" id="ddl_value" class="form-control select2" runat="server">
            <asp:TextBox ID="txt_value" runat="server" Style="display:none;"></asp:TextBox>
            <asp:TextBox ID="txt_text" runat="server" Style="display:none;"></asp:TextBox>
        </div>
        <span class="help-block">
            <asp:Literal ID="ltl_help" runat="server"></asp:Literal></span>
    </div>
</div>

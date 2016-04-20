<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="rTextData.ascx.vb" Inherits="GisRI_Web.rTextData" %>
<%@ Register TagPrefix="cc" Namespace="GisRI_Classi.Controls" Assembly="GisRI_Classi" %>

<div class="form-group" id="div_form" runat="server">
    <label class="control-label col-md-3" style="white-space:nowrap;" id="label_control" runat="server">
        <asp:Literal ID="ltl_label" runat="server"></asp:Literal></label>
    <div class="col-md-9" id="div_col" runat="server">
        <div class="" id="div_icon" runat="server">
            <span class="input-group-addon" id="span_icon" runat="server" visible="false"><i class="" id="i_icon"
                runat="server"></i></span>
            <cc:TextData ID="txt_value" runat="server" CssClass="form-control date-picker" placeholder="" ></cc:TextData>
        </div>
        <span class="help-block">
            <asp:Literal ID="ltl_help" runat="server"></asp:Literal></span>
    </div>
</div>


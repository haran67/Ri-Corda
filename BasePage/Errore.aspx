<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Errore.aspx.vb" Inherits="GisRI_Web.Errore" MasterPageFile="~/Start/GisRI.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body_up" runat="server">
    <div class="error_box">
        <h1>
            GESTIONE ERRORI</h1>
        <table style="border: solid 0px; width: 93%;">
            <tr>
                <td align="left" width="150">
                    <strong>Pagina Errore:</strong>
                </td>
                <td width="450" align="left">
                    <asp:Literal ID="ltlPag" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr>
                <td align="left" width="150">
                    <strong>Err.Query:</strong>
                </td>
                <td width="450" align="left">
                    <asp:Literal ID="ltlQuery" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr>
                <td align="left" width="150">
                    <strong>Err.Method:</strong>
                </td>
                <td width="450" align="left">
                    <asp:Literal ID="ltlMethod" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr>
                <td align="left" width="150">
                    <strong>Err.Description:</strong>
                </td>
                <td width="450" align="left">
                    <asp:Literal ID="ltlDescr" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr>
                <td align="left" width="150">
                    <strong>Err.StackTrace:</strong>
                </td>
                <td width="450" align="left">
                    <asp:Literal ID="ltlStack" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr>
                <td align="left" colspan="2">
                    <br />
                </td> 
            </tr> 
            <tr>
                <td align="left" colspan="2">
                    <asp:HyperLink ID="hlHome" runat="server" NavigateUrl=" " class="btn btn-primary">Home</asp:HyperLink>
                    &nbsp;
                    <asp:HyperLink ID="hlProsegui" runat="server" NavigateUrl=" " class="btn btn-primary" Visible="false">Prosegui</asp:HyperLink>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
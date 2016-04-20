<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="xlsExport.aspx.vb" Inherits="GisRI_Web.xlsExport" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Elaborazione Dati Ambientali</title>
</head>
<body>
    <form id="frmPrincipale" runat="server">
        <asp:DataGrid id="DGExport" runat="server" BorderColor="#999999" BorderStyle="None" BorderWidth="0px"
				BackColor="White" CellPadding="3" GridLines="Vertical">
				<AlternatingItemStyle BackColor="#fefefe"></AlternatingItemStyle>
				<ItemStyle ForeColor="Black" BackColor="#abc9e3"></ItemStyle>
				<HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#1265ab" HorizontalAlign="Center"></HeaderStyle>
				<FooterStyle ForeColor="White" BackColor="#1265ab"></FooterStyle>
        </asp:DataGrid>    
    </form>
</body>
</html>

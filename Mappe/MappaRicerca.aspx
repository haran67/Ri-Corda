<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="MappaRicerca.aspx.vb" Inherits="GisRI_Web.MappaRicerca" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="frmMappa" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div align="center">
        <table width="100%" border="0">
            <tr>
                <td>
                    <maps:GoogleMap ID="GoogleMap1" runat="server" Zoom="17" Latitude="42.1229" Longitude="24.7879"
                        CssClass="map" Width="100%" Height="700" DisableDoubleClickZoom="false">
                    </maps:GoogleMap>
                    <maps:GoogleMarkers ID="GoogleMarkers1" TargetControlID="GoogleMap1" runat="server">
                    </maps:GoogleMarkers>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>

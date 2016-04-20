<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="cAllegati.ascx.vb" Inherits="GisRI_Web.cAllegati" %>
<%@ Register TagPrefix="cc" Namespace="GisRI_Classi.Controls" Assembly="GisRI_Classi" %>

<table class="table table-striped table-advance table-hover">
    <thead>
        <tr>
            <th style="width: 20%;">
                Allegato
            </th>
            <th style="width: 10%;">
                Caricato il
            </th>
            <th style="width: 20%;">
                Tipologia
            </th>
            <th style="width: 15%;">
                Titolo
            </th>
            <th style="width: 35%;">
                Descrizione
            </th>
            <th style="width: 1%;">
            </th>
        </tr>
    </thead>
    <tbody>
        <asp:Repeater ID="rpt_documenti" runat="server">
            <ItemTemplate>
                <tr>
                    <td>
                        <asp:HyperLink ID="lnk_doc_file" runat="server" Target="_blank"></asp:HyperLink>
                        <div class="project-wrapper" id="div_immagine" runat="server">
                            <div class="project">
                                <div class="photo-wrapper">
                                    <div class="photo">
                                        <asp:HyperLink ID="lnk_doc_immagine" runat="server" CssClass="fancybox" NavigateUrl="">
                                            <asp:Image ID="img_doc_immagine" runat="server" CssClass="img-responsive gisri_attach_image" />
                                        </asp:HyperLink>
                                    </div>
                                    <div class="overlay">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </td>
                    <td style="white-space: nowrap;">
                        <asp:Label ID="lbl_inserito_il" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lbl_doc_tipo_documento_desc" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lbl_doc_titolo" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lbl_doc_descrizione" runat="server"></asp:Label>
                    </td>
                    <td style="white-space: nowrap;">
                        <asp:LinkButton ID="btn_cancella" runat="server" CssClass="btn btn-danger btn-xs button-link-w"
                            CommandName="CANCELLA">
                            <i class=" fa fa-trash-o"></i>&nbsp;Cancella</i>
                        </asp:LinkButton>
                    </td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
    </tbody>
</table>

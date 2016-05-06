<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Start/GisRI.Master" EnableEventValidation="false"
    CodeBehind="Rientro_Quarta_Copia.aspx.vb" Inherits="GisRI_Web.Rientro_Quarta_Copia" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Src="../Controls/rTextData.ascx" TagName="rTextData" TagPrefix="cc" %>
<%@ Register Src="../Controls/rDropDown.ascx" TagName="rDropDown" TagPrefix="cc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="../assets/plugins/nouislider/jquery.nouislider.css" />
    <link rel="stylesheet" type="text/css" href="../assets/plugins/nouislider/jquery.nouislider.pips.css" />
    <script type="text/javascript" src="../assets/plugins/nouislider/jquery.nouislider.all.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div style="height:10px;"></div> 
    <div class="row">
        <div class="col-lg-12">
            <div class="content-panel">
                <h2 style="margin:0px!Important;">
                    <asp:Literal ID="ltl_st_denominazione" runat="server">Rifiuti senza rientro quarta copia</asp:Literal></h2>
            </div> 
        </div> 
        <div class="col-lg-12">
            <div class="content-panel" style="padding:10px!Important;">
                <div style="margin:20px;" >
                    <h4 style="font-weight:bold; margin:0px; margin-bottom:5px;">Seleziona Sito</h4> 
                    <div class="form-body" style="">
                        <div id="div_titolarita" runat="server">
                            <div class="row">
                                <div class="col-md-10">
                                    <cc:rDropDown ID="ddl_st_sito" runat="server" AutoPostBack="false" Select2="true"
                                        Label="" Placeholder="Seleziona..." Form_Vertical="true" />
                                </div>
                                <div class="col-md-2">
                                    <label class="control-label col-md-3" style="white-space:nowrap;" id="label_control" runat="server">
                                    </label>
                                    <asp:LinkButton ID="btn_aggiorna" runat="server" CssClass="btn btn-primary">
                                        <i class="fa fa-check"></i> Aggiorna Report
                                    </asp:LinkButton>
                                </div> 
                            </div>
                        </div>
                    </div>
                </div>
                <div style="margin:20px;" >
                    <h4 style="font-weight:bold; margin:0px; margin-bottom:5px;">Giorni residui al rientro</h4> 
                    <div class="noUi-control noUi-yellow" id="slider_0">
                    </div>
                    <asp:Button ID="btn_ricarica" runat="server" Visible="false" />
                </div>
                <div style="height:10px;"></div>
                <asp:Repeater ID="rpt_siti" runat="server">
                    <ItemTemplate>
                        <h3 style="color:#666;font-weight:bold;">
                            <asp:Image ID="img_societa" runat="server" ImageUrl="../favicon/android-icon-192x192.png" Height="40" Style="padding-bottom:5px;" />
                            <asp:Literal ID="ltl_sc_ragione_sociale" runat="server"></asp:Literal>
                        </h3>
                        <h4 style="margin:0px!Important; font-weight:bold;"><asp:Literal ID="ltl_st_denominazione" runat="server"></asp:Literal></h4>
                        <h5 style="color:#999;"><asp:Literal ID="ltl_st_numero_rifiuti" runat="server"></asp:Literal></h5>
                        <div class="overflow">
                            <table class="table table-striped table-advance table-hover">
                                <thead>
                                    <tr style="white-space:nowrap;">
                                        <th style="width: 1%;">

                                        </th>
                                        <th style="width: 10%;">
                                            CER
                                        </th>
                                        <th style="width: 30%;">
                                            Descrizione
                                        </th>
                                        <th style="width: 20%;">
                                            Prodotto Da
                                        </th>
                                        <th style="width: 10%;">
                                            Quantità
                                        </th>
                                        <th style="width: 10%;">
                                            Smaltito il
                                        </th>
                                        <th style="width: 20%;">
                                            Presso
                                        </th> 
                                        <th title="Giorni residui" style="width: 1%; text-align:right; white-space:nowrap;">
                                            <i class="fa fa-history"></i>
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="rpt_rifiuti_non_rientrati" runat="server" OnItemDataBound="rpt_rifiuti_caricati_ItemDataBound">
                                        <ItemTemplate>
                                            <tr class="gisri_report_row">
                                                <td id="td_label" runat="server" style="vertical-align:middle;border-left: 10px solid #000000;">
                                                    <div class="activity-icon activity-gisri activity-bg-law">
                                                        <i class="fa fa-graduation-cap"></i>
                                                    </div>
                                                </td>
                                                <td style="font-weight:bold; white-space:nowrap;">
                                                    <asp:Label ID="lbl_tab_codici_cer_cod" runat="server"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_rf_descrizione" runat="server"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_rf_produttore" runat="server"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_rf_quantita" runat="server"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_rf_data_smaltimento" runat="server"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_rf_destinazione" runat="server"></asp:Label>
                                                </td>
                                                <td style="white-space:nowrap;  text-align:right;">
                                                    <asp:Label ID="lbl_count_down" runat="server" Font-Italic="true" Width="100%"></asp:Label>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                    <asp:Repeater ID="rpt_rifiuti_scadenza_rientro" runat="server" OnItemDataBound="rpt_rifiuti_caricati_ItemDataBound">
                                        <ItemTemplate>
                                            <tr class="gisri_report_row">
                                                <td id="td_label" runat="server" style="vertical-align:middle;border-left: 10px solid #aa0000;">
                                                    <div class="activity-icon activity-gisri activity-bg-danger">
                                                        <i class="fa fa-truck"></i>
                                                    </div>
                                                </td>
                                                <td style="font-weight:bold; white-space:nowrap;">
                                                    <asp:Label ID="lbl_tab_codici_cer_cod" runat="server"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_rf_descrizione" runat="server"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_rf_produttore" runat="server"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_rf_quantita" runat="server"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_rf_data_smaltimento" runat="server"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_rf_destinazione" runat="server"></asp:Label>
                                                </td>
                                                <td style="white-space:nowrap;  text-align:right;">
                                                    <asp:Label ID="lbl_count_down" runat="server" Font-Italic="true" Width="100%" Height="22px"></asp:Label>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>
                        </div>
                        <hr />
                    </ItemTemplate>
                </asp:Repeater>
            </div> 
        </div>
    </div>

    <script type="text/javascript">

        function inizializzaSlider() {
            $('#slider_0').noUiSlider({
                direction: "ltr",
                start: <%=gg_ricerca%>,
                animate: false,
                connect: "lower",
                step: 5,
                range: {
                    min: 0,
                    max: 90
                }
            });

            $("#slider_0").on('set', function () {
                values = [
                Number($("#slider_0").val()),
                Number($("#slider_0").val())
                ];
                //alert(values[0]);
                javascript: __doPostBack('<%=btn_ricarica.UniqueID%>', values[0]);
            });

            $('#slider_0').noUiSlider_pips({
                mode: 'steps',
                density: 2
            });
        }

    </script>

</asp:Content>

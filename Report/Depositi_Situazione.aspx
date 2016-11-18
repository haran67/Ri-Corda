<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Start/GisRI.Master" EnableEventValidation="false"
    CodeBehind="Depositi_Situazione.aspx.vb" Inherits="GisRI_Web.Depositi_Oltre_Capienza" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Src="../Controls/rTextData.ascx" TagName="rTextData" TagPrefix="cc" %>
<%@ Register Src="../Controls/rDropDown.ascx" TagName="rDropDown" TagPrefix="cc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="../assets/plugins/nouislider/jquery.nouislider.css" />
    <link rel="stylesheet" type="text/css" href="../assets/plugins/nouislider/jquery.nouislider.pips.css" />
    <style>@media (max-width: 768px) { .btn {width: 100% !important;}}</style>
    <script type="text/javascript" src="../assets/plugins/nouislider/jquery.nouislider.all.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div style="height:10px;"></div>
    <div class="row">
        <div class="col-lg-12">
            <div class="content-panel">
                <h2 style="margin:0px!Important;">
                    <asp:Literal ID="ltl_st_denominazione" runat="server">Situazione depositi temporanei</asp:Literal></h2>
            </div>
        </div>
        <div class="col-lg-12">
            <div class="content-panel" style="padding:10px!Important;">
                <div >
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
                    <h4 style="font-weight:bold; margin:0px; margin-bottom:5px;">Percentuale di caricamento del deposito</h4>
                    <div class="noUi-control noUi-success" id="slider_0">
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
                        <h4 style="margin:5px!Important; margin-top:20px; font-weight:bold;"><asp:Literal ID="ltl_st_denominazione" runat="server"></asp:Literal></h4>
                        <asp:Repeater ID="rpt_prodottori" runat="server" OnItemDataBound="rpt_prodottori_ItemDataBound">
                            <ItemTemplate>
                                <h5 style="margin:5px!Important; font-weight:bold;" id="h5_rf" runat="server">Rifiuti prodotti da:&nbsp;<asp:Literal ID="ltl_prodottore" runat="server"></asp:Literal></h5>
                                <div class="overflow">
                                <table class="table table-striped table-advance table-hover" style="margin-bottom:2px!Important" id="tb_dt_tot" runat="server">
                                    <thead>
                                        <tr style="white-space:nowrap;">
                                            <th colspan="10">
                                                Deposito su tutti i rifiuti
                                            </th>
                                        </tr>
                                        <tr style="white-space:nowrap;">
                                            <th style="width: 5%; white-space:nowrap;">
                                                Volume attuale
                                            </th>
                                            <th style="width: 10%; text-align:left;">
                                                <asp:Label ID="lbl_deposito_tot" runat="server"></asp:Label>
                                            </th>
                                            <th style="width: 5%; white-space:nowrap;">
                                                Limite massimo
                                            </th>
                                            <th style="width: 10%; text-align:left;">
                                                <asp:Label ID="lbl_deposito_tot_max" runat="server"></asp:Label>
                                            </th>
                                            <th style="width: 5%; white-space:nowrap;">
                                                Percentuale
                                            </th>
                                            <th style="width: 10%; text-align:left;">
                                                <asp:Label ID="lbl_deposito_tot_perc" runat="server"></asp:Label>
                                            </th>
                                            <th style="width: 55%;">

                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr class="gisri_report_row">
                                            <td colspan="10">
                                                <div class="progress progress-striped gisri_progress" id="div_progress_deposito_tot"
                                                    runat="server">
                                                    <div class="progress-bar progress-bar-success" role="progressbar" id="div_progress_deposito_tot_bar"
                                                        runat="server" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <table class="table table-striped table-advance table-hover" id="tb_dt_per" runat="server">
                                    <thead>
                                        <tr style="white-space:nowrap; color:Red;">
                                            <th colspan="10">
                                                Deposito sui rifiuti pericolosi
                                            </th>
                                        </tr>
                                        <tr style="white-space:nowrap;">
                                            <th style="width: 5%; white-space:nowrap;">
                                                Volume attuale
                                            </th>
                                            <th style="width: 10%; text-align:left;">
                                                <asp:Label ID="lbl_deposito_per" runat="server"></asp:Label>
                                            </th>
                                            <th style="width: 5%; white-space:nowrap;">
                                                Limite massimo
                                            </th>
                                            <th style="width: 10%; text-align:left;">
                                                <asp:Label ID="lbl_deposito_per_max" runat="server"></asp:Label>
                                            </th>
                                            <th style="width: 5%; white-space:nowrap;">
                                                Percentuale
                                            </th>
                                            <th style="width: 10%; text-align:left;">
                                                <asp:Label ID="lbl_deposito_per_perc" runat="server"></asp:Label>
                                            </th>
                                            <th style="width: 55%;">

                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr class="gisri_report_row">
                                            <td colspan="10">
                                                <div class="progress progress-striped gisri_progress" id="div_progress_deposito_per"
                                                    runat="server">
                                                    <div class="progress-bar progress-bar-success" role="progressbar" id="div_progress_deposito_per_bar"
                                                        runat="server" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
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
                start: <%=perc_ricerca%>,
                animate: false,
                connect: "lower",
                step: 5,
                range: {
                    min: 0,
                    max: 100
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

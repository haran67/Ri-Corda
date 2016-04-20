<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Start/GisRI.Master" EnableEventValidation="false"
    CodeBehind="Depositi_Grafico.aspx.vb" Inherits="GisRI_Web.Depositi_Grafico" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Src="../Controls/rTextData.ascx" TagName="rTextData" TagPrefix="cc" %>
<%@ Register Src="../Controls/rDropDown.ascx" TagName="rDropDown" TagPrefix="cc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- BEGIN PAGE LEVEL PLUGINS -->
    <script src="../assets/plugins/flot/jquery.flot.min.js" type="text/javascript"></script>
    <script src="../assets/plugins/flot/jquery.flot.resize.min.js" type="text/javascript"></script>
    <script src="../assets/plugins/flot/jquery.flot.categories.min.js" type="text/javascript"></script>
    <script src="../assets/plugins/flot/jquery.flot.time.min.js" type="text/javascript"></script>
    <!-- END PAGE LEVEL PLUGINS -->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div style="height:10px;"></div> 
    <div class="row">
        <div class="col-lg-12">
            <div class="content-panel" style="padding-left:10px!Important;padding-top:10px!Important; margin-bottom:10px;">
                <h2 style="margin:0px!Important;">
                    <asp:Literal ID="ltl_st_denominazione" runat="server">Evoluzione depositi</asp:Literal></h2>
            </div> 
        </div> 
        <div class="col-lg-12">
            <div class="content-panel" style="padding:10px!Important;">
                <div style="height:10px;"></div>
                <div style="margin:20px;" >
                    <h4 style="font-weight:bold; margin:0px; margin-bottom:5px;">Intervallo di visibilità</h4> 
                    <div class="form-body" style="">
                        <div id="div_titolarita" runat="server">
                            <div class="row">
                                <div class="col-md-2">
                                    <cc:rTextData ID="txt_st_da_data" runat="server" MaxLength="10" AutoPostBack="false"
                                        Label="Da data" Icon="fa fa-calendar" Text="01/01/2015" Form_Vertical="true" />
                                </div>
                                <div class="col-md-2">
                                    <cc:rTextData ID="txt_st_a_data" runat="server" MaxLength="10" AutoPostBack="false"
                                        Label="A data" Icon="fa fa-calendar" Text="31/12/2015" Form_Vertical="true" />
                                </div>
                                <div class="col-md-3">
                                    <cc:rDropDown ID="ddl_st_periodo" runat="server" AutoPostBack="false"
                                        Label="Periodo Permanenza" Placeholder="Seleziona..." Form_Vertical="true" />
                                </div>
                                <div class="col-md-3">
                                    <cc:rDropDown ID="ddl_st_sito" runat="server" AutoPostBack="false" Select2="true"
                                        Label="Sito" Placeholder="Seleziona..." Form_Vertical="true" />
                                </div>
                                <div class="col-md-2">
                                    <label class="control-label col-md-3" style="white-space:nowrap;" id="label_control" runat="server">
                                    &nbsp;</label>
                                    <asp:LinkButton ID="btn_aggiorna" runat="server" CssClass="btn btn-primary">
                                        <i class="fa fa-check"></i> Aggiorna Report
                                    </asp:LinkButton>
                                </div> 
                            </div>
                        </div>
                    </div>
                </div>
                <div style="height:10px;"></div>
                <asp:Repeater ID="rpt_siti" runat="server">
                    <ItemTemplate>
                        <h3 style="color:#666;font-weight:bold;" id="h3_st" runat="server">
                            <asp:Image ID="img_societa" runat="server" ImageUrl="../favicon/android-icon-192x192.png" Height="40" Style="padding-bottom:5px;" />
                            <asp:Literal ID="ltl_sc_ragione_sociale" runat="server"></asp:Literal>
                        </h3>
                        <h4 style="margin:5px!Important; margin-top:20px; font-weight:bold;" id="h4_st" runat="server"><asp:Literal ID="ltl_st_denominazione" runat="server"></asp:Literal></h4>
                        <asp:Repeater ID="rpt_prodottori" runat="server" OnItemDataBound="rpt_prodottori_ItemDataBound">
                            <ItemTemplate>
                                <h5 style="margin:5px!Important; font-weight:bold;" id="h5_rf" runat="server">Produttore:&nbsp;<asp:Literal ID="ltl_prodottore" runat="server"></asp:Literal></h5>
                                <table class="table table-striped table-advance table-hover" style="margin-bottom:2px!Important" id="tb_dt_tot" runat="server">
                                    <thead>
                                        <tr style="white-space:nowrap;">
                                            <th colspan="10">
                                                Situazione globale
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr class="gisri_report_row">
                                            <td colspan="10">
                                                <div id="chart_np" runat="server" style="height:300px;"></div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table> 
                                <table class="table table-striped table-advance table-hover" id="tb_dt_per" runat="server">
                                    <thead>
                                        <tr style="white-space:nowrap; color:Red;">
                                            <th colspan="10">
                                                Situazione sui rifiuti pericolosi
                                            </th>
                                        </tr> 
                                    </thead>
                                    <tbody>
                                        <tr class="gisri_report_row">
                                            <td colspan="10">
                                                <div id="chart_p" runat="server" style="height:300px;"></div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </ItemTemplate>
                        </asp:Repeater>
                        <hr />
                    </ItemTemplate>
                
                </asp:Repeater>
            </div> 
        </div>
    </div>

    <script type="text/javascript">

            function chart_np(pageviews,visitors,chart_id) {

//                function randValue() {
//                    return (Math.floor(Math.random() * (1 + 40 - 20))) + 20;
//                }
//                var pageviews = [
//                    [1214604000000, randValue()],
//                    [1217714400000, randValue()],
//                    [1220565600000, 2 + randValue()],
//                ];
//                var visitors = [
//                    [1214604000000, randValue() - 5],
//                    [1217714400000, randValue() - 5],
//                    [1220565600000, randValue() - 5],
//                ];

                var plot = $.plot($("#" + chart_id), [{
                            data: pageviews,
                            label: "Volume totale",
                            lines: {
                                lineWidth: 1,
                            },
                            shadowSize: 0

                        }, {
                            data: visitors,
                            label: "Limite deposito",
                            lines: {
                                lineWidth: 1,
                            },
                            shadowSize: 0
                        }
                    ], {
                        series: {
                            lines: {
                                show: true,
                                lineWidth: 2,
                                fill: true,
                                fillColor: {
                                    colors: [{
                                            opacity: 0.05
                                        }, {
                                            opacity: 0.01
                                        }
                                    ]
                                }
                            },
                            points: {
                                show: true,
                                radius: 3,
                                lineWidth: 1
                            },
                            shadowSize: 2
                        },
                        grid: {
                            hoverable: true,
                            clickable: true,
                            tickColor: "#eee",
                            borderColor: "#eee",
                            borderWidth: 1
                        },
                        colors: ["#d12610", "#37b7f3", "#52e136"],
                        xaxis: {
                            mode: "time",
                            timeformat: "%b %Y",
                            monthNames: ["Gen", "Feb", "Mar", "Apr", "Mag", "Giu", "Lug", "Ago", "Set", "Ott", "Nov", "Dic"],
                            tickColor: "#eee",
                        },
                        yaxis: {
                            ticks: 11,
                            tickDecimals: 0,
                            tickColor: "#eee",
                        }
                    });


                function showTooltip(x, y, contents) {
                    $('<div id="tooltip">' + contents + '</div>').css({
                            position: 'absolute',
                            display: 'none',
                            top: y + 5,
                            left: x + 15,
                            border: '1px solid #333',
                            padding: '4px',
                            color: '#fff',
                            'border-radius': '3px',
                            'background-color': '#333',
                            opacity: 0.80
                        }).appendTo("body").fadeIn(200);
                }

                var previousPoint = null;
                $("#" + chart_id).bind("plothover", function (event, pos, item) {
                    $("#x").text(pos.x.toFixed(2));
                    $("#y").text(pos.y.toFixed(2));

                    if (item) {
                        if (previousPoint != item.dataIndex) {
                            previousPoint = item.dataIndex;

                            $("#tooltip").remove();
                            var x = item.datapoint[0].toFixed(2),
                                y = item.datapoint[1].toFixed(2);
                            var d = new Date(item.datapoint[0]);
                            //alert(d);
                            showTooltip(item.pageX, item.pageY, item.series.label + " = " + y + " m3 al " + d.toLocaleDateString());
                        }
                    } else {
                        $("#tooltip").remove();
                        previousPoint = null;
                    }
                });
            }

    </script>

</asp:Content>

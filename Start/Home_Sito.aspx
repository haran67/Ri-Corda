<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Start/GisRI.Master"
    CodeBehind="Home_Sito.aspx.vb" Inherits="GisRI_Web.Home_Sito" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../assets/plugins/bootstrap-summernote/summernote.css" rel="stylesheet" />
    <script type="text/javascript">
        function Init_bootstrapSwitch() {
            if (!$().bootstrapSwitch) {
                return;
            }
            $('.make-switch').bootstrapSwitch();
        }

        function Init_ToolTips() {
            $('[data-toggle="tooltip"]').tooltip();
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    
    <div style="height:10px;"></div> 
    <div class="row">
        <div class="col-lg-12">
            <div class="content-panel" style="padding-left:10px!Important;padding-top:10px!Important; margin-bottom:10px;">
                <h3 style="margin:0px!Important;">
                    <i class="fa fa-home"></i>&nbsp;<asp:Literal ID="ltl_st_denominazione" runat="server"></asp:Literal></h3>
            </div> 
        </div> 
        <div class="col-lg-8">
            <div class="content-panel" style="padding:10px!Important;">
                <div class="alert alert-danger alert-dismissable" id="div_message_registri_ko" runat="server"
                    visible="false">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">
                        x
                    </button>
                    <i class="fa-lg fa fa-warning"></i><strong>&nbsp;Attenzione! Nessun registro attivo per questo sito</strong>
                    <asp:Literal ID="ltl_messaggio_ko" runat="server"></asp:Literal>
                </div>
                <asp:LinkButton ID="btn_registro" runat="server" CssClass="btn btn-default btn-lg gisri_button_home">
                    <i class="fa fa-book"></i>&nbsp;Nuovo Registro
                </asp:LinkButton>
                <asp:LinkButton ID="btn_rifiuto" runat="server" CssClass="btn btn-default btn-lg gisri_button_home">
                    <i class="fa fa-trash-o"></i>&nbsp;Nuovo Rifiuto
                </asp:LinkButton>
                <asp:LinkButton ID="btn_smaltisci" runat="server" CssClass="btn btn-default btn-lg gisri_button_home">
                    <i class="fa fa-truck"></i>&nbsp;Avvio a Destino
                </asp:LinkButton>
                <asp:LinkButton ID="btn_sito" runat="server" CssClass="btn btn-default btn-lg gisri_button_home">
                    <i class="fa fa-home"></i>&nbsp;Anagrafica Sito
                </asp:LinkButton>
                &nbsp;
                <div style="height:10px;"></div>
                <asp:UpdatePanel ID="udp_griglie" runat="server">
                    <ContentTemplate>
                        <table class="table table-striped table-advance table-hover">
                            <thead>
                                <tr>
                                    <th colspan="7" style="width: 50%; text-align: center; font-size: 15px;">
                                        <asp:LinkButton ID="btn_filtri_prodotti" runat="server" CssClass="btn btn-default btn-xs gisri_button_ws"
                                            ToolTip="Visualizza i filtri" Height="25" Style="padding-top: 6px; padding-left: 1px;">
                                            <i class="fa fa-filter"></i>
                                        </asp:LinkButton>&nbsp; RIFIUTI PRODOTTI
                                        <div class="row" id="div_filtri_prodotti" runat="server" visible="false">
                                            <div class="form-body" style="margin-left: 30px!Important; margin-right: 30px!Important;
                                                margin-top: 5px;">
                                                <div class="row">
                                                    <div class="col-xs-3 gisri_row_filter">
                                                        <div class="input-group" style="width: 100%">
                                                            <div>
                                                                <asp:TextBox ID="txt_filter_codice" runat="server" CssClass="form-control gisri_form_filter"
                                                                    AutoPostBack="true" placeholder="Codice CER"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-4 gisri_row_filter">
                                                        <div class="input-group" style="width: 100%">
                                                            <div>
                                                                <asp:DropDownList ID="ddl_rf_produttore_key" runat="server" CssClass="form-control gisri_form_filter"
                                                                    AutoPostBack="true">
                                                                </asp:DropDownList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-4 gisri_row_filter">
                                                        <div class="input-group" style="width: 100%">
                                                            <div>
                                                                <asp:DropDownList ID="ddl_stati_rifiuto" runat="server" CssClass="form-control gisri_form_filter"
                                                                    AutoPostBack="true">
                                                                    <asp:ListItem Text="Tutti gli stati" Value=""></asp:ListItem>
                                                                    <asp:ListItem Text="Da registrare" Value="R"></asp:ListItem>
                                                                    <asp:ListItem Text="Da confermare" Value="C"></asp:ListItem>
                                                                    <asp:ListItem Text="In attesa" Value="I"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-1 gisri_row_filter gisri_row_filter_right">
                                                        <asp:LinkButton ID="btn_reset_filter" runat="server" CssClass="btn btn-default btn-xs gisri_button_ws"
                                                            ToolTip="Pulisce Filtri" Height="25" Style="padding-top: 6px; padding-left: 1px;">
                                                    <i class="fa fa-eraser"></i>  
                                                        </asp:LinkButton>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </th>
                                </tr>
                                <tr>
                                    <th style="width: 10%;">
                                        <asp:LinkButton ID="btn_rp_order_cer" runat="server" CommandName="CER" OnClick="btn_rp_order_cer_click"
                                            ForeColor="Black">CER</asp:LinkButton>
                                    </th>
                                    <th style="width: 20%;">
                                        <asp:LinkButton ID="btn_rp_order_data" runat="server" CommandName="DATA" OnClick="btn_rp_order_cer_click"
                                            ForeColor="Black">Prodotto Il</asp:LinkButton>
                                    </th>
                                    <th style="width: 20%;">
                                        Prodotto Da
                                    </th>
                                    <th class="hidden-xs hidden-sm" style="width: 40%; ">
                                        Descrizione
                                    </th>
                                    <th style="width: 10%;">
                                        <asp:LinkButton ID="btn_rp_order_peso" runat="server" CommandName="PESO" OnClick="btn_rp_order_cer_click"
                                            ForeColor="Black">Quantità</asp:LinkButton>
                                    </th>
                                    <th style="width: 1%;">
                                    </th>
                                    <th title="Giorni residui" style="width: 1%; text-align: right; white-space: nowrap;" >
                                        <asp:LinkButton ID="btn_rp_order_cd" runat="server" CommandName="CD" OnClick="btn_rp_order_cer_click"
                                            ForeColor="Black"><i class="fa fa-history"></i></asp:LinkButton>
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="rpt_rifiuti_caricati" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td style="font-weight: bold; white-space: nowrap;">
                                                <asp:Label ID="lbl_tab_codici_cer_cod" runat="server"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="lbl_rf_data_produzione" runat="server"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="lbl_rf_produttore" runat="server"></asp:Label>
                                            </td>
                                            <td class="hidden-xs hidden-sm">
                                                <asp:Label ID="lbl_rf_descrizione" runat="server"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="lbl_rf_quantita" runat="server"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:LinkButton ID="btn_vai" runat="server" CssClass="btn btn-warning btn-xs button-link-w gisri_button_list"
                                                    CommandName="SCHEDA">
                                            <i class=" fa fa-edit"></i>&nbsp;REGISTRA
                                                </asp:LinkButton>
                                            </td>
                                            <td style="white-space: nowrap; text-align: right;">
                                                <asp:Label ID="lbl_count_down" runat="server" Font-Italic="true" Width="100%" Height="22px"></asp:Label>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                        <div style="height: 10px;">
                        </div>
                        <table class="table table-striped table-advance table-hover">
                            <thead>
                                <tr>
                                    <th colspan="7" style="width: 50%; text-align: center; font-size: 15px;">
                                        <asp:LinkButton ID="btn_filtri_smaltiti" runat="server" CssClass="btn btn-default btn-xs gisri_button_ws"
                                            ToolTip="Visualizza i filtri" Height="25" Style="padding-top: 6px; padding-left: 1px;">
                                            <i class="fa fa-filter"></i>
                                        </asp:LinkButton>&nbsp; RIFIUTI A DESTINO
                                        <div class="row" id="div_filtri_smaltiti" runat="server" visible="false">
                                            <div class="form-body" style="margin-left: 30px!Important; margin-right: 30px!Important;
                                                margin-top: 5px;">
                                                <div class="row">
                                                    <div class="col-xs-3 gisri_row_filter">
                                                        <div class="input-group" style="width: 100%">
                                                            <div>
                                                                <asp:TextBox ID="txt_filter_codice_smaltiti" runat="server" CssClass="form-control gisri_form_filter"
                                                                    AutoPostBack="true" placeholder="Codice CER"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-4 gisri_row_filter">
                                                        <div class="input-group" style="width: 100%">
                                                            <div>
                                                                <asp:DropDownList ID="ddl_rs_produttore_key" runat="server" CssClass="form-control gisri_form_filter"
                                                                    AutoPostBack="true">
                                                                </asp:DropDownList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-4 gisri_row_filter">
                                                        <div class="input-group" style="width: 100%">
                                                            <div>
                                                                <asp:DropDownList ID="ddl_stati_rifiuto_smaltiti" runat="server" CssClass="form-control gisri_form_filter"
                                                                    AutoPostBack="true">
                                                                    <asp:ListItem Text="Tutti gli stati" Value=""></asp:ListItem>
                                                                    <asp:ListItem Text="Da registrare" Value="R"></asp:ListItem>
                                                                    <asp:ListItem Text="Ricevuta 4° copia" Value="4"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-1 gisri_row_filter gisri_row_filter_right">
                                                        <asp:LinkButton ID="btn_reset_filter_smaltiti" runat="server" CssClass="btn btn-default btn-xs gisri_button_ws"
                                                            ToolTip="Pulisce Filtri" Height="25" Style="padding-top: 6px; padding-left: 1px;">
                                                    <i class="fa fa-eraser"></i>  
                                                        </asp:LinkButton>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        
                                    </th>
                                </tr>
                                <tr>
                                    <th style="width: 10%;">
                                        <asp:LinkButton ID="btn_rs_order_cer" runat="server" CommandName="CER" OnClick="btn_rs_order_cer_click"
                                            ForeColor="Black">CER</asp:LinkButton>
                                    </th>
                                    <th style="width: 10%;" class="hidden-xs hidden-sm">
                                        FIR
                                    </th>
                                    <th style="width: 15%;">
                                        <asp:LinkButton ID="btn_rs_order_data" runat="server" CommandName="DATA" OnClick="btn_rs_order_cer_click"
                                            ForeColor="Black">Smaltito Il</asp:LinkButton>
                                        
                                    </th>
                                    <th style="width: 20%;" class="hidden-xs hidden-sm">
                                        Prodotto Da
                                    </th>
                                    <th style="width: 35%;">
                                        Presso
                                    </th>
                                    <th style="width: 10%;">
                                        <asp:LinkButton ID="btn_rs_order_peso" runat="server" CommandName="PESO" OnClick="btn_rs_order_cer_click"
                                            ForeColor="Black">Quantità</asp:LinkButton>
                                    </th>
                                    <th style="width: 1%;">
                                    </th>
                                    <th title="Giorni residui" style="width: 1%; text-align: right; white-space: nowrap;">
                                        <asp:LinkButton ID="btn_rs_order_cd" runat="server" CommandName="CD" OnClick="btn_rs_order_cer_click"
                                            ForeColor="Black"><i class="fa fa-history"></i></asp:LinkButton>
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="rpt_in_smaltimento" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td style="font-weight: bold; white-space: nowrap;">
                                                <asp:Label ID="lbl_tab_codici_cer_cod" runat="server"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="lbl_rs_formulario_numero" runat="server"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="lbl_rs_data_trasporto" runat="server"></asp:Label>
                                            </td>
                                            <td class="hidden-xs hidden-sm">
                                                <asp:Label ID="lbl_rf_produttore" runat="server"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="lbl_rs_destinatario" runat="server"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="lbl_rs_peso_iniziale" runat="server"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:LinkButton ID="btn_vai" runat="server" CssClass="btn btn-warning btn-xs button-link-w gisri_button_list"
                                                    CommandName="SCHEDA">
                                            <i class=" fa fa-edit"></i>&nbsp;REGISTRA
                                                </asp:LinkButton>
                                            </td>
                                            <td style="white-space: nowrap; text-align: right;">
                                                <asp:Label ID="lbl_count_down" runat="server" Font-Italic="true" Width="100%" Height="22px"></asp:Label>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            
            </div> 
        </div>
        <div class="col-lg-4" style="padding-left:0px!Important;">
            <div class="content-panel" style="padding:10px!Important;">

                <div style="width:100%; text-align:center;" id="div_depositi_T" runat="server">
                    <h5 style="font-size:16px!Important; font-weight:bold;">
                        DEPOSITI TEMPORANEI</h5>
                </div>
                <div class="detailed mt" id="div_depositi_D" runat="server">
                    <! --/recent-activity -->
                    <div class="panel-group accordion" id="accordion3">
                        <asp:Repeater ID="rpt_depositi" runat="server">
                            <ItemTemplate>
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a class="accordion-toggle accordion-toggle-styled" data-toggle="collapse" data-parent="#accordion3"
                                                href="#collapse_3_1" style="color: #428bca!Important;" id="acc_title" runat="server">
                                                <asp:Literal ID="ltl_nome_deposito" runat="server"></asp:Literal>
                                            </a>
                                        </h4>
                                    </div>
                                    <div class="panel-collapse in" id="acc_panel" runat="server"> <!--id="collapse_3_1" -->
                                        <div class="panel-body">
                                            <div class="progress progress-striped gisri_progress" id="div_progress_deposito"
                                                runat="server">
                                                <div class="progress-bar progress-bar-success" role="progressbar" id="div_progress_deposito_bar"
                                                    runat="server" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                                                </div>
                                                <span class="gisri_progress_label gisri_progress_bar" id="span_progress" runat="server">
                                                    <asp:Literal ID="ltl_progress" runat="server"></asp:Literal></span>
                                            </div>
                                            <div class="progress progress-striped gisri_progress" id="div_progress_pericolosi"
                                                runat="server">
                                                <div class="progress-bar progress-bar-danger" role="progressbar" id="div_progress_pericolosi_bar"
                                                    runat="server" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                                                </div>
                                                <span class="gisri_progress_label gisri_progress_bar" id="span_progress_pericolosi" runat="server">
                                                    <asp:Literal ID="ltl_progress_pericolosi" runat="server"></asp:Literal></span>
                                            </div>
                                            <div class="recent-activity" style="margin-top:10px;">
                                                <table style="width: 100%;">
                                                    <tr>
                                                        <td style="width: 30px; padding-right: 5px; vertical-align: middle;">
                                                        </td>
                                                        <td style="white-space: nowrap;">
                                                            <div class="activity-panel" style="margin-bottom: 10px; margin-left: 15px;">
                                                                <div class="row">
                                                                    <div class="col-xs-4">
                                                                        <h5>
                                                                            Codice</h5>
                                                                    </div>
                                                                    <div class="col-xs-4">
                                                                        <h5>
                                                                            Quantità</h5>
                                                                    </div>
                                                                    <div class="col-xs-4">
                                                                        <h5>
                                                                            Entro il</h5>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:Repeater ID="rpt_deposito_law" runat="server" OnItemDataBound="rpt_deposito_ItemDataBound">
                                                    <HeaderTemplate>
                                                        <div class="row" style="padding-left: 15px; padding-right: 15px; padding-bottom: 10px;">
                                                            <table style="width: 100%;">
                                                                <tr>
                                                                    <td style="width: 30px; padding-right: 5px; vertical-align: middle;">
                                                                        <div class="activity-icon activity-gisri activity-bg-law">
                                                                            <i class="fa fa-graduation-cap"></i>
                                                                        </div>
                                                                    </td>
                                                                    <td style="white-space: nowrap;">
                                                                        <div class="activity-panel" style="border-left: 10px solid #000000; max-height: 300px;
                                                                            overflow: auto;">
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <div class="row">
                                                            <div class=" col-xs-4">
                                                                <h5>
                                                                    <asp:Label ID="lbl_codice_cer" runat="server"></asp:Label></h5>
                                                            </div>
                                                            <div class=" col-xs-4">
                                                                <h5>
                                                                    <asp:Label ID="lbl_qta_da_smaltire" runat="server"></asp:Label></h5>
                                                            </div>
                                                            <div class=" col-xs-4">
                                                                <h5>
                                                                    <asp:Label ID="lbl_data_entro" runat="server"></asp:Label></h5>
                                                            </div>
                                                        </div>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        </div> </td> </tr> </table> </div>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                                <asp:Repeater ID="rpt_deposito_danger" runat="server" OnItemDataBound="rpt_deposito_ItemDataBound">
                                                    <HeaderTemplate>
                                                        <div class="row" style="padding-left: 15px; padding-right: 15px; padding-bottom: 10px;">
                                                            <table style="width: 100%;">
                                                                <tr>
                                                                    <td style="width: 30px; padding-right: 5px; vertical-align: middle;">
                                                                        <div class="activity-icon activity-gisri activity-bg-danger">
                                                                            <i class="fa fa-truck"></i>
                                                                        </div>
                                                                    </td>
                                                                    <td style="white-space: nowrap;">
                                                                        <div class="activity-panel" style="border-left: 10px solid #aa0000; max-height: 300px;
                                                                            overflow: auto;">
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <div class="row">
                                                            <div class=" col-xs-4">
                                                                <h5>
                                                                    <asp:Label ID="lbl_codice_cer" runat="server"></asp:Label></h5>
                                                            </div>
                                                            <div class=" col-xs-4">
                                                                <h5>
                                                                    <asp:Label ID="lbl_qta_da_smaltire" runat="server"></asp:Label></h5>
                                                            </div>
                                                            <div class=" col-xs-4">
                                                                <h5>
                                                                    <asp:Label ID="lbl_data_entro" runat="server"></asp:Label></h5>
                                                            </div>
                                                        </div>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        </div> </td> </tr> </table> </div>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                                <asp:Repeater ID="rpt_deposito_warning" runat="server" OnItemDataBound="rpt_deposito_ItemDataBound">
                                                    <HeaderTemplate>
                                                        <div class="row" style="padding-left: 15px; padding-right: 15px; padding-bottom: 10px;">
                                                            <table style="width: 100%;">
                                                                <tr>
                                                                    <td style="width: 30px; padding-right: 5px; vertical-align: middle;">
                                                                        <div class="activity-icon activity-gisri activity-bg-warning">
                                                                            <i class="fa fa-gears"></i>
                                                                        </div>
                                                                    </td>
                                                                    <td style="white-space: nowrap;">
                                                                        <div class="activity-panel" style="border-left: 10px solid #F1C500; max-height: 300px;
                                                                            overflow: auto;">
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <div class="row">
                                                            <div class=" col-xs-4">
                                                                <h5>
                                                                    <asp:Label ID="lbl_codice_cer" runat="server"></asp:Label></h5>
                                                            </div>
                                                            <div class=" col-xs-4">
                                                                <h5>
                                                                    <asp:Label ID="lbl_qta_da_smaltire" runat="server"></asp:Label></h5>
                                                            </div>
                                                            <div class=" col-xs-4">
                                                                <h5>
                                                                    <asp:Label ID="lbl_data_entro" runat="server"></asp:Label></h5>
                                                            </div>
                                                        </div>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        </div> </td> </tr> </table> </div>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                                <asp:Repeater ID="rpt_deposito_calm" runat="server" OnItemDataBound="rpt_deposito_ItemDataBound">
                                                    <HeaderTemplate>
                                                        <div class="row" style="padding-left: 15px; padding-right: 15px; padding-bottom: 10px;">
                                                            <table style="width: 100%;">
                                                                <tr>
                                                                    <td style="width: 30px; padding-right: 5px; vertical-align: middle;">
                                                                        <div class="activity-icon activity-gisri activity-bg-success">
                                                                            <i class="fa fa-recycle"></i>
                                                                        </div>
                                                                    </td>
                                                                    <td style="white-space: nowrap;">
                                                                        <div class="activity-panel" style="border-left: 10px solid #067700; max-height: 300px;
                                                                            overflow: auto;">
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <div class="row">
                                                            <div class=" col-xs-4">
                                                                <h5>
                                                                    <asp:Label ID="lbl_codice_cer" runat="server"></asp:Label></h5>
                                                            </div>
                                                            <div class=" col-xs-4">
                                                                <h5>
                                                                    <asp:Label ID="lbl_qta_da_smaltire" runat="server"></asp:Label></h5>
                                                            </div>
                                                            <div class=" col-xs-4">
                                                                <h5>
                                                                    <asp:Label ID="lbl_data_entro" runat="server"></asp:Label></h5>
                                                            </div>
                                                        </div>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        </div> </td> </tr> </table> </div>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>

                    </div>
                </div> 

                <asp:Repeater ID="rpt_registri" runat="server">
                    <HeaderTemplate>
                        <table class="table table-striped table-advance table-hover">
                            <thead>
                                <tr>
                                    <th colspan="2" style="width: 50%; text-align:center; font-size:15px;">
                                        REGISTRI PRESENTI
                                    </th>
                                </tr> 
                                <tr>
                                    <th style="width: 40%;">
                                        Titolo
                                    </th>
                                    <th style="width: 60%;">
                                        Intestatario
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td>
                                <asp:LinkButton ID="lnk_rr_titolo" runat="server" CommandName="OPEN"></asp:LinkButton>
                            </td>
                            <td>
                                <asp:Label ID="lbl_rr_proprietario" runat="server" Font-Bold="true"></asp:Label>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate >
                            </tbody>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
                
                <asp:Repeater ID="rpt_personale_assegnato" runat="server">
                    <HeaderTemplate>
                        <table class="table table-striped table-advance table-hover">
                            <thead>
                                <tr>
                                    <th colspan="2" style="width: 50%; text-align:center; font-size:15px;">
                                        PERSONALE TITOLARE
                                    </th>
                                </tr> 
                                <tr>
                                    <th style="width: 60%;">
                                        Nominativo
                                    </th>
                                    <th style="width: 40%;">
                                        Ruolo
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td>
                                <asp:LinkButton ID="lnk_st_nominativo" runat="server" CommandName="OPEN" data-toggle="tooltip" data-placement="left" CssClass="red-tooltip"></asp:LinkButton>
                            </td>
                            <td style="white-space:nowrap;">
                                <asp:Label ID="lbl_st_ruolo" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate >
                            </tbody>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
                <asp:Repeater ID="rpt_titolarita_ditte" runat="server">
                    <HeaderTemplate>
                        <table class="table table-striped table-advance table-hover">
                            <thead>
                                <tr>
                                    <th colspan="2" style="width: 50%; text-align:center; font-size:15px;">
                                        DITTE OPERATRICI IN SITO
                                    </th>
                                </tr> 
                                <tr>
                                    <th style="width: 60%;">
                                        Ditta
                                    </th>
                                    <th style="width: 40%;">
                                        Ruolo
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td>
                                <asp:LinkButton ID="lnk_st_ditta_desc" runat="server" CommandName="OPEN"></asp:LinkButton>
                            </td>
                            <td style="white-space:nowrap;">
                                <asp:Label ID="lbl_st_ruolo" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                            </tbody>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>

            </div>
        </div>
    </div>
</asp:Content>

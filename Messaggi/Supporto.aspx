<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Supporto.aspx.vb" Inherits="GisRI_Web.Supporto1" %>

<%@ Register Src="../Messaggi/Supporto.ascx" TagName="Supporto" TagPrefix="cc" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Ri.-C.O.R.D.A. by ambiente sc</title>
    <link href="../assets/css/bootstrap.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../assets/plugins/select2/select2.css"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../assets/font-awesome/css/font-awesome.css" />
    <link rel="stylesheet" type="text/css" href="../assets/css/gisri.css" />
    <link rel="stylesheet" type="text/css" href="../assets/css/select2.css" />
    <!-- Custom styles for this template -->
    <link href="../assets/css/style.css" rel="stylesheet" />
    <link href="../assets/css/style-responsive.css" rel="stylesheet" />
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script src="../assets/js/jquery.js" type="text/javascript"></script>
    <script src="../assets/js/jquery-1.8.3.min.js" type="text/javascript"></script>
    <script src="../assets/js/jquery-ui-1.9.2.custom.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="../assets/plugins/select2/select2.min.js"></script>
    <script type="text/javascript" src="../assets/plugins/select2/select2_locale_it.js"></script>
    <script type="text/javascript" src="../assets/js/utility.js"></script>
    <script type="text/javascript">
        function initSelect2() {
            if ($().select2) {
                $('select.select2me').select2({
                    placeholder: "Select",
                    allowClear: true
                });
            }
        }
        function initMultipleSelect2() {
            if ($().select2) {
                $('select[multiple="multiple"]').each(function () {
                    $('.select2-search-choice').remove();
                    $(this).on("change", function (e) {
                        //alert("change val=" + e.val);
                        PageMethods.SalvaSelect2MultipleValues(e.val, PMSuccess, PMFailure);
                    })
                });
            }
        }

    </script>
</head>
<body>
    <form id="frmSupporto" runat="server">
    <telerik:RadScriptManager ID="RadScriptManager1" runat="server" EnableScriptGlobalization="true"
        EnablePageMethods="true" EnableScriptLocalization="true" AsyncPostBackTimeout="3600">
    </telerik:RadScriptManager>
    <div>
        <section id="container">
            <cc:Supporto ID="Supporto" Staccabile="false" runat="server" />
        </section>
    </div>
    </form>
    <script type="text/javascript">
        $(document).ready(function () {
            initSelect2();
            initMultipleSelect2();
            $('#myModalSupport').removeClass("modal fade");
            $('#modal_body').removeClass("modal-dialog modal-lg");
        });
    </script>
</body>
</html>

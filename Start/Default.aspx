<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Default.aspx.vb" Inherits="GisRI_Web._Default1" %>

<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="it">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
    <meta content="" charset="utf-8" />
    <title>Ri.-C.O.R.D.A.</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="" />
    <meta name="author" content="Mesys S.r.l." />
    <meta name="keyword" content="Rifiuti per ambiente s.c." />

    <link rel="apple-touch-icon" sizes="57x57" href="/Favicon/apple-icon-57x57.png" />
    <link rel="apple-touch-icon" sizes="60x60" href="/Favicon/apple-icon-60x60.png" />
    <link rel="apple-touch-icon" sizes="72x72" href="/Favicon/apple-icon-72x72.png" />
    <link rel="apple-touch-icon" sizes="76x76" href="/Favicon/apple-icon-76x76.png" />
    <link rel="apple-touch-icon" sizes="114x114" href="/Favicon/apple-icon-114x114.png" />
    <link rel="apple-touch-icon" sizes="120x120" href="/Favicon/apple-icon-120x120.png" />
    <link rel="apple-touch-icon" sizes="144x144" href="/Favicon/apple-icon-144x144.png" />
    <link rel="apple-touch-icon" sizes="152x152" href="/Favicon/apple-icon-152x152.png" />
    <link rel="apple-touch-icon" sizes="180x180" href="/Favicon/apple-icon-180x180.png" />
    <link rel="icon" type="image/png" sizes="192x192"  href="/Favicon/android-icon-192x192.png" />
    <link rel="icon" type="image/png" sizes="32x32" href="/Favicon/favicon-32x32.png" />
    <link rel="icon" type="image/png" sizes="96x96" href="/Favicon/favicon-96x96.png" />
    <link rel="icon" type="image/png" sizes="16x16" href="/Favicon/favicon-16x16.png" />
    <link rel="manifest" href="/manifest.json" />
    <meta name="msapplication-TileColor" content="#ffffff" />
    <meta name="msapplication-TileImage" content="/ms-icon-144x144.png" />
    <meta name="theme-color" content="#ffffff" />

    <!-- Bootstrap core CSS -->
    <link href="../assets/css/bootstrap.css" rel="stylesheet" />
    <!--external css-->
    <link href="../assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
        
    <!-- Custom styles for this template -->
    <link href="../assets/css/style.css" rel="stylesheet" />
    <link href="../assets/css/style-responsive.css" rel="stylesheet" />
    <link href="../assets/css/custom.css" rel="stylesheet" />

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="login">
	  <div id="login-page">
	  	<div class="container">
		      <form runat="server" id="form_login" class="form-login" >
		        <h2 class="form-login-heading"><img src="/assets/img/login.jpg" class="img-responsive" /><br />
				Ri.-C.O.R.D.A.</h2>
                <div id="div_collaudo" runat="server" visible="false" style="margin-left:50px; margin-right:50px;"><img src="/images/SitoTest.png" class="img-responsive" /></div>
		        <div class="login-wrap" id="div_accesso" runat="server">
                    <div class="alert alert-danger display-hide" id="div_message" runat="server">
                        <button class="close" data-close="alert">
                        </button>
                        <span>
                            <asp:Literal ID="ltl_message_error" runat="server"></asp:Literal>
                        </span>
                    </div>
                    <div class="form-group" id="div_username" runat="server">
                        <asp:TextBox ID="username" name="username" runat="server" autocomplete="off" placeholder="Username"
                            CssClass="form-control placeholder-no-fix"></asp:TextBox>
                        <span for="username" class="help-block" id="span_username" runat="server" visible="false"><asp:Literal ID="ltl_msg_username" runat="server">La username è obbligatoria.</asp:Literal></span>
                    </div>
                    <div class="form-group" id="div_password" runat="server">
                        <asp:TextBox ID="password" name="password" autocomplete="off" placeholder="Password"
                                runat="server" CssClass="form-control placeholder-no-fix" TextMode="Password"></asp:TextBox>
                        <span for="password" class="help-block" id="span_password" runat="server" visible="false"><asp:Literal ID="ltl_msg_password" runat="server">La password è obbligatoria.</asp:Literal></span>
                    </div>
		            <label class="checkbox">
		                <span class="pull-right">
		                    <a data-toggle="modal" href="#myModal"> Recupera password.</a>
		                </span>
		            </label>
                    <asp:LinkButton ID="btnAccedi" runat="server" CssClass="btn btn-theme btn-block">
                        <i class="fa fa-lock"></i>&nbsp;&nbsp;ACCESSO 
                    </asp:LinkButton>
					<br />	
					<p style="text-align: center;"><a href="http://www.ambientesc.it">ambiente s.c.</a><br /> 
					Via Frassina, 21 | 54033 Carrara (MS)<br />
					Tel. 0585 855632 | fax 0585 855617<br />
					P. IVA n°: 00262540453<br />
                    <span style="font-weight:bold; font-size:10px;">
                    Ricorda - Controllo Operativo Rifiuti Digitalmente Assistito</span>
                    </p>
		        </div>
                <div class="login-wrap" id="div_manutenzione" runat="server" visible="false">
					<h4>
                        <p style="text-align: center;">
                        Sistema in manutenzione,<br /> ci scusiamo per il disagio.
                        </p> 
                    </h4>
                    <br />	
					<p style="text-align: center;"><a href="http://www.ambientesc.it">ambiente s.c.</a><br /> 
					Via Frassina, 21 | 54033 Carrara (MS)<br />
					Tel. 0585 855632 | fax 0585 855617<br />
					P. IVA n°: 00262540453<br />
                    <span style="font-weight:bold; font-size:10px;">
                    Ricorda - Controllo Operativo Rifiuti Digitalmente Assistito</span>
                    </p>

                </div> 
		        <!-- Modal -->
		        <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade">
		            <div class="modal-dialog">
		                <div class="modal-content">
		                    <div class="modal-header">
		                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                        <h4 class="modal-title">Password dimenticata ?</h4>
		                    </div>
		                    <div class="modal-body">
		                        <p>Inserisci la tua mail per ricevere la nuova password.</p>
		                        <asp:TextBox ID="txt_e_mail_lost" runat="server" CssClass="form-control placeholder-no-fix"
                                    autocomplete="off" placeholder="Il tuo indirizzo email"></asp:TextBox>
		                    </div>
		                    <div class="modal-footer">
		                        <button data-dismiss="modal" class="btn btn-default" type="button">Esci</button>
                                <asp:LinkButton ID="btnInviaPassword" runat="server" CssClass="btn btn-primary">
                                Invia <i class="m-icon-swapright m-icon-white"></i>
                                </asp:LinkButton>
		                    </div>
		                </div>
		            </div>
		        </div>
		        <!-- modal -->
		      </form>	  	
	  	</div>
	  </div>

    <!-- js placed at the end of the document so the pages load faster -->
    <script src="../assets/js/jquery.js" type="text/javascript"></script>
    <script src="../assets/js/bootstrap.min.js" type="text/javascript"></script>

    <!--BACKSTRETCH-->
    <!-- You can use an image of whatever size. This script will stretch to fit in any screen size.-->
    <script type="text/javascript" src="../assets/js/jquery.backstretch.min.js"></script>
    <script type="text/javascript">
        $.backstretch("../assets/img/login-bg.jpg", { speed: 500 });
    </script>
</body>
<!-- END BODY -->
</html>

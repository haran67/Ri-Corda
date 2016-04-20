<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Start/GisRI.Master"
    CodeBehind="Index.aspx.vb" Inherits="GisRI_Web.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <!-- **********************************************************************************************************************************************************
    MAIN CONTENT
    *********************************************************************************************************************************************************** -->
    <!--main content start-->
    <section id="main-content">
        <section class="wrapper site-min-height">
            <div class="row">
                <div class="col-lg-12 main-chart">
                    <!-- CHIAMATE -->
                    <div class="row">
                        <!-- CHIAMATA 1 -->
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                            <div class="custom-box">
                                <div class="servicetitle">
                                    <h3>
                                        RAFFINERIA FORNOVO DI TARO</h3>
                                    <h4>
                                        TITOLO RIFIUTO / nuova produzione</h4>
                                    <h5>
                                        CER: 050100 / presunto</h5>
                                    <hr>
                                </div>
                                <div class="icn-main-container">
                                    <img src="assets/img/total.jpg">
                                </div>
                                <br />
                                <p>
                                    Data produzione: 10/05/2015</p>
                                <p>
                                    Scrittura sul registro entro il : 09/06/2015</p>
                                <p>
                                    Indirizzo: Via Giuseppe di Vittorio, n.29 43045, Fornovo di Taro (PR)
                                </p>
                                <ul class="pricing">
                                    <li>Stato fisico: Solido pulvirento</li>
                                    <li>Peso: 300 Kg / stimato</li>
                                    <li>Volume: 300 m3 / misurato</li>
                                    <li>Ditta ambientake: MA.SAN. S.r.l.</li>
                                </ul>
                                <p style="text-align:justify;">
                                    Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed ac risus ut enim auctor feugiat. Nulla mattis molestie felis, molestie faucibus mauris imperdiet eu. Sed vulputate in purus quis auctor. Vestibulum suscipit neque justo, ut gravida dui hendrerit molestie. Donec sit amet maximus purus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eleifend rutrum erat in ultrices. Vivamus vestibulum vulputate felis eu pellentesque. Quisque et accumsan quam. Nam convallis, lorem ut rhoncus commodo, velit nisl eleifend lectus, ut commodo nulla arcu a diam. Phasellus laoreet eros quis quam feugiat accumsan. Mauris viverra maximus nisi vitae consectetur..
                                </p>
                                <a class="btn btn-warning" href="#">REGISTRO</a>
                                <a class="btn btn-theme" href="#">SCHEDA</a>
                                <a class="btn btn-success" href="#">SMALTIMENTO</a>
                            </div>
                            <!-- end custombox -->
                        </div>
                        <!-- CHIAMATA 1 END // -->
                        <!-- CHIAMATA 2 -->
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                            <div class="custom-box">
                                <div class="servicetitle">
                                    <h3>
                                        RAFFINERIA FORNOVO DI TARO</h3>
                                    <h4 style="color:Green;">
                                        TITOLO RIFIUTO / in smaltimento</h4>
                                    <h5 style="color:Red;">
                                        CER: 050102 / confermato</h5>
                                    <hr>
                                </div>
                                <div class="icn-main-container">
                                    <img src="assets/img/total.jpg">
                                </div>
                                <br />
                                <p>
                                    Data produzione: 10/05/2015</p>
                                <p>
                                    Prossima scadenza: 09/06/2015</p>
                                <p>
                                    Indirizzo: Via Giuseppe di Vittorio, n.29 43045, Fornovo di Taro (PR)
                                </p>
                                <ul class="pricing">
                                    <li>Stato fisico: Solido pulvirento</li>
                                    <li>Peso: 300 Kg / stimato</li>
                                    <li>Volume: 300 m3 / misurato</li>
                                    <li>Ditta ambientake: MA.SAN. S.r.l.</li>
                                </ul>
                                <p style="text-align:justify;">
                                    Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed ac risus ut enim auctor feugiat. Nulla mattis molestie felis, molestie faucibus mauris imperdiet eu. Sed vulputate in purus quis auctor. Vestibulum suscipit neque justo, ut gravida dui hendrerit molestie. Donec sit amet maximus purus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eleifend rutrum erat in ultrices. Vivamus vestibulum vulputate felis eu pellentesque. Quisque et accumsan quam. Nam convallis, lorem ut rhoncus commodo, velit nisl eleifend lectus, ut commodo nulla arcu a diam. Phasellus laoreet eros quis quam feugiat accumsan. Mauris viverra maximus nisi vitae consectetur..
                                </p>
                                <table class="table table-striped table-advance table-hover">
	                  	  	          <h4><i class="fa fa-angle-right"></i> SMALTIMENTI</h4>
	                  	  	          <hr>
                                      <thead>
                                      <tr>
                                          <th><i class="fa fa-bullhorn"></i> Smaltitore</th>
                                          <th class="hidden-phone"><i class="fa fa-question-circle"></i> Destinazione</th>
                                          <th><i class="fa fa-bookmark"></i> Peso</th>
                                          <th><i class="fa fa-bookmark"></i> Volume</th>
                                          <th><i class=" fa fa-edit"></i> Stato</th>
                                          <th></th>
                                      </tr>
                                      </thead>
                                      <tbody>
                                      <tr>
                                          <td><a href="basic_table.html#">Compagnia Srl</a></td>
                                          <td class="hidden-phone">Carrara via Giraldi 123</td>
                                          <td style="white-space:nowrap;">150.00 Kg </td>
                                          <td style="white-space:nowrap;">200.00 Mq </td>
                                          <td><span class="label label-success label-mini">Smaltito</span></td>
                                          <td>
                                              <button class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></button>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td><a href="basic_table.html#">Compagnia Srl</a></td>
                                          <td class="hidden-phone">Bergamo c/o piazzale Sani</td>
                                          <td>300.00 Kg </td>
                                          <td>200.00 Mq </td>
                                          <td><span class="label label-warning label-mini">Smaltimento</span></td>
                                          <td>
                                              <button class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></button>
                                          </td>
                                      </tr>
                                      </tbody>
                                  </table>
                                <a class="btn btn-warning" href="#">REGISTRO</a>
                                <a class="btn btn-theme" href="#">SCHEDA</a>
                                <a class="btn btn-success" href="#">SMALTIMENTO</a>
                            </div>
                            </div>
                            <!-- end custombox -->
                        </div>
                        <!-- CHIAMATA 2 END // -->
                        <!-- CHIAMATA 1 -->
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                            <div class="custom-box">
                                <div class="servicetitle">
                                    <h3>
                                        RAFFINERIA FORNOVO DI TARO</h3>
                                    <h4>
                                        TITOLO RIFIUTO / nuova produzione</h4>
                                    <h5 style="color:Red;">
                                        CER: 050102 / presunto</h5>
                                    <hr>
                                </div>
                                <div class="icn-main-container">
                                    <img src="assets/img/total.jpg">
                                </div>
                                <br />
                                <p>
                                    Data produzione: 10/05/2015</p>
                                <p style="color:Red;">
                                    Prossima scadenza: 09/06/2015</p>
                                <p>
                                    Indirizzo: Via Giuseppe di Vittorio, n.29 43045, Fornovo di Taro (PR)
                                </p>
                                <ul class="pricing">
                                    <li>Stato fisico: Solido pulvirento</li>
                                    <li>Peso: 300 Kg / stimato</li>
                                    <li>Volume: 300 m3 / misurato</li>
                                    <li>Ditta ambientake: MA.SAN. S.r.l.</li>
                                </ul>
                                <p style="text-align:justify;">
                                    Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed ac risus ut enim auctor feugiat. Nulla mattis molestie felis, molestie faucibus mauris imperdiet eu. Sed vulputate in purus quis auctor. Vestibulum suscipit neque justo, ut gravida dui hendrerit molestie. Donec sit amet maximus purus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eleifend rutrum erat in ultrices. Vivamus vestibulum vulputate felis eu pellentesque. Quisque et accumsan quam. Nam convallis, lorem ut rhoncus commodo, velit nisl eleifend lectus, ut commodo nulla arcu a diam. Phasellus laoreet eros quis quam feugiat accumsan. Mauris viverra maximus nisi vitae consectetur..
                                </p>
                                <a class="btn btn-warning" href="#">REGISTRO</a>
                                <a class="btn btn-theme" href="#">SCHEDA</a>
                                <a class="btn btn-success" href="#">SMALTIMENTO</a>
                            </div>
                            </div>
                            <!-- end custombox -->
                        </div>
                        <!-- CHIAMATA 1 END // -->
                    </div>
                    <!-- /row -->
                </div>
                <!-- /col-lg-9 END SECTION MIDDLE -->
            </div>
        </section>
    </section>

</asp:Content>

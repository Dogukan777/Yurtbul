<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Yurtlar.aspx.cs" Inherits="vtys.Yurtlar" %>

<!DOCTYPE html>
<html lang="zxx">
<head>
    <title>Yurt Bul | Üniversitene en yakın yurtları bul!</title>
    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="shortcut icon" />

    <!-- Google font -->
    <link href="https://fonts.googleapis.com/css?family=Lato:400,400i,700,700i,900%7cRoboto:400,400i,500,500i,700,700i&display=swap" rel="stylesheet">


    <!-- Stylesheets -->
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/font-awesome.min.css" />
    <link rel="stylesheet" href="css/slicknav.min.css" />
    <link rel="stylesheet" href="css/login.css" />
    <link href="main.css" rel="stylesheet" />

    <!-- Main Stylesheets -->
    <link rel="stylesheet" href="css/style.css" />


    <!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->

    <script type="text/javascript">
        // Prevent dropdown menu from closing when click inside the form
        $(document).on("click", ".navbar-right .dropdown-menu", function (e) {
            e.stopPropagation();
        });
        function btn_tikla_Click() {
            document.getElementById("Message").innerHTML = "fdsafdsafsadfsad";
        }
    </script>

</head>
<body>

    <form runat="server">

        <!-- Page Preloder -->
        <div id="preloder">
            <div class="loader"></div>
        </div>

        <!-- Header Section -->
        <nav class="navbar navbar-default navbar-expand-lg navbar-light">
            <div class="navbar-header d-flex col">
                <a class="navbar-brand" href="#">Yurt<b>Bul</b></a>
                <button type="button" data-target="#navbarCollapse" data-toggle="collapse" class="navbar-toggle navbar-toggler ml-auto">
                    <span class="navbar-toggler-icon"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            <!-- Collection of nav links, forms, and other content for toggling -->

            <div id="navbarCollapse" class="collapse navbar-collapse justify-content-start" runat="server">
                <ul class="nav navbar-nav">
                    <li class="nav-item"><a href="Anasayfa.aspx" class="nav-link">Anasayfa</a></li>
                    <li class="nav-item"><a href="Yurtlar.aspx" class="nav-link">Yurtlar</a></li>

                    <li class="nav-item"><a href="contact.html" class="nav-link">İletişim</a></li>
                </ul>

                <ul class="nav navbar-nav navbar-right ml-auto" id="temizle" runat="server">

                    <li class="nav-item">


                        <a data-toggle="dropdown" id="girisYap" class="nav-link dropdown-toggle" runat="server" href="#">Giriş Yapın</a>
                        <ul class="dropdown-menu form-wrapper">
                            <li>
                                <form action="/examples/actions/confirmation.php" method="post">
                                    <p class="hint-text">Sosyal medya hesabınızla giriş yapın</p>
                                    <div class="form-group social-btn clearfix">
                                        <a href="#" class="btn btn-primary pull-left"><i class="fa fa-facebook"></i>Facebook</a>
                                        <a href="#" class="btn btn-info pull-right"><i class="fa fa-twitter"></i>Twitter</a>
                                    </div>
                                    <div class="or-seperator"><b>veya</b></div>
                                    <div class="form-group">

                                        <asp:TextBox ID="txt_KAdi" runat="server" class="form-control" placeholder="Kullanıcı ismi" required="required"></asp:TextBox>
                                    </div>
                                    <div class="form-group">

                                        <asp:TextBox ID="txt_Parola" runat="server" class="form-control" placeholder="Şifre" required="required"></asp:TextBox>
                                    </div>
                                    <asp:Button class="btn btn-primary btn-block" value="Giriş" OnClick="btn_GirisYap_Click" ID="btn_GirisYap" runat="server" Text="Giriş" />
                                    <div class="form-footer">
                                        <a href="#">Şifrenizi mi unuttunuz?</a>
                                    </div>
                                </form>
                            </li>
                        </ul>

                    </li>

                    <li class="nav-item">
                        <a href="signUp.aspx" id="uyeOL" style="float: right;" runat="server" class="nav-link btn btn-primary dropdown-toggle get-started-btn mt-1 mb-1">Üye Ol</a>


                    </li>

                </ul>
                <ul class="nav navbar-nav navbar-right ml-auto" id="getir" style="display: none" runat="server">

                    <li class="nav-item">
                        <asp:Label ID="lbl_loginGiris" runat="server" Text=""></asp:Label>
                    </li>
                    <li class="nav-item">
                        <asp:Button class="btn btn-primary btn-block" value="Çıkış" Text="Çıkış" OnClick="btn_CikisYap_Click" ID="btn_CikisYap" runat="server" />
                    </li>

                </ul>
            </div>

        </nav>
        <!-- Header Section end -->

        <!-- Hero Section end -->
        <section class="hero-section set-bg" data-setbg="img/hero-bg.jpg" style="height: 1000px">
            <div class="container">
                <div class="hero-warp" style="margin-top: -300px">
                    <form class="main-search-form">
                        <div class="search-type">
                            <div class="st-item">
                                <input type="radio" name="st" id="buy" checked>
                                <label for="buy">Şehir</label>
                            </div>
                            <div class="st-item">
                                <input type="radio" name="st" id="rent">
                                <label for="rent">Üniversite</label>
                            </div>
                            <div class="st-item">
                                <input type="radio" name="st" id="sell">
                                <label for="sell">Kampüs</label>
                            </div>
                            <div class="st-item">
                                <input type="radio" name="st" id="property">
                                <label for="property">Özel Yurtlar</label>
                            </div>
                            <div class="st-item">
                                <input type="radio" name="st" id="agents">
                                <label for="agents">Devlet Yurtları</label>
                            </div>
                        </div>
                        <div class="search-input">
                            <input type="text" placeholder="Aramaya hemen başlayın!">
                            <button class="site-btn">Ara </button>

                        </div>

                    </form>
                </div>

            </div>
            <div id="ListeleAlan" runat="server" style="opacity:0.9; width: 80%; float: left; height: 750px; background-color: white; margin-left: 10%">
                <div class="Obje" id="kutu1">

                    <p>Yurt Adı:
                        <asp:Label ID="lbl_YurtAdi1" runat="server"></asp:Label>
                    </p>


                    <p>
                        <asp:Label ID="lbl_YurtCinsiyet1" runat="server"></asp:Label></p>


                    <p>Şehir:
                        <asp:Label ID="lbl_YurtSehir1" runat="server"></asp:Label></p>


                    <p>Toplam Oda:
                        <asp:Label ID="lbl_YurtOdaSayisi1" runat="server"></asp:Label></p>

                    <asp:Button class="nav-link btn btn-primary dropdown-toggle get-started-btn mt-1 mb-1" UseSubmitBehavior="false" OnClick="yurt1_Click" ID="yurt1" Style="float: right;" runat="server" Text="İncele" />


                </div>
                <div class="Obje" id="kutu2">

                    <p>Yurt Adı: 
                        <asp:Label ID="lbl_YurtAdi2" runat="server"></asp:Label></p>


                    <p>
                        <asp:Label ID="lbl_YurtCinsiyet2" runat="server"></asp:Label></p>


                    <p>Şehir:
                        <asp:Label ID="lbl_YurtSehir2" runat="server"></asp:Label></p>


                    <p>Toplam Oda:
                        <asp:Label ID="lbl_YurtOdaSayisi2" runat="server"></asp:Label></p>
                    <asp:Button class="nav-link btn btn-primary dropdown-toggle get-started-btn mt-1 mb-1" UseSubmitBehavior="false" OnClick="yurt2_Click" ID="yurt2" Style="float: right;" runat="server" Text="İncele" />


                </div>
                <div class="Obje" id="kutu3">

                    <p>Yurt Adı: 
                        <asp:Label ID="lbl_YurtAdi3" runat="server"></asp:Label></p>


                    <p>
                        <asp:Label ID="lbl_YurtCinsiyet3" runat="server"></asp:Label></p>


                    <p>Şehir:
                        <asp:Label ID="lbl_YurtSehir3" runat="server"></asp:Label></p>


                    <p>Toplam Oda:
                        <asp:Label ID="lbl_YurtOdaSayisi3" runat="server"></asp:Label></p>
                    <asp:Button class="nav-link btn btn-primary dropdown-toggle get-started-btn mt-1 mb-1" UseSubmitBehavior="false" ID="yurt3" OnClick="yurt3_Click" Style="float: right;" runat="server" Text="İncele" />


                </div>
                <div class="Obje" id="kutu4">

                    <p>Yurt Adı: 
                        <asp:Label ID="lbl_YurtAdi4" runat="server"></asp:Label></p>


                    <p>
                        <asp:Label ID="lbl_YurtCinsiyet4" runat="server"></asp:Label></p>


                    <p>Şehir:
                        <asp:Label ID="lbl_YurtSehir4" runat="server"></asp:Label></p>


                    <p>Toplam Oda:
                        <asp:Label ID="lbl_YurtOdaSayisi4" runat="server"></asp:Label></p>
                    <asp:Button class="nav-link btn btn-primary dropdown-toggle get-started-btn mt-1 mb-1" UseSubmitBehavior="false" ID="yurt4" OnClick="yurt4_Click" Style="float: right;" runat="server" Text="İncele" />


                </div>
                <div class="Obje" id="kutu5">

                    <p>Yurt Adı: 
                        <asp:Label ID="lbl_YurtAdi5" runat="server"></asp:Label></p>


                    <p>
                        <asp:Label ID="lbl_YurtCinsiyet5" runat="server"></asp:Label></p>


                    <p>Şehir:
                        <asp:Label ID="lbl_YurtSehir5" runat="server"></asp:Label></p>


                    <p>Toplam Oda:
                        <asp:Label ID="lbl_YurtOdaSayisi5" runat="server"></asp:Label></p>
                    <asp:Button class="nav-link btn btn-primary dropdown-toggle get-started-btn mt-1 mb-1" ID="yurt5" UseSubmitBehavior="false" OnClick="yurt5_Click" Style="float: right;" runat="server" Text="İncele" />


                </div>
                <div class="Obje" id="kutu6">

                    <p>Yurt Adı: 
                        <asp:Label ID="lbl_YurtAdi6" runat="server"></asp:Label></p>


                    <p>
                        <asp:Label ID="lbl_YurtCinsiyet6" runat="server"></asp:Label></p>


                    <p>Şehir:
                        <asp:Label ID="lbl_YurtSehir6" runat="server"></asp:Label></p>


                    <p>Toplam Oda:
                        <asp:Label ID="lbl_YurtOdaSayisi6" runat="server"></asp:Label></p>
                    <asp:Button class="nav-link btn btn-primary dropdown-toggle get-started-btn mt-1 mb-1" ID="yurt6" UseSubmitBehavior="false" OnClick="yurt6_Click" Style="float: right;" runat="server" Text="İncele" />


                </div>


            </div>
            <div id="YurtListeleAlan" runat="server" style="float: left;opacity:0.9; width: 80%; height: 750px; background-color: white; margin-left: 10%; padding: 2%;display:none">

                <div id="YurtListeleSol" style="border: 1px solid black; float: left; width: 35%; height: 630px; padding: 2%; background-color: white; margin-left: 3%; border-radius: 3px">
                    <div id="yurtBilgileri">
                        <span class="text">Yurt İsmi:
                            <asp:Label class="text2" ID="lbl_dormName" runat="server" Text="Label"></asp:Label></span><br />
                        <br />
                        <span class="text2">
                            <asp:Label class="text" ID="lbl_dormGender" runat="server" Text="Label"></asp:Label>
                            Yurdu</span><br />
                        <br />
                        <span class="text">Şehir:
                            <asp:Label class="text2" ID="lbl_cityName" runat="server" Text="Label"></asp:Label></span><br />
                        <br />
                        <span class="text">Yurt Adresi:<asp:Label class="text2" ID="lbl_dormAddress" runat="server" Text="Label"></asp:Label></span><br />
                        <br />
                        <span class="text">Yurt Telefon Numarası:<asp:Label class="text2" ID="lbl_dormPhone" runat="server" Text="Label"></asp:Label></span><br />
                        <br />
                        <span class="text">Yurt EmailAdresi:
                            <asp:Label class="text2" ID="lbl_dormEmailAddress" runat="server" Text="Label"></asp:Label></span><br />
                        <br />
                         <span class="text">Toplam Oda Sayısı:
                            <asp:Label class="text2" ID="lbl_roomCount" runat="server" Text="Label"></asp:Label></span><br />
                        <br />
                    </div>

                </div>

                <div id="YurtListeleSag" style="border: 1px solid black; float: left;padding:2%; width: 55%; height: 630px; background-color: white; margin-left: 5%; border-radius: 3px">
                    <div id="yurtTablolari">
                        <span class="text">ORTAK ALANLAR</span>
                        <table cellpadding="15" cellspacing="25" border="2">
                        <tr>
                            <th>Spor Salonu</th>
                            <th>Fitness Salonu</th>
                            <th>Havuz</th>
                            <th>Müzik Odası</th>

                        </tr>
                           
                        <tr>
                            <td><asp:Label class="text3" ID="lbl_sportsArea" runat="server" Text="Label"></asp:Label></td>
                            <td><asp:Label class="text3" ID="lbl_gym" runat="server" Text="Label"></asp:Label></td>
                            <td><asp:Label class="text3" ID="lbl_pool" runat="server" Text="Label"></asp:Label></td>
                             <td><asp:Label class="text3" ID="lbl_musicRoom" runat="server" Text="Label"></asp:Label></td>
                        </tr>
                       
                        </table>
                        <br />
                        <!-------------------------------------------------------------------------------------->
                         <span class="text">HİZMETLER</span>
                        <table cellpadding="15" cellspacing="25" border="2">
                        <tr>
                            <th>Oda Temizliği(Haftada)</th>
                            <th>Çamaşırhane</th>
                            <th>Akşam Yemeği(Her Gün)</th>
                            <th>Kahvaltı(Her Gün)</th>

                        </tr>
                           
                        <tr>
                            <td><asp:Label class="text3" ID="lbl_roomCleaningdayWeekly" runat="server" Text="Label"></asp:Label></td>
                            <td><asp:Label class="text3" ID="lbl_laundryRoom" runat="server" Text="Label"></asp:Label></td>
                            <td><asp:Label class="text3" ID="lbl_eveningDinner" runat="server" Text="Label"></asp:Label></td>
                             <td><asp:Label class="text3" ID="lbl_breakfast" runat="server" Text="Label"></asp:Label></td>
                        </tr>
                       
                        </table>
                        <br />
                        <!--------------------------------------------------------------------------------------->
                         <span class="text">Fiyatlar(Yıllık)</span>
                        
                        <table cellpadding="15" cellspacing="25" border="2">
                        <tr>
                            <th>Tek Kişilik Odalar</th>
                            <th>İki Kişilik Odalar</th>
                            <th>Üç Kişilik Odalar</th>
                            <th>Dört Kişilik Odalar</th>

                        </tr>
                           
                        <tr>
                            <td><asp:Label class="text3" ID="lbl_onePersonRoomCharge" runat="server" Text="Label"></asp:Label></td>
                            <td><asp:Label class="text3" ID="lbl_twoPersonRoomCharge" runat="server" Text="Label"></asp:Label></td>
                            <td><asp:Label class="text3" ID="lbl_threePersonRoomCharge" runat="server" Text="Label"></asp:Label></td>
                             <td><asp:Label class="text3" ID="lbl_fourPersonRoomCharge" runat="server" Text="Label"></asp:Label></td>
                        </tr>
                       
                        </table>

                    </div>
                </div>
            </div>
        </section>





        <!-- Footer Section -->
        <footer class="footer-section">
            <div class="container">
                <div class="row text-white">
                    <div class="col-lg-4">
                        <div class="footer-widger">
                            <div class="about-widget">
                                <div class="aw-text">
                                    <img src="img/footer-logo.png" alt="">
                                    <p>Tamamiyle öğrenci yapımı bir web sitesiyiz. Her zaman bizimle çalışabilecek yenilikçi ve ekip ruhuna sahip takım arkadaşları arıyoruz. </p>
                                    <a href="#" class="site-btn">Hemen Başvur!</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-3 col-sm-6">
                        <div class="footer-widger">
                            <h2>Şirketimiz</h2>
                            <ul>
                                <li><a href="#">Hakkımızda</a></li>
                                <li><a href="#">Hizmetlerimiz</a></li>
                                <li><a href="#">Projelerimiz</a></li>

                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-3 col-sm-6">
                        <div class="footer-widger">
                            <h2>Yurt arayanlar için</h2>
                            <ul>
                                <li><a href="#">Bize başvurun</a></li>
                                <li><a href="#">Gereken evraklar</a></li>
                                <li><a href="#">Yurtlar</a></li>

                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-3 col-sm-6">
                        <div class="footer-widger">
                            <h2>Yurt sahipleri için</h2>
                            <ul>
                                <li><a href="#">Bize başvurun</a></li>
                                <li><a href="#">Yurdunuzu öne çıkaralım!</a></li>

                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-3 col-sm-6">
                        <div class="footer-widger">
                            <h2></h2>
                            <ul>
                            </ul>
                        </div>
                    </div>
                </div>

            </div>
        </footer>
        <!-- Footer Section end -->

        <!--====== Javascripts & Jquery ======-->
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.slicknav.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/main.js"></script>
        <script src="js/login.js"></script>

    </form>
</body>
</html>

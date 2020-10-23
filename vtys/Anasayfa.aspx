<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Anasayfa.aspx.cs" Inherits="vtys.Anasayfa" %>

<!DOCTYPE html>
<html lang="zxx">
<head>
	<title>Yurt Bul | Üniversitene en yakın yurtları bul!</title>
	<meta charset="UTF-8">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<!-- Favicon -->
	<link href="img/favicon.ico" rel="shortcut icon"/>

	<!-- Google font -->
	<link href="https://fonts.googleapis.com/css?family=Lato:400,400i,700,700i,900%7cRoboto:400,400i,500,500i,700,700i&display=swap" rel="stylesheet">

 
	<!-- Stylesheets -->
	<link rel="stylesheet" href="css/bootstrap.min.css"/>
	<link rel="stylesheet" href="css/font-awesome.min.css"/>
	<link rel="stylesheet" href="css/slicknav.min.css"/>
	<link rel="stylesheet" href="css/login.css"/>
	

	<!-- Main Stylesheets -->
	<link rel="stylesheet" href="css/style.css"/>


	<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->

	<script type="text/javascript">
	// Prevent dropdown menu from closing when click inside the form
	$(document).on("click", ".navbar-right .dropdown-menu", function(e){
		e.stopPropagation();
	});
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
								<a href="#" class="btn btn-primary pull-left"><i class="fa fa-facebook"></i> Facebook</a>
								<a href="#" class="btn btn-info pull-right"><i class="fa fa-twitter"></i> Twitter</a>
							</div>
							<div class="or-seperator"><b>veya</b></div>
							<div class="form-group">
							
                                <asp:TextBox ID="txt_KAdi" runat="server" class="form-control" placeholder="Kullanıcı ismi" required="required"></asp:TextBox>
							</div>
							<div class="form-group">
								
                                <asp:TextBox ID="txt_Parola" runat="server" class="form-control" placeholder="Şifre" required="required"></asp:TextBox>
							</div>
                            <asp:Button  class="btn btn-primary btn-block" value="Giriş"  OnClick="btn_GirisYap_Click" ID="btn_GirisYap" runat="server" Text="Giriş" />
							<div class="form-footer"> 
								<a href="#">Şifrenizi mi unuttunuz?</a>
							</div>
						</form>
					</li>
				</ul>
                     
			</li>
          
			<li class="nav-item">
				<a href="signUp.aspx" id="uyeOL" style="float:right;" runat="server" class="nav-link btn btn-primary dropdown-toggle get-started-btn mt-1 mb-1">Üye Ol</a>
				
			</li>
          
		</ul>
        <ul class="nav navbar-nav navbar-right ml-auto" id="getir" style="display:none" runat="server">
            
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
	<section class="hero-section set-bg" data-setbg="img/hero-bg.jpg">
		<div class="container">
			<div class="hero-warp">
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
						<button class="site-btn">Ara</button>
					</div>
					
				</form>
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

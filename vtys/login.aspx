<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="vtys.isLogin" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>Yurt Bul | Üye Ol!</title>

	<meta charset="UTF-8">

	<meta name="viewport" content="width=device-width, initial-scale=1">

	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>

	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">

	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">

	<link rel="stylesheet" type="text/css" href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css">

	<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">

	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">

	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">

	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">

	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
	
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">

	<link rel="stylesheet" type="text/css" href="css/util.css">

	<link rel="stylesheet" type="text/css" href="css/main.css">

	<meta name="viewport" content="width=device-width, initial-scale=1.0">	

	<link href="img/favicon.ico" rel="shortcut icon"/>

	<link href="https://fonts.googleapis.com/css?family=Lato:400,400i,700,700i,900%7cRoboto:400,400i,500,500i,700,700i&display=swap" rel="stylesheet"> 

	<link rel="stylesheet" href="css/bootstrap.min.css"/>

	<link rel="stylesheet" href="css/font-awesome.min.css"/>

	<link rel="stylesheet" href="css/slicknav.min.css"/>

	<link rel="stylesheet" href="css/login.css"/>
	
	<link rel="stylesheet" href="css/style.css"/>

	<link rel="stylesheet" type="text/css" href="css/util-singup.css">

	<link rel="stylesheet" type="text/css" href="css/main-singup.css">
</head>
<body style="background-color: #999999;">

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
	<div id="navbarCollapse" class="collapse navbar-collapse justify-content-start">
		<ul class="nav navbar-nav">
			<li class="nav-item"><a href="index.html" class="nav-link">Anasayfa</a></li>			
			<li class="nav-item"><a href="contact.html" class="nav-link">İletişim</a></li>
		</ul>		
		
	</div>
</nav>
	
	<div class="limiter">
		<div class="container-login100">
			<div class="login100-more" style="background-image: url('img/hero-bg.jpg');"></div>

			<div class="wrap-login100 p-l-50 p-r-50 p-t-72 p-b-50">
				<form class="login100-form validate-form">
					<span class="login100-form-title p-b-59">
						Üye Ol
					</span>

					<div class="wrap-input100 validate-input" data-validate="İsim zorunludur">
						<span class="label-input100">İsim Soyisim</span>
						<input class="input100" type="text" name="name" placeholder="İsim...">
						<span class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate = "Geçerli bir mail adresi giriniz: ex@abc.xyz">
						<span class="label-input100">Mail</span>
						<input class="input100" type="text" name="email" placeholder="Mail Adresiniz...">
						<span class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Kullanıcı ismi zorunludur">
						<span class="label-input100">Kullanıcı İsmi</span>
						<input class="input100" type="text" name="username" placeholder="Kullanıcı İsminiz...">
						<span class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input" >
						<span class="label-input100">Cinsiyet</span> <br>
						<form>
							  <input type="radio" name="gender"  value="male" checked> Male<br>
							  <input type="radio" name="gender" value="female"> Female<br>
							  <input type="radio" name="gender" value="other"> Other
							</form>
					</div>

	

					<div class="wrap-input100 input100-select">
					<span class="label-input100">Şehir Seçiniz</span>
					<div>
						<select class="selection-2" name="service">
							<option></option>
							<option></option>
							<option></option>
							<option></option>
							<option></option>
						</select>
					</div>
					<span class="focus-input100"></span>
				</div>

				<div class="wrap-input100 input100-select">
					<span class="label-input100">Üniversite Seçiniz</span>
					<div>
						<select class="selection-2" name="service">
							<option></option>
							<option></option>
							<option></option>
							<option></option>
							<option></option>
						</select>
					</div>
					<span class="focus-input100"></span>
				</div>

				<div class="wrap-input100 input100-select">
					<span class="label-input100">Kampüs Seçiniz</span>
					<div>
						<select class="selection-2" name="service">
							<option></option>
							<option></option>
							<option></option>
							<option></option>
							<option></option>
						</select>
					</div>
					<span class="focus-input100"></span>
				</div>

					<div class="wrap-input100 validate-input" data-validate ="Şifre zorunludur">
						<span class="label-input100">Şifre</span>
						<input class="input100" type="text" name="pass" placeholder="*************">
						<span class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate = "Bu alan zorunludur">
						<span class="label-input100">Şifreyi tekrar giriniz</span>
						<input class="input100" type="text" name="repeat-pass" placeholder="*************">
						<span class="focus-input100"></span>
					</div>

					<div class="flex-m w-full p-b-33">
						<div class="contact100-form-checkbox">
							<input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me">
							<label class="label-checkbox100" for="ckb1">
								<span class="txt1">
									
									<a href="#" class="txt2 hov1">
										Üyelik şartlarını
									</a>
									kabul ediyorum.
								</span>
							</label>
						</div>

						
					</div>

					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn">
								Üye Ol
							</button>
						</div>

						
					</div>
				</form>
			</div>
		</div>
	</div>
	

	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>

	<script src="vendor/animsition/js/animsition.min.js"></script>

	<script src="vendor/bootstrap/js/popper.js"></script>

	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>

	<script src="vendor/select2/select2.min.js"></script>

	<script src="vendor/daterangepicker/moment.min.js"></script>

	<script src="vendor/daterangepicker/daterangepicker.js"></script>

	<script src="vendor/countdowntime/countdowntime.js"></script>	

	<script src="js/jquery-3.2.1.min.js"></script>

	<script src="js/bootstrap.min.js"></script>

	<script src="js/jquery.slicknav.min.js"></script>

	<script src="js/jquery.magnific-popup.min.js"></script>

	<script src="js/main.js"></script>

	<script src="js/main-singup.js"></script>

</body>
</html>
<%@page import="model.Korisnik"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Kupujem prodajem - Login</title>
<link rel="icon" href="img/Fevicon.png" type="image/png">
<link rel="stylesheet" href="vendors/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="vendors/fontawesome/css/all.min.css">
<link rel="stylesheet" href="vendors/themify-icons/themify-icons.css">
<link rel="stylesheet" href="vendors/linericon/style.css">
<link rel="stylesheet"
	href="vendors/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css">
<link rel="stylesheet" href="vendors/nice-select/nice-select.css">
<link rel="stylesheet" href="vendors/nouislider/nouislider.min.css">

<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<!--================ Start Header Menu Area =================-->
	<header class="header_area">
		<div class="main_menu">
			<nav class="navbar navbar-expand-lg navbar-light">
				<div class="container">
					<a class="navbar-brand logo_h" href="index.jsp"><img
						src="images/kupujemprodajem.png" alt="" width="250px"
						height="100px"></a>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<div class="collapse navbar-collapse offset"
						id="navbarSupportedContent">
						<ul class="nav navbar-nav menu_nav ml-auto mr-auto">
							<li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
							
								<ul class="dropdown-menu">
									<li class="nav-item"><a class="nav-link"
										href="category.html">Shop Category</a></li>
									<li class="nav-item"><a class="nav-link"
										href="single-product.html">Blog Details</a></li>
									<li class="nav-item"><a class="nav-link"
										href="checkout.html">Product Checkout</a></li>
									<li class="nav-item"><a class="nav-link"
										href="confirmation.html">Confirmation</a></li>
									<li class="nav-item"><a class="nav-link" href="cart.html">Shopping
											Cart</a></li>
								</ul></li>
							
								
							
								<ul class="dropdown-menu">
									<li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
									<li class="nav-item"><a class="nav-link"
										href="register.html">Register</a></li>
									<li class="nav-item"><a class="nav-link"
										href="tracking-order.html">Tracking</a></li>
								</ul></li>
					
						</ul>

						<ul class="nav-shop">
							
						
							<li class="nav-item" hidden=""><a class="button button-header"
								href="#"></a></li>
						</ul>
					</div>
				</div>
			</nav>
		</div>
	</header>
	<!--================ End Header Menu Area =================-->

	<!-- ================ start banner area ================= -->

	<!-- ================ end banner area ================= -->

	<!--================Login Box Area =================-->
	<section class="login_box_area section-margin">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					  <div class="login_form_inner"">
						<h3>Registration</h3>
						<div class="hover">
							<%
							Korisnik korisnik = (Korisnik) request.getAttribute("data");
							%>
						<form class="row login_form" action="KorisnikKontroler"
								id="contactForm" method="post">
								<div class="col-md-12 form-group">
									<input type="text" class="form-control" name="ime"
										placeholder="Ime" onfocus="this.placeholder = ''"
										onblur="this.placeholder = 'First name'"
										value="<%=(korisnik != null) ? korisnik.getIme() : ""%>">
								</div>
								<div class="col-md-12 form-group">
									<input type="text" class="form-control" name="prezime"
										placeholder="Prezime" onfocus="this.placeholder = ''"
										onblur="this.placeholder = 'prezime'"
										value="<%=(korisnik != null) ? korisnik.getPrezime() : ""%>">
								</div>


								
								<div class="col-md-12 form-group">
									<input type="text" class="form-control" name="username"
										placeholder="Username" onfocus="this.placeholder = ''"
										onblur="this.placeholder = 'Username'"
										value="<%=(korisnik != null) ? korisnik.getUsername() : ""%>">
								</div>
								<div class="col-md-12 form-group">
									<input type="text" class="form-control" name="password"
										placeholder="Password" onfocus="this.placeholder = ''"
										onblur="this.placeholder = 'Password'"
										value="<%=(korisnik != null) ? korisnik.getPassword() : ""%>">
								</div>


								<div class="col-md-12 form-group">
									<button type="submit" name="action" value="Register"
										class="button button-login w-100">Register</button>
								</div>
								<%
								String poruka = (String) request.getAttribute("porukaRegistracija");
								if (poruka != null) {
									out.println("<p style='color: red'>" + poruka + "</p>");
								}
								%>
							</form>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="login_form_inner">
						<h3>Log in </h3>
						<form class="row login_form" action="KorisnikKontroler"
							id="contactForm" method="post">
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" name="username"
									placeholder="Username" onfocus="this.placeholder = ''"
									onblur="this.placeholder = 'Username'">
							</div>
							<div class="col-md-12 form-group">
								<input type="password" class="form-control" name="password"
									placeholder="Password" onfocus="this.placeholder = ''"
									onblur="this.placeholder = 'Password'">
							</div>

							<div class="col-md-12 form-group">
								<button type="submit" name="action" value="logIn"
									class="button button-login w-100">Log In</button>
							</div>
							<%
								String porukaLogin = (String) request.getAttribute("porukaLogin");
								if (porukaLogin != null) {
									out.println("<p style='color: red'>" + porukaLogin + "</p>");
								}
								%>
						</form>
					</div>
				</div>
				
			</div>
		</div>
	</section>
	<!--================End Login Box Area =================-->



	<!--================ Start footer Area  =================-->
	<footer>
		<div class="footer-area footer-only">
			<div class="container">
				<div class="row section_gap">
					<div class="col-lg-3 col-md-6 col-sm-6">
						<div class="single-footer-widget tp_widgets ">
							<h4 class="footer_title large_title">Kupujem prodajem</h4>
							<p>KupujemProdajem.com © 2022 by Quable B.V. The Netherlands.
								All rights reserved.</p>
						</div>
					</div>

					<div class="offset-lg-1 col-lg-3 col-md-6 col-sm-6">
						<div class="single-footer-widget tp_widgets">
							<h4 class="footer_title">Contact Us</h4>
							<div class="ml-40">
								<p class="sm-head">
									<span class="fa fa-location-arrow"></span> Head Office
								</p>
								<p>123, Main Street, Your City</p>

								<p class="sm-head">
									<span class="fa fa-phone"></span> Phone Number
								</p>
								<p>
									+123 456 7890 <br> +123 456 7890
								</p>

								<p class="sm-head">
									<span class="fa fa-envelope"></span> Email
								</p>
								<p>
									free@infoexample.com <br> www.infoexample.com
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="footer-bottom">
			<div class="container">
				<div class="row d-flex">
					<p class="col-lg-12 footer-text text-center">
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script>
							document.write(new Date().getFullYear());
						</script>
						All rights reserved | This template is made with <i
							class="fa fa-heart" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>
			</div>
		</div>
	</footer>
	<!--================ End footer Area  =================-->



	<script src="vendors/jquery/jquery-3.2.1.min.js"></script>
	<script src="vendors/bootstrap/bootstrap.bundle.min.js"></script>
	<script src="vendors/skrollr.min.js"></script>
	<script src="vendors/owl-carousel/owl.carousel.min.js"></script>
	<script src="vendors/nice-select/jquery.nice-select.min.js"></script>
	<script src="vendors/jquery.ajaxchimp.min.js"></script>
	<script src="vendors/mail-script.js"></script>
	<script src="js/main.js"></script>
</body>
</html>
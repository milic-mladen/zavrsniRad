<%@page import="model.Grad"%>
<%@page import="model.ArtikalHelper"%>
<%@page import="db.DAO"%>
<%@page import="model.Artikal"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Korisnik"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%
HttpSession sesijaKorisnik = request.getSession();

Korisnik ulogovaniKorisnik = (Korisnik) sesijaKorisnik.getAttribute("logged in");

DAO dao = new DAO();

ArrayList<ArtikalHelper> listaArtikla = (ArrayList<ArtikalHelper>) request.getAttribute("filtriraniArtikli");//pretraga
if (listaArtikla == null) {
	listaArtikla = (ArrayList<ArtikalHelper>) request.getAttribute("artikliFilterKategorija");//filter po kategoriji
}
if (listaArtikla == null) {
	listaArtikla = (ArrayList<ArtikalHelper>) request.getAttribute("artikliFilterBoja");//filter po boji
}
if (listaArtikla == null) {
	listaArtikla = (ArrayList<ArtikalHelper>) request.getAttribute("artikliFilterCena");//filter po boji
}
if (listaArtikla == null) {
	listaArtikla = (ArrayList<ArtikalHelper>) request.getAttribute("artikliFilterGrad");//filter po boji
}
String kategorija = (String) request.getAttribute("kategorija");
String boja = (String) request.getAttribute("boja");
String cenaOd = (String) request.getAttribute("cenaOd");
String cenaDo = (String) request.getAttribute("cenaDo");
String grad = (String) request.getAttribute("grad");
ArrayList<Grad> listaGradova = dao.vratiSveGradove();

if (listaArtikla == null) {
	listaArtikla = dao.getSviArtikli();
	System.out.println(listaArtikla);
}

if (listaArtikla != null) {
%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Kupujem prodajem</title>
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



						</ul>

						<ul class="nav-shop">
						<%
							if (ulogovaniKorisnik != null) {
							%>
							<li class="nav-item"><a class="button button-header"
								href="KorisnikKontroler?action=dodajArtikal">Dodaj artikal</a></li>
								<%}%>
							<%
							if (ulogovaniKorisnik != null) {
							%><li class="nav-item">
								<h4>
									Ulogovan: <span style="color: blue; font-size: 22px;"><%=ulogovaniKorisnik.getIme() + " " + ulogovaniKorisnik.getPrezime()%></span></span>
								</h4>
							</li>
							<%
							}
							%>

							<%
							if (ulogovaniKorisnik != null) {
							%>
					
							<li class="nav-item"><a class="button button-header"
								href="KorisnikKontroler?action=logOut">Log out</a></li>
							<%
							} else {
							%>

							<li class="nav-item"><a class="button button-header"
								href="login.jsp">Log in</a></li>
							<%
							}
							%>
							
						</ul>
					</div>
				</div>
			</nav>
		</div>
	</header>
	<!--================ End Header Menu Area =================-->

	<!-- ================ start banner area ================= -->

	<!-- ================ end banner area ================= -->


	<!-- ================ category section start ================= -->
	<section class="section-margin--small mb-5">
		<div class="container">
			<div class="row">
				<div class="col-xl-3 col-lg-4 col-md-5">
					<div class="sidebar-categories">
						<div class="head">Kategorije</div>
						<ul class="main-categories">
							<li class="common-filter">
								<form action="ArtikalKontroler" method="post">
									<ul>
										<li class="filter-list"><input class="pixel-radio"
											type="radio"
											<%if (kategorija != null && kategorija == "Mobilni telefon") {%>
											checked="checked" <%}%> id="men" name="brand"
											value="Mobilni telefon"><label for="men">Mobilni
												telefon </label></li>
										<li class="filter-list"><input class="pixel-radio"
											type="radio"
											<%if (kategorija != null && kategorija == "Tablet") {%>
											checked="checked" <%}%> id="women" name="brand"
											value="Tablet"><label for="women">Tablet</label></li>
										<li class="filter-list"><input class="pixel-radio"
											type="radio"
											<%if (kategorija != null && kategorija == "Laptop") {%>
											checked="checked" <%}%> id="accessories" name="brand"
											value="Laptop"><label for="accessories">Laptop</label></li>
										<button class="button button-login w-10" type="submit">Primeni</button>
									</ul>
								</form>
							</li>
						</ul>
					</div>
					<div class="sidebar-filter">
						<div class="top-filter-head">Filter Proizvoda</div>

						<div class="common-filter">
							<div class="head">Color</div>
							<form action="ArtikalKontroler" method="post">
								<ul>
									<li class="filter-list"><input class="pixel-radio"
										type="radio" <%if (boja != null && boja == "Crna") {%>
										checked="checked" <%}%> id="black" name="color" value="Crna"><label
										for="black">Crna</label></li>
									<li class="filter-list"><input class="pixel-radio"
										type="radio" <%if (boja != null && boja == "Siva") {%>
										checked="checked" <%}%> id="balckleather" name="color"
										value="Siva"><label for="balckleather">Siva</label></li>
									<li class="filter-list"><input class="pixel-radio"
										type="radio" <%if (boja != null && boja == "Plava") {%>
										checked="checked" <%}%> id="blackred" name="color"
										value="Plava"><label for="blackred">Plava </label></li>
									<li class="filter-list"><input class="pixel-radio"
										type="radio" <%if (boja != null && boja == "Crvena") {%>
										checked="checked" <%}%> id="gold" name="color" value="Crvena"><label
										for="gold">Crvena</label></li>
									<li class="filter-list"><input class="pixel-radio"
										type="radio" <%if (boja != null && boja == "Srebrna") {%>
										checked="checked" <%}%> id="spacegrey" name="color"
										value="Srebrna"><label for="spacegrey">Srebrna</label></li>
									<li class="filter-list"><input class="pixel-radio"
										type="radio" <%if (boja != null && boja == "Bela") {%>
										checked="checked" <%}%> id="spacegrey" name="color"
										value="Bela"><label for="white">Bela</label></li>
								</ul>
								<button class="button button-login w-20"
									style="margin-left: 30px; margin-top: 20px;" type="submit">Primeni</button>
							</form>
						</div>

						<!--  			<div class="common-filter">
							<div class="head">Cena</div>
							<div class="price-range-area">
								<form action="ArtikalKontroler"  method="post">
								<div id="price-range"></div>
								<div class="value-wrapper d-flex">
									<div class="price">Cena:</div>

									<div id="lower-value"></div>
									<span> din </span>
									<div class="to">do</div>
									<div id="upper-value"></div>
									<span> din </span>
								</div>
							</div>
						</div>-->
						<div class="common-filter">

							<div class="head">Cena</div>

							<div class="form-group" style="width: 70%; margin-left: 30px;">
								<form action="ArtikalKontroler" method="post">
									<input class="input-group" style="border-radius: 5px;"
										name="cenaOd" type="text" placeholder="Cena od"
										<%if (cenaOd != null) {%> value="<%=cenaOd%>" <%}%>> <input
										class="input-group"
										style="border-radius: 5px; margin-top: 10px" name="cenaDo"
										type="text" placeholder="Cena do" <%if (cenaDo != null) {%>
										value="<%=cenaDo%>" <%}%>>


									<button class="button button-login w-20"
										style="margin-left: 5px; margin-top: 15px;"submit">Primeni</button>
								</form>
							</div>



						</div>
						</form>
					</div>
				</div>
				<div class="col-xl-9 col-lg-8 col-md-7">
					<!-- Start Filter Bar -->
					<div class="filter-bar d-flex flex-wrap align-items-center">
						<div class="sorting">
							<form action="ArtikalKontroler" method="get">
								<select name="gradovi">
									<option disabled="" selected="">Gradovi</option>
									<%
									if (listaGradova != null) {
										for (int i = 0; i < listaGradova.size(); i++) {
									%>
									<option
										<%if (grad != null && grad.equals(listaGradova.get(i).getIme())) {%>
										selected="" <%}%> value="<%=listaGradova.get(i).getIme()%>"><%=listaGradova.get(i).getIme()%></option>
									<%
									}
									}
									%>
								</select>
								
						</div><button type="submit" name="akcija" value="filterGradova"
									class="button button-login w-10" style="height:35px;margin-top:11px; padding:7px 26px;">Primeni</button>
							</form>
						<%-- 						<a href="ArtikalKontroler?akcija=prikaziGrad&grad_ime=<%=listaGradova.get(i).getIme() %>">Link</a> --%>
						<div>
							<form action="ArtikalKontroler" method="post">
								<div class="input-group filter-bar-search"
									style="margin-left: 323px;">
									<input type="text" name="imeArtikla" style="padding-left: 7px;"
										placeholder="Search">
									<div class="input-group-append">
										<button type="submit" name="akcija"  value="pretragaProizvoda">
											<i class="ti-search"></i>
										</button>
									</div>
								</div>
							</form>
						</div>
					</div>
					<!-- End Filter Bar -->
					<!-- Start Best Seller -->
					<section class="lattest-product-area pb-40 category-list">
						<div class="row">
							<!-- ovde idu artikli -->
							<%
							for (int i = 0; i < listaArtikla.size(); i++) {
							%>
							<div class="col-md-6 col-lg-4">
								<div class="card text-center card-product">
									<div class="card-product__img">
										<img class="card-img"
											src="images/<%=listaArtikla.get(i).getSlika()%>" alt="">
										<ul class="card-product__imgOverlay">
											<li><button>
													<i class="ti-search"></i>
												</button></li>
											<li><button>
													<i class="ti-shopping-cart"></i>
												</button></li>
											<li><button>
													<i class="ti-heart"></i>
												</button></li>
										</ul>
									</div>
									<div class="card-body">

										<p><%=listaArtikla.get(i).getKategorija()%></p>
										<h4 class="card-product__title">
											<a href="ArtikalKontroler?akcija=prikaziArtikal&artikal_id=<%=listaArtikla.get(i).getId() %>"><%=listaArtikla.get(i).getIme()%></a>
										</h4>
										<p class="card-product__price"><%=listaArtikla.get(i).getCena()%>
											din
										</p>
									</div>
								</div>
							</div>
							<%
							}
							%>

						</div>
					</section>
					<!-- End Best Seller -->
				</div>
			</div>
		</div>
	</section>
	<!-- ================ category section end ================= -->

	<!-- ================ top product area start ================= -->

	<!-- ================ top product area end ================= -->

	<!-- ================ Subscribe section start ================= -->

	<!-- ================ Subscribe section end ================= -->


	<!--================ Start footer Area  =================-->
	<footer>
		<div class="footer-area">
			<div class="container">
				<div class="row section_gap">
					<div class="col-lg-12 col-md-12 col-sm-12">
						<div class="single-footer-widget tp_widgets">
							<h4 class="footer_title large_title">Kupujem prodajem</h4>
							<p>KupujemProdajem.com © 2022 by Quable B.V. The Netherlands.
								All rights reserved.</p>

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
	<script src="vendors/nouislider/nouislider.min.js"></script>
	<script src="vendors/jquery.ajaxchimp.min.js"></script>
	<script src="vendors/mail-script.js"></script>
	<script src="js/main.js"></script>
</body>
</html>
<%
}
%>
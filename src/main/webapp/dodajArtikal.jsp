<%@page import="model.Kategorija"%>
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
String kategorija = (String) request.getAttribute("kategorija");
String boja = (String) request.getAttribute("boja");
String grad = (String) request.getAttribute("grad");
ArrayList<Grad> listaGradova = dao.vratiSveGradove();
ArrayList<Kategorija> listaKategorija = dao.vratiSveKategorije();
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
<style type="text/css">
.nice-select {
	float: inherit;
}
</style>
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
							<%
							}
							%>
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
	<section class="login_box_area section-margin">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="login_form_inner"">
						<h3>Dodaj artikal</h3>
						<%
						ArtikalHelper artikal = (ArtikalHelper) request.getAttribute("data");
						
						%>
						
						
						<div class="hover">
							<form class="row login_form" action="ArtikalKontroler"
								id="contactForm" method="post">
								<div class="col-md-12 form-group">
									<label>Naziv </label> <input type="text"
										class="form-control" name="nazivArtikla" placeholder="" 
										value="<%=(artikal != null) ? artikal.getIme() : ""%>">
								</div>
								<div class="col-md-12 form-group">
									<label>Opis </label>
									<textarea id="w3review" name="opisArtikla" placeholder="" rows="4"
										cols="45" 
										><%=(artikal != null) ? artikal.getOpis() : ""%></textarea>
								</div>



								<div class="col-md-12 form-group">
									<label>Cena</label> <input type="number" name="cenaArtikla" class="form-control"
										min="1" step="any" >
								</div>
								<div class="col-md-12 form-group">
									<label>Boja</label> <br> <select name="bojaArtikla"
										class="form-control">
										<option value=""></option>
										<option value="crna" <%if(artikal!=null && artikal.getBoja().equals("crna")){%>selected<% } %>>Crna</option>
										<option value="siva" <%if(artikal!=null && artikal.getBoja().equals("siva")){%>selected<% } %>>Siva</option>
										<option value="plava" <%if(artikal!=null && artikal.getBoja().equals("plava")){%>selected<% } %>>Plava</option>
										<option value="crvena" <%if(artikal!=null && artikal.getBoja().equals("crvena")){%>selected<% } %>>Crvena</option>
										<option value="srebrna" <%if(artikal!=null && artikal.getBoja().equals("srebrna")){%>selected<% } %>>Srebrna</option>
										<option value="bela" <%if(artikal!=null && artikal.getBoja().equals("bela")){%>selected<% } %>>Bela</option>
									</select>
								</div>
								<div class="col-md-12 form-group">
									<label>Grad</label> <br>
									 <select name="gradArtikla"
										class="form-control">
										<option value=""></option>
										<%
									if (listaGradova != null) {
										for (int i = 0; i < listaGradova.size(); i++) {
									%>
										<option value="<%=listaGradova.get(i).getIme()%>" <%if(artikal!=null && artikal.getGrad().equals(listaGradova.get(i).getIme())){%>selected<% } %>><%=listaGradova.get(i).getIme()%></option>
										<%
										}
									}
									%>
									</select>
								</div>
								
								<div class="col-md-12 form-group">
									<label>Kategorija</label> <br>
									 <select name="kategorijaArtikla"
										class="form-control">
										<option value=""></option>
												<%
									if (listaKategorija != null) {
										for (int i = 0; i < listaKategorija.size(); i++) {
									%>
								
									
										<option value="<%=listaKategorija.get(i).getIme()%>" <%if(artikal!=null && artikal.getKategorija().equals(listaKategorija.get(i).getIme())){%>selected<% } %>><%=listaKategorija.get(i).getIme()%></option>
										<%
										}
									}
									%>
									</select>
								</div>
								<div class="col-md-12 form-group">
									<label>Slika</label> <input
										type="text" class="form-control" name="slikaArtikla"
										placeholder="kupujemprodajem.png" value="<%=(artikal != null) ? artikal.getSlika() : ""%>">
								</div>
								
								<div class="col-md-12 form-group">
									<br><br><button type="submit" name="akcija" value="dodajArtikal"
										class="button button-login w-100">Dodaj artikal</button>
								</div>
								<%
								String poruka = (String) request.getAttribute("porukaDodajArtikal");
								if (poruka != null) {
									out.println("<p style='color: red'>" + poruka + "</p>");
								}
								%>
							</form>
						</div>


					</div>
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

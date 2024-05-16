package controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.DAO;
import model.ArtikalHelper;

/**
 * Servlet implementation class ArtikalKontroler
 */
@WebServlet("/ArtikalKontroler")
public class ArtikalKontroler extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ArtikalKontroler() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String akcija = request.getParameter("akcija");

		DAO dao = new DAO();
		ArrayList<ArtikalHelper> listaArtikla = dao.getSviArtikli();
		if (akcija != null && akcija.equals("filterGradova")) {
			String grad = request.getParameter("gradovi");
			System.out.println(grad);
			ArrayList<ArtikalHelper> artikliFilterGrad = new ArrayList<ArtikalHelper>();
			if (grad != null && grad != "") {
				for (int i = 0; i < listaArtikla.size(); i++) {
					if (listaArtikla.get(i).getGrad().equals(grad)) {
						artikliFilterGrad.add(listaArtikla.get(i));
					}
				}

				request.setAttribute("grad", grad);
				request.setAttribute("artikliFilterGrad", artikliFilterGrad);
				request.getRequestDispatcher("index.jsp").forward(request, response);

			} else {
				System.out.println("usao u else");
				request.setAttribute("listaArtikla", listaArtikla);
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
		} else if (akcija != null && akcija.equals("prikaziArtikal")) {
			String id = request.getParameter("artikal_id");
			int idArtikla = 0;
			ArtikalHelper artikal = new ArtikalHelper();
			if (id != null && !id.equals("")) {
				idArtikla = Integer.parseInt(id);
			}
			for (int i = 0; i < listaArtikla.size(); i++) {
				if (listaArtikla.get(i).getId() == idArtikla) {
					artikal = listaArtikla.get(i);
				}
			}
			request.setAttribute("artikal", artikal);
			request.getRequestDispatcher("singleProduct.jsp").forward(request, response);
		}
//			else {
//			System.out.println("usao u else");
////			request.setAttribute("listaArtikla", listaArtikla);
////			request.getRequestDispatcher("index.jsp").forward(request, response);
//		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String brand = request.getParameter("brand");
		String color = request.getParameter("color");
		String cenaOd = request.getParameter("cenaOd");
		String cenaDo = request.getParameter("cenaDo");
		String akcija = request.getParameter("akcija");
		DAO dao = new DAO();
		ArrayList<ArtikalHelper> listaArtikla = dao.getSviArtikli();
		if (brand != null) {
			System.out.println("usao u brand");
			String kategorija = "";
			ArrayList<ArtikalHelper> artikliFilterKategorija = new ArrayList<ArtikalHelper>();
			if (brand.equals("Mobilni telefon")) {

				for (int i = 0; i < listaArtikla.size(); i++) {
					if (listaArtikla.get(i).getKategorija().equals("Mobilni telefon")) {
						artikliFilterKategorija.add(listaArtikla.get(i));
					}
				}
				kategorija = "Mobilni telefon";
				request.setAttribute("kategorija", kategorija);
				request.setAttribute("artikliFilterKategorija", artikliFilterKategorija);
				request.getRequestDispatcher("index.jsp").forward(request, response);
				return;
			} else if (brand.equals("Tablet")) {

				for (int i = 0; i < listaArtikla.size(); i++) {
					if (listaArtikla.get(i).getKategorija().equals("Tablet")) {
						artikliFilterKategorija.add(listaArtikla.get(i));
					}
				}
				kategorija = "Tablet";
				request.setAttribute("kategorija", kategorija);
				request.setAttribute("artikliFilterKategorija", artikliFilterKategorija);
				request.getRequestDispatcher("index.jsp").forward(request, response);
				return;
			} else if (brand.equals("Laptop")) {

				for (int i = 0; i < listaArtikla.size(); i++) {
					if (listaArtikla.get(i).getKategorija().equals("Laptop")) {
						artikliFilterKategorija.add(listaArtikla.get(i));
					}
				}
				kategorija = "Laptop";
				request.setAttribute("kategorija", kategorija);
				request.setAttribute("artikliFilterKategorija", artikliFilterKategorija);
				request.getRequestDispatcher("index.jsp").forward(request, response);
				return;
			}
		} else if (color != null) {
			System.out.println("usao u color");
			String boja = "";
			ArrayList<ArtikalHelper> artikliFilterBoja = new ArrayList<ArtikalHelper>();
			if (color.equals("Crna")) {
				for (int i = 0; i < listaArtikla.size(); i++) {
					if (listaArtikla.get(i).getBoja().equals("crna")) {
						artikliFilterBoja.add(listaArtikla.get(i));
					}
				}
				boja = "Crna";
				request.setAttribute("boja", boja);
				request.setAttribute("artikliFilterBoja", artikliFilterBoja);
				request.getRequestDispatcher("index.jsp").forward(request, response);
				return;
			} else if (color.equals("Siva")) {
				for (int i = 0; i < listaArtikla.size(); i++) {
					if (listaArtikla.get(i).getBoja().equals("siva")) {
						artikliFilterBoja.add(listaArtikla.get(i));
					}
				}
				boja = "Siva";
				request.setAttribute("boja", boja);
				request.setAttribute("artikliFilterBoja", artikliFilterBoja);
				request.getRequestDispatcher("index.jsp").forward(request, response);
				return;
			} else if (color.equals("Plava")) {

				for (int i = 0; i < listaArtikla.size(); i++) {
					if (listaArtikla.get(i).getBoja().equals("plava")) {
						artikliFilterBoja.add(listaArtikla.get(i));
					}
				}
				boja = "Plava";
				request.setAttribute("boja", boja);
				request.setAttribute("artikliFilterBoja", artikliFilterBoja);
				request.getRequestDispatcher("index.jsp").forward(request, response);
				return;
			} else if (color.equals("Crvena")) {
				for (int i = 0; i < listaArtikla.size(); i++) {
					if (listaArtikla.get(i).getBoja().equals("crvena")) {

						artikliFilterBoja.add(listaArtikla.get(i));
					}
				}
				boja = "Crvena";
				request.setAttribute("boja", boja);
				request.setAttribute("artikliFilterBoja", artikliFilterBoja);
				request.getRequestDispatcher("index.jsp").forward(request, response);
				return;
			} else if (color.equals("Srebrna")) {

				for (int i = 0; i < listaArtikla.size(); i++) {
					if (listaArtikla.get(i).getBoja().equals("srebrna")) {
						artikliFilterBoja.add(listaArtikla.get(i));
					}
				}
				boja = "Srebrna";
				request.setAttribute("boja", boja);
				request.setAttribute("artikliFilterBoja", artikliFilterBoja);
				request.getRequestDispatcher("index.jsp").forward(request, response);
				return;
			} else if (color.equals("Bela")) {

				for (int i = 0; i < listaArtikla.size(); i++) {
					if (listaArtikla.get(i).getBoja().equals("bela")) {
						artikliFilterBoja.add(listaArtikla.get(i));
					}
				}
				boja = "Bela";
				request.setAttribute("boja", boja);
				request.setAttribute("artikliFilterBoja", artikliFilterBoja);
				request.getRequestDispatcher("index.jsp").forward(request, response);
				return;
			}

		} else if ((cenaOd != null && cenaOd != "") && (cenaDo == null || cenaDo == "")) {
			System.out.println("usao u cena od");
			for (int i = 0; i < cenaOd.length(); i++) {
				Character s = cenaOd.charAt(i);
				if (s.isLetter(s) || s.isSpace(s)) {
					request.setAttribute("listaArtikla", listaArtikla);
					request.getRequestDispatcher("index.jsp").forward(request, response);
					return;
				}
			}
			double iznosCenaOd = (double) Double.parseDouble(cenaOd);
			ArrayList<ArtikalHelper> artikliFilterCena = new ArrayList<ArtikalHelper>();
			for (int i = 0; i < listaArtikla.size(); i++) {
				if (listaArtikla.get(i).getCena() >= iznosCenaOd) {
					artikliFilterCena.add(listaArtikla.get(i));
				}
			}
			request.setAttribute("cenaOd", cenaOd);
			request.setAttribute("artikliFilterCena", artikliFilterCena);
			request.getRequestDispatcher("index.jsp").forward(request, response);
			return;
		} else if ((cenaOd != null && cenaOd != "") && (cenaDo != null && cenaDo != "")) {
			System.out.println("usao u obe cene");
			for (int i = 0; i < cenaOd.length(); i++) {
				Character s = cenaOd.charAt(i);
				if (s.isLetter(s) || s.isSpace(s)) {
					request.setAttribute("listaArtikla", listaArtikla);
					request.getRequestDispatcher("index.jsp").forward(request, response);
					return;
				}
			}
			for (int i = 0; i < cenaDo.length(); i++) {
				Character s = cenaDo.charAt(i);
				if (s.isLetter(s) || s.isSpace(s)) {
					request.setAttribute("listaArtikla", listaArtikla);
					request.getRequestDispatcher("index.jsp").forward(request, response);
					return;
				}
			}

			double iznosCenaOd = (double) Double.parseDouble(cenaOd);
			double iznosCenaDo = (double) Double.parseDouble(cenaDo);
			ArrayList<ArtikalHelper> artikliFilterCena = new ArrayList<ArtikalHelper>();
			for (int i = 0; i < listaArtikla.size(); i++) {
				if (listaArtikla.get(i).getCena() >= iznosCenaOd && listaArtikla.get(i).getCena() <= iznosCenaDo) {
					artikliFilterCena.add(listaArtikla.get(i));
				}
			}
			request.setAttribute("cenaOd", cenaOd);
			request.setAttribute("cenaDo", cenaDo);
			request.setAttribute("artikliFilterCena", artikliFilterCena);
			request.getRequestDispatcher("index.jsp").forward(request, response);
			return;
		} else if ((cenaOd == null || cenaOd == "") && (cenaDo != null && cenaDo != "")) {
			System.out.println("usao u cena Do");
			for (int i = 0; i < cenaDo.length(); i++) {
				Character s = cenaDo.charAt(i);
				if (s.isLetter(s) || s.isSpace(s)) {
					request.setAttribute("listaArtikla", listaArtikla);
					request.getRequestDispatcher("index.jsp").forward(request, response);
					return;
				}
			}
			double iznosCenaDo = (double) Double.parseDouble(cenaDo);
			ArrayList<ArtikalHelper> artikliFilterCena = new ArrayList<ArtikalHelper>();

			for (int i = 0; i < listaArtikla.size(); i++) {
				if (listaArtikla.get(i).getCena() <= iznosCenaDo) {
					artikliFilterCena.add(listaArtikla.get(i));
				}
			}

			request.setAttribute("cenaDo", cenaDo);
			request.setAttribute("artikliFilterCena", artikliFilterCena);
			request.getRequestDispatcher("index.jsp").forward(request, response);
			return;
		}

		if (akcija != null && akcija.equals("pretragaProizvoda")) {
			System.out.println("usli u akciju" + akcija);
			String ime = request.getParameter("imeArtikla").toLowerCase();
			System.out.println(ime);
			String kategorija = request.getParameter("kategorija");
//			if (kategorija != null) {
//				System.out.println(kategorija);
//			}
			ArrayList<ArtikalHelper> filtriraniProizvodi = new ArrayList<ArtikalHelper>();
			for (int i = 0; i < listaArtikla.size(); i++) {

				System.out.println(listaArtikla.get(i).getIme());
				if (listaArtikla.get(i).getIme().toLowerCase().startsWith(ime)) {
					System.out.println("USAO");
					filtriraniProizvodi.add(listaArtikla.get(i));
				}
			}
			System.out.println(listaArtikla.size());
			System.out.println(filtriraniProizvodi.size());
			request.setAttribute("filtriraniArtikli", filtriraniProizvodi);
			request.getRequestDispatcher("index.jsp").forward(request, response);

		} else if (akcija != null && akcija.equals("dodajArtikal")) {
			String nazivArtikla = request.getParameter("nazivArtikla");
			String opisArtikla = request.getParameter("opisArtikla");
			String cena = request.getParameter("cenaArtikla");
			System.out.println(cena);
			String bojaArtikla = request.getParameter("bojaArtikla");
			String gradArtikla = request.getParameter("gradArtikla");
			String kategorijaArtikla = request.getParameter("kategorijaArtikla");
			String slikaArtikla = request.getParameter("slikaArtikla");
			ArtikalHelper artikalPomocna = new ArtikalHelper(0, nazivArtikla, opisArtikla, bojaArtikla, slikaArtikla,
					kategorijaArtikla, 0, gradArtikla);
			if (!nazivArtikla.equals("") && !opisArtikla.equals("") && !cena.equals("") && !bojaArtikla.equals("")
					&& !gradArtikla.equals("") && !slikaArtikla.equals("")) {
				double cenaArtikla = 0;
				try {
					cenaArtikla = Double.parseDouble(cena);
					ArtikalHelper artikal = new ArtikalHelper(0, nazivArtikla, opisArtikla, bojaArtikla, slikaArtikla,
							kategorijaArtikla, cenaArtikla, gradArtikla);
					int artikalId= dao.dodajArtikal(artikal);
					if(artikalId!=0) {
						boolean uspesno = dao.dodajArtikalKategorija(artikalId, kategorijaArtikla);
						if(uspesno) {
							request.setAttribute("porukaDodajArtikal", "Uspesno dodat artikal");
							request.getRequestDispatcher("dodajArtikal.jsp").forward(request, response);
						}else {

							request.setAttribute("porukaDodajArtikal", "Neuspesno dodavanje artikla");
							request.getRequestDispatcher("dodajArtikal.jsp").forward(request, response);
						}
					}else {
						request.setAttribute("porukaDodajArtikal", "Neuspesno dodavanje artikla");
						request.getRequestDispatcher("dodajArtikal.jsp").forward(request, response);
					
					}

				} catch (Exception e) {
					e.printStackTrace();
				}
			} else {
				
				request.setAttribute("data", artikalPomocna);
				request.setAttribute("porukaDodajArtikal", "Greska, morate popuniti sva polja.");
				request.getRequestDispatcher("dodajArtikal.jsp").forward(request, response);
			}

		} else {
			System.out.println("usao u else od akcije");
			request.setAttribute("listaArtikla", listaArtikla);
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}

	}

}

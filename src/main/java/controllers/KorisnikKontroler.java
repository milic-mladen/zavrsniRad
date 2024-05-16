package controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.DAO;
import model.Korisnik;

@WebServlet("/KorisnikKontroler")
public class KorisnikKontroler extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public KorisnikKontroler() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action != null && action.equals("logOut")) {

			HttpSession s = request.getSession();
			s.invalidate();
			response.sendRedirect("index.jsp");

			// session.removeAttribute("logged in");

		}else if(action!=null && action.equals("dodajArtikal")) {
			
			
			
			response.sendRedirect("dodajArtikal.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		// System.out.println(action);

		if (action != null && action.equals("logIn")) {

			String username = request.getParameter("username");
			String password = request.getParameter("password");
			if (username != null && username.length() > 0 && password != null && password.length() > 0) {

				DAO dao = new DAO();

				Korisnik ulogovanKorisnik = dao.logIn(username, password);
				// System.out.println(loggedUser);

				if (ulogovanKorisnik != null) {
					HttpSession s = request.getSession();
					s.setAttribute("logged in", ulogovanKorisnik);

					// System.out.println("Korisnik je ulogovan");

					// ako se ulogovao kupac tj klijent
					response.sendRedirect("index.jsp");

				} else {
					request.setAttribute("porukaLogin", "Greska, netacan username ili password.");
					request.getRequestDispatcher("login.jsp").forward(request, response);
				}

			} else {
				request.setAttribute("porukaLogin", "Greska, popunite sva polja.");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
		} else if (action != null && action.equals("Register")) {
			String ime = request.getParameter("ime");
			String prezime = request.getParameter("prezime");
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			Korisnik korisnik = new Korisnik(ime, prezime, username, password);
			if (ime.equals("") || prezime.equals("") || username.equals("") || password.equals("") ) {
				request.setAttribute("porukaRegistracija", "Greska, morate popuniti sva polja.");
				request.setAttribute("data", korisnik);
				request.getRequestDispatcher("login.jsp").forward(request, response);
				return;//ista prica za return..
			}

			DAO dao = new DAO();
			// validacija za username
			
			if (dao.korisnikUsernamePostoji(korisnik)) {
				korisnik.setUsername("");
				request.setAttribute("data", korisnik);
				request.setAttribute("porukaRegistracija", "Greska, username vec postoji!");
				request.getRequestDispatcher("login.jsp").forward(request, response);
				return; 
				//kako za aromu nije bilo neophodno ovde return a ovde mora inace nastavlja kod isto tako i u drugom kontroleru sam imao taj slucaj
			}

			if (dao.dodajKorisnika(korisnik)) {
				request.setAttribute("porukaRegistracija", "Uspesno dodavanje korisnika!");
				request.getRequestDispatcher("login.jsp").forward(request, response);

			} else {
				request.setAttribute("porukaRegistracija", "Greska, korisnik vec postoji!");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}

		}
	}

}

package db;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Locale;

import model.Artikal;
import model.ArtikalHelper;
import model.Grad;
import model.Kategorija;
import model.Korisnik;

public class DAO {

	DbManager db = new DbManager();

	// DEFINICIJU SVIH SQL UPITA KOJE KORISTIMO NAD BAZOM
	private static String SELECTKORISNIKBYUSERNAMEANDPASSWORD = "SELECT * FROM korisnik WHERE username=? AND password=? ";
	private static String DODAJKORISNIKA = "INSERT INTO korisnik VALUES(null,?,?,?,?)";
	private static String DODAJARTIKAL = "INSERT INTO artikal VALUES(null,?,?,?,?,?,?)";
	private static String DODAJARTIKALKATEGORIJA = "INSERT INTO artikal_kategorija VALUES(null,?,?)";
	private static String SELECTSVEKORISNIKE = "SELECT * FROM korisnik";
	private static String SELECTSVEGRADOVE = "SELECT * FROM grad";
	private static String SELECTSVEKATEGORIJE = "SELECT * FROM kategorija";
	private static String SELECTSVEARTIKLE = "SELECT * FROM artikal a join artikal_kategorija ak on (a.artikal_id = ak.artikal_id) join grad g on (a.grad_id=g.grad_id) join kategorija k on (ak.kategorija_id=k.kategorija_id)";
	
	
	// DEFINICIJA METODA - SVAKI GORE DEFINISAN UPIT CE IMATI SVOJU METODU
	public Korisnik logIn(String username, String password) {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet result = null;

		Korisnik k = null;

		try {

			conn = db.getConnection();

			pstm = conn.prepareStatement(SELECTKORISNIKBYUSERNAMEANDPASSWORD);
			pstm.setString(1, username);
			pstm.setString(2, password);
			pstm.execute();

			result = pstm.getResultSet();

			if (result.next()) {
				k = new Korisnik();

				k.setId(result.getInt("korisnik_id"));
				k.setIme(result.getString("ime"));
				k.setPrezime(result.getString("prezime"));
				k.setUsername(result.getString("username"));
				k.setPassword(result.getString("password"));

			}

		} catch (Exception e) {
			e.printStackTrace();

		}

		return k;

	}

	public ArrayList<ArtikalHelper> getSviArtikli() {

		Connection conn = null;
		PreparedStatement pstm = null;
		ArrayList<ArtikalHelper> listaArtikla = new ArrayList<ArtikalHelper>();
		try {

			conn = db.getConnection();

			pstm = conn.prepareStatement(SELECTSVEARTIKLE);
			ResultSet result = pstm.executeQuery();

			while (result.next()) {
				ArtikalHelper a = new ArtikalHelper();
				a.setId(result.getInt("artikal_id"));
				a.setIme(result.getString("artikal_ime"));
				a.setOpis(result.getString("artikal_opis"));
				a.setCena(result.getDouble("artikal_cena"));
				a.setBoja(result.getString("artikal_boja"));
				a.setSlika(result.getString("artikal_slika"));
				a.setGrad(result.getString("grad_ime"));
				a.setKategorija(result.getString("kategorija_ime"));
				listaArtikla.add(a);
			}
			return listaArtikla;
		} catch (Exception e) {
			e.printStackTrace();
			return null;

		} finally {
			db.closeConnection(conn);
			db.closePrepareStmt(pstm);
		}
	}

	public boolean dodajKorisnika(Korisnik korisnik) {
		Connection conn = null;
		PreparedStatement pstm = null;
		try {

			conn = db.getConnection();
			pstm = conn.prepareStatement(DODAJKORISNIKA);

			pstm.setString(1, korisnik.getIme());
			pstm.setString(2, korisnik.getPrezime());
			pstm.setString(3, korisnik.getUsername());
			pstm.setString(4, korisnik.getPassword());
			pstm.executeUpdate();

			return true;

		} catch (Exception e) {
			e.printStackTrace();
			return false;

		}
	}

	public boolean korisnikUsernamePostoji(Korisnik korisnik) {
		Connection conn = null;
		PreparedStatement pstm = null;

		try {

			conn = db.getConnection();

			pstm = conn.prepareStatement(SELECTSVEKORISNIKE);
			ResultSet rs = pstm.executeQuery();
			while (rs.next()) {
				if (rs.getString("username").equals(korisnik.getUsername())) {
					return true;
				}
			}

			return false;

		} catch (Exception e) {
			e.printStackTrace();
			return false;

		}
	}

	public ArrayList<Grad> vratiSveGradove() {
		Connection conn = null;
		PreparedStatement pstm = null;
		ArrayList<Grad> listaGradova = new ArrayList<Grad>();
		try {

			conn = db.getConnection();

			pstm = conn.prepareStatement(SELECTSVEGRADOVE);
			ResultSet result = pstm.executeQuery();

			while (result.next()) {
				Grad g = new Grad();
				g.setId(result.getInt("grad_id"));
				g.setIme(result.getString("grad_ime"));

				listaGradova.add(g);
			}
			return listaGradova;
		} catch (Exception e) {
			e.printStackTrace();
			return null;

		} finally {
			db.closeConnection(conn);
			db.closePrepareStmt(pstm);
		}
	}

	public ArrayList<Kategorija> vratiSveKategorije() {
		Connection conn = null;
		PreparedStatement pstm = null;
		ArrayList<Kategorija> listaKategorija = new ArrayList<Kategorija>();
		try {

			conn = db.getConnection();

			pstm = conn.prepareStatement(SELECTSVEKATEGORIJE);
			ResultSet result = pstm.executeQuery();

			while (result.next()) {
				Kategorija k = new Kategorija();
				k.setId(result.getInt("kategorija_id"));
				k.setIme(result.getString("kategorija_ime"));

				listaKategorija.add(k);
			}
			return listaKategorija;
		} catch (Exception e) {
			e.printStackTrace();
			return null;

		} finally {
			db.closeConnection(conn);
			db.closePrepareStmt(pstm);
		}
	}

	public int dodajArtikal(ArtikalHelper artikal) {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet result = null;
		int artikalId = 0;
		try {

			conn = db.getConnection();
			pstm = conn.prepareStatement(DODAJARTIKAL, Statement.RETURN_GENERATED_KEYS);
			int gradId = vratiGradId(artikal.getGrad());
			if (gradId == 0) {
				return 0;
			}
			pstm.setString(1, artikal.getIme());
			pstm.setString(2, artikal.getOpis());
			pstm.setDouble(3, artikal.getCena());
			pstm.setString(4, artikal.getBoja());
			pstm.setString(5, artikal.getSlika());
			pstm.setInt(6, gradId);
			pstm.executeUpdate();
			result = pstm.getGeneratedKeys();
			while (result.next()) {
				artikalId = result.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			db.closeConnection(conn);
			db.closePrepareStmt(pstm);
		}
		return artikalId;
	}

	public boolean dodajArtikalKategorija(int artikalId, String kategorija) {
		
		Connection conn = null;
		PreparedStatement pstm = null;
		try {

			conn = db.getConnection();
			pstm = conn.prepareStatement(DODAJARTIKALKATEGORIJA, Statement.RETURN_GENERATED_KEYS);
			int kategorijaId=vratiKategorijaId(kategorija);
			if(kategorijaId==0) {
				return false;
			}
			pstm.setInt(1, artikalId);
			pstm.setInt(2, kategorijaId);
			pstm.executeUpdate();
		

		} catch (Exception e) {
			
			e.printStackTrace();
			return false;

		} finally {
			db.closeConnection(conn);
			db.closePrepareStmt(pstm);
		}
		return true;
	}

	public int vratiGradId(String grad) {
		Connection conn = null;
		PreparedStatement pstm = null;
		try {
			conn = db.getConnection();
			pstm = conn.prepareStatement(SELECTSVEGRADOVE);
			ResultSet result = pstm.executeQuery();
			while (result.next()) {
				String imeGrada = (result.getString("grad_ime"));
				if (imeGrada.equals(grad)) {
					return result.getInt("grad_id");
				}

			}
			return 0;

		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		} finally {
			db.closeConnection(conn);
			db.closePrepareStmt(pstm);
		}

	}

	public int vratiKategorijaId(String kategorija) {
		Connection conn = null;
		PreparedStatement pstm = null;
		try {
			conn = db.getConnection();
			pstm = conn.prepareStatement(SELECTSVEKATEGORIJE);
			ResultSet result = pstm.executeQuery();
			while (result.next()) {
				Kategorija k = new Kategorija();
				String kategorijaB = (result.getString("kategorija_ime"));
				if (kategorija.equals(kategorijaB)) {
					return result.getInt("kategorija_id");
				}

			}
			return 0;

		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		} finally {
			db.closeConnection(conn);
			db.closePrepareStmt(pstm);
		}

	}

}

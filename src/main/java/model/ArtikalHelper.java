package model;

public class ArtikalHelper {
	private int id;
	private String ime, opis, boja, slika, kategorija, grad;
	private double cena;
	public ArtikalHelper() {
		// TODO Auto-generated constructor stub
	}
	public ArtikalHelper(int id, String ime, String opis, String boja, String slika, String kategorija, double cena,
			String grad) {
		super();
		this.id = id;
		this.ime = ime;
		this.opis = opis;
		this.boja = boja;
		this.slika = slika;
		this.kategorija = kategorija;
		this.cena = cena;
		this.grad= grad;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getIme() {
		return ime;
	}
	public void setIme(String ime) {
		this.ime = ime;
	}
	public String getOpis() {
		return opis;
	}
	public void setOpis(String opis) {
		this.opis = opis;
	}
	public String getBoja() {
		return boja;
	}
	public void setBoja(String boja) {
		this.boja = boja;
	}
	public String getSlika() {
		return slika;
	}
	public void setSlika(String slika) {
		this.slika = slika;
	}
	public String getKategorija() {
		return kategorija;
	}
	public void setKategorija(String kategorija) {
		this.kategorija = kategorija;
	}
	public double getCena() {
		return cena;
	}
	public void setCena(double cena) {
		this.cena = cena;
	}
	public String getGrad() {
		return grad;
	}
	public void setGrad(String grad) {
		this.grad= grad;
	}
	@Override
	public String toString() {
		return "Ime artikla:" + ime ;
	}
	
}

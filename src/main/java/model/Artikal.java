package model;

public class Artikal {
	private int id;
	private String ime, opis, boja, slika;
	private double cena;
	private int grad_id;
	
	public Artikal() {
		// TODO Auto-generated constructor stub
	}
	public Artikal(int id, String ime, String opis, String boja,String slika, double cena, int grad_id) {
		super();
		this.id = id;
		this.ime = ime;
		this.opis = opis;
		this.boja = boja;
		this.cena = cena;
		this.grad_id = grad_id;
		this.slika=slika;
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
	public double getCena() {
		return cena;
	}
	public void setCena(double cena) {
		this.cena = cena;
	}
	public int getGrad_id() {
		return grad_id;
	}
	public void setGrad_id(int grad_id) {
		this.grad_id = grad_id;
	}
	@Override
	public String toString() {
		return "Artikal[ id:" + id + ", ime: " + ime + ", opis: " + opis + ", boja: " + boja + ", cena: " + cena
				+ ", grad_id: " + grad_id + "]";
	}

}

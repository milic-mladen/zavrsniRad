package model;

public class Korisnik {

	
	private int id;
	private String ime, prezime, username ,password;
	
	
	
	
	
	public Korisnik() {
		super();
		// TODO Auto-generated constructor stub
	}



	public Korisnik( String ime, String prezime, String username, String password) {
		super();
		this.ime = ime;
		this.prezime = prezime;
		this.username = username;
		this.password = password;
	}

	public Korisnik(int id, String ime, String prezime, String username, String password) {
		super();
		this.id = id;
		this.ime = ime;
		this.prezime = prezime;
		this.username = username;
		this.password = password;
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





	public String getPrezime() {
		return prezime;
	}





	public void setPrezime(String prezime) {
		this.prezime = prezime;
	}





	public String getUsername() {
		return username;
	}





	public void setUsername(String username) {
		this.username = username;
	}





	public String getPassword() {
		return password;
	}





	public void setPassword(String password) {
		this.password = password;
	}





	@Override
	public String toString() {
		return "Ime: " + ime + ", Prezime: " + prezime + ", Username: " + username + ", Password: "
				+ password ;
	}



	
	
	
	
	
	
	
	
	
	
	
	
	
}

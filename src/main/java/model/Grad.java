package model;

public class Grad {
	private int id;
	private String ime;

	public Grad() {
		// TODO Auto-generated constructor stub
	}

	public Grad(int id, String ime) {
		super();
		this.id = id;
		this.ime = ime;
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

	@Override
	public String toString() {
		return "Ime: " + ime;
	}

}

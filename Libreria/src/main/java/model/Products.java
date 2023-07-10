package model;

public class Products {
	private String isbn;
	private String titolo;
	private double  prezzo;
	private String casaEditrice;
	private String img;
	
	public Products(String isbn, String titolo, double prezzo, String casaEditrice) {
		super();
		this.isbn = isbn;
		this.titolo = titolo;
		this.prezzo = prezzo;
		this.casaEditrice = casaEditrice;
	}
	public Products(String isbn, String titolo, double prezzo, String casaEditrice, String img) {
		super();
		this.isbn = isbn;
		this.titolo = titolo;
		this.prezzo = prezzo;
		this.casaEditrice = casaEditrice;
		this.img = img;
	}
	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getTitolo() {
		return titolo;
	}

	public void setTitolo(String titolo) {
		this.titolo = titolo;
	}

	public double getPrezzo() {
		return prezzo;
	}

	public void setPrezzo(double prezzo) {
		this.prezzo = prezzo;
	}

	public String getCasaEditrice() {
		return casaEditrice;
	}

	public void setCasaEditrice(String casaEditrice) {
		this.casaEditrice = casaEditrice;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}
}

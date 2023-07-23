package model;

public class CartItem {
	private String isbn;
    private String titolo;
    private Double prezzo;
    private String casaEditrice;
    private String customer;
    private String img;

    public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public CartItem(String isbn, String titolo, Double prezzo, String casaEditrice, String img, String customer) {
    	this.isbn = isbn;
        this.titolo = titolo;
        this.prezzo = prezzo;
        this.casaEditrice = casaEditrice;
        this.img = img;
        this.customer = customer;
    }
	
	public CartItem(String isbn, String titolo, Double prezzo, String casaEditrice, String customer) {
    	this.isbn = isbn;
        this.titolo = titolo;
        this.prezzo = prezzo;
        this.casaEditrice = casaEditrice;
        this.customer = customer;
    }

    public String getCustomer() {
        return customer;
    }

    public void setCustomer(String customer) {
        this.customer = customer;
    }

    public String getTitolo() {
        return titolo;
    }

    public void setTitolo(String titolo) {
        this.titolo = titolo;
    }

    public Double getPrezzo() {
        return prezzo;
    }

    public void setPrezzo(Double prezzo) {
        this.prezzo = prezzo;
    }

    public String getCasaEditrice() {
        return casaEditrice;
    }

    public void setCasaEditrice(String casaEditrice) {
        this.casaEditrice = casaEditrice;
    }

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	
}


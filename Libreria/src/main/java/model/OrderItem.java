package model;

public class OrderItem {
	private int orderItemID;
	private int orderID;
	private String isbn;
	private String titolo;
	private Double prezzo;
	private String casaEditrice;
	private int quantity;
	private String dataOrdine;
	
	public OrderItem(int orderItemID, int orderID, String isbn, String titolo, Double prezzo, String casaEditrice, int quantity, String data) {
		super();
		this.orderItemID = orderItemID;
		this.orderID = orderID;
		this.isbn = isbn;
		this.titolo = titolo;
		this.setPrezzo(prezzo);
		this.setCasaEditrice(casaEditrice);
		this.quantity = quantity;
		this.dataOrdine = data;
	}

	public int getOrderItemID() {
		return orderItemID;
	}

	public void setOrderItemID(int orderItemID) {
		this.orderItemID = orderItemID;
	}

	public int getOrderID() {
		return orderID;
	}

	public void setOrderID(int orderID) {
		this.orderID = orderID;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
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

	public String getDataOrdine() {
		return dataOrdine;
	}

	public void setDataOrdine(String dataOrdine) {
		this.dataOrdine = dataOrdine;
	}
	
	
}
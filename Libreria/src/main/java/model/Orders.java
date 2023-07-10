package model;

public class Orders {
	private int id;
	private String Customer;
	
	public Orders(String customer) {
		super();
		Customer = customer;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCustomer() {
		return Customer;
	}

	public void setCustomer(String customer) {
		Customer = customer;
	}
	
	
}

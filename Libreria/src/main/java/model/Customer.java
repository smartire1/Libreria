package model;

public class Customer {
	private String email;
	private String nome;
	private String cognome;
	private String password;
	private boolean role;
	
	public Customer(String email, String nome, String cognome, String pwd, boolean role) {
		super();
		this.email = email;
		this.nome = nome;
		this.cognome = cognome;
		this.password = pwd;
		this.setRole(role);
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getCognome() {
		return cognome;
	}
	public void setCognome(String cognome) {
		this.cognome = cognome;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String pwd) {
		this.password = pwd;
	}
	public boolean getRole() {
		return role;
	}
	public void setRole(boolean role) {
		this.role = role;
	}
	
	
}

package model;

import java.sql.Date;

public class usuario {
	private String nome;
	private String sobrenome;
	private String cpf;
	private String login;
	private String email;
	private String senha;
	private String peso;
	private String altura;
	private String empresa_filiada;
	private int id;
	private String data_inicial;
	public usuario() {
		super();
		// TODO Auto-generated constructor stub
	}
	public usuario(String nome, String sobrenome, String cpf, String login, String senha, String peso, String altura,
			String empresa_filiada, int id, String data_inicial) {
		super();
		this.nome = nome;
		this.sobrenome = sobrenome;
		this.cpf = cpf;
		this.login = login;
		this.senha = senha;
		this.peso = peso;
		this.altura = altura;
		this.empresa_filiada = empresa_filiada;
		this.id = id;
		this.data_inicial = data_inicial;
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
	public String getSobrenome() {
		return sobrenome;
	}
	public void setSobrenome(String sobrenome) {
		this.sobrenome = sobrenome;
	}
	public String getCpf() {
		return cpf;
	}
	public void setCpf(String cpf) {
		this.cpf = cpf;
	}
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	public String getPeso() {
		return peso;
	}
	public void setPeso(String peso) {
		this.peso = peso;
	}
	public String getAltura() {
		return altura;
	}
	public void setAltura(String altura) {
		this.altura = altura;
	}
	public String getEmpresa_filiada() {
		return empresa_filiada;
	}
	public void setEmpresa_filiada(String empresa_filiada) {
		this.empresa_filiada = empresa_filiada;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getData_inicial() {
		return data_inicial;
	}
	public void setData_inicial(String data_inicial) {
		this.data_inicial = data_inicial;
	}
	
	

}

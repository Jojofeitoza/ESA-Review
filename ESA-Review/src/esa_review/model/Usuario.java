package esa_review.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Usuario {
<<<<<<< HEAD
	
	
	@Id	
	@Column(name = "usu_id")
	private int id;
	@Column(name = "usu_nome")
	private String nome;
	@Column(name = "usu_login")
	private String login;
	@Column(name = "usu_senha")
	private String senha;
	@Column(name = "e_mail")
	private String e_mail;
	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
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

	public String getE_mail() {
		return e_mail;
	}
=======
///
>>>>>>> e17ea0a4b9553fbfc259a350aad4b096554e17dd

	public void setE_mail(String e_mail) {
		this.e_mail = e_mail;
	}
	
	
}

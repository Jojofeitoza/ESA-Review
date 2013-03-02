package esa_review.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Review {
	
	@Id	
	@Column(name = "rev_id")
	private int id;
	
	@Column(name = "rev_desc")
	private String descricao;
	
	@Column(name = "prod_id")
	private int prod_id;
	
	@Column(name = "usu_id")
	private int usu_id;
	
	@Column(name = "rev_contP")
	private int contP ;
	
	@Column(name = "rev_contN")
	private int contN ;
	@Column(name = "dono")
	private String dono;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public int getUsu_id() {
		return usu_id;
	}
	public void setUsu_id(int usu_id) {
		this.usu_id = usu_id;
	}
	public int getContP() {
		return contP;
	}
	public void setContP(int contP) {
		this.contP = contP;
	}
	public int getContN() {
		return contN;
	}
	public void setContN(int contN) {
		this.contN = contN;
	}
	public int getProd_id() {
		return prod_id;
	}
	public void setProd_id(int prod_id) {
		this.prod_id = prod_id;
	}
	public String getDono() {
		return dono;
	}
	public void setDono(String dono) {
		this.dono = dono;
	}
	
	
}

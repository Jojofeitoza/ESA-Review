package esa_review.model;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Entity;


@Entity
public class Comentario {

	@Id	
	@Column(name = "coment_id")
	private int id;
	@Column(name = "comentario")
	private String comentario;
	@Column(name = "rev_id")
	private int rev_id;
	@Column(name = "usu_id")
	private int usu_id;
	
	@Column(name = "dono")
	private String dono;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getComentario() {
		return comentario;
	}
	public void setComentario(String comentario) {
		this.comentario = comentario;
	}
	public int getRev_id() {
		return rev_id;
	}
	public void setRev_id(int rev_id) {
		this.rev_id = rev_id;
	}
	public int getUsu_id() {
		return usu_id;
	}
	public void setUsu_id(int usu_id) {
		this.usu_id = usu_id;
	}
	public String getDono() {
		return dono;
	}
	public void setDono(String dono) {
		this.dono = dono;
	}
	
	
}

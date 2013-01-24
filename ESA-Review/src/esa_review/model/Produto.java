package esa_review.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Produto {


	@Id	
	@Column(name = "prod_cod")
	private String codigo;
	@Column (name = "prod_nome")
	private String nome;
	@Column (name = "prod_desc")
	private String descri;
	//private String categ;
	@Column (name = "prod_preco")
	private float preco;
	@Column (name = "prod_img")
	private String imagem;

	
	public Produto(){
		
	}

	public String getCodigo() {
		return this.codigo;
	}
	
	public void setCodigo(String cod){
		this.codigo = cod;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getDescri() {
		return descri;
	}

	public void setDescri(String descri) {
		this.descri = descri;
	}

	public float getPreco() {
		return this.preco;
	}

	public void setPreco(float preco) {
		this.preco = preco;
	}

	public String getImagem() {
		return this.imagem;
	}

	public void setImagem(String imagem) {
		this.imagem = imagem;
	}

}

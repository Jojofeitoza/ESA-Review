package esa_review.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Produto {
//


	@Id	
	@Column(name = "prod_id")
	private int id;
	@Column(name = "prod_cod")
	private String codigo;
	@Column (name = "prod_nome")
	private String nome;
	@Column (name = "usu_id")
	private int usu_id;	
	@Column (name = "prod_desc")
	private String descri;
	//private String categ;
	
	/* preco está como string para eu pode formatar o valor ao salvar e buscar no banco de dados(no banco de dados preco esta como varchar)	 * 
	 */	
	@Column (name = "prod_preco")
	private String preco;
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

	public String getPreco() {
		return this.preco;
	}

	public void setPreco(String preco) {
		this.preco = preco;
	}

	public String getImagem() {
		return this.imagem;
	}

	public void setImagem(String imagem) {
		this.imagem = imagem;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUsu_id() {
		return usu_id;
	}

	public void setUsu_id(int usu_id) {
		this.usu_id = usu_id;
	}

}

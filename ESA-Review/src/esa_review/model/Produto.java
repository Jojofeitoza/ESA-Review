package esa_review.model;

public class Produto {
	
	private String desc;
    private String categ;
    private float preco;
    private int codigo;
    private String imagem;
    
    public Produto(String desc, String categ, float preco, int codigo, String img){
        
        this.desc = desc;
        this.categ = categ;
        this.preco = preco;
        this.codigo = codigo;  
        this.imagem = img;
    
    
    }

    /**
     * @return the desc
     */
    public String getDesc() {
        return desc;
    }

    /**
     * @param desc the desc to set
     */
    public void setDesc(String desc) {
        this.desc = desc;
    }

    /**
     * @return the categ
     */
    public String getCateg() {
        return categ;
    }

    /**
     * @param categ the categ to set
     */
    public void setCateg(String categ) {
        this.categ = categ;
    }

    /**
     * @return the preco
     */
    public float getPreco() {
        return preco;
    }

    /**
     * @param preco the preco to set
     */
    public void setPreco(float preco) {
        this.preco = preco;
    }

    /**
     * @return the codigo
     */
    public int getCodigo() {
        return codigo;
    }

    /**
     * @return the imagem
     */
    public String getImagem() {
        return imagem;
    }

    /**
     * @param imagem the imagem to set
     */
    public void setImagem(String imagem) {
        this.imagem = imagem;
    }

}

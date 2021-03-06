package esa_review.controller;

import java.text.DecimalFormat;
import java.util.Collection;

import Autenticacao.Restrito;
import br.com.caelum.vraptor.Delete;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.Validator;
import br.com.caelum.vraptor.validator.ValidationMessage;
import esa_review.dao.ProdutoDAO;
import esa_review.model.Produto;

@Resource
public class ProdutoController {

	private final ProdutoDAO produtoDAO;
	private final Result result;
	private Validator validator;
	private DecimalFormat formatador;
	
	
	public ProdutoController(Result r, Validator validator, ProdutoDAO produtoDAO){
		
		this.result = r;	
		this.validator = validator;
		this.produtoDAO = produtoDAO;
		this.formatador = new DecimalFormat("#,###.00"); 
		
	}
	
	@Restrito
	@Get("/produto/novo")
	public void novo() {
		
		
	}
	
	@Restrito
	@Get("/produto/{produto.id}/exibir") // {produto.codigo} instancia o objeto produto, chama o setCodigo e esse objeto � passo como parametro no metodo exibir
	public void exibir(Produto produto){
		
		produto = produtoDAO.loadById(produto);
		
		result.include("produto", produto);
		
	}
	
	
	@Restrito
	@Get("/produto")
	public void listar(){//nome do metodo tem que ser igual ao nome da pagina jsp(lista.jsp)
		
		Collection<Produto> produtoList = this.produtoDAO.listAll();
		
		result.include("produtoList", produtoList);
		
	}
	
	
	@Restrito
	@Get("/produto/{id_user}/meusProdutos")//Lista soomente os produtos do usuario logado
	public void listar(int id_user){
		
		Collection<Produto> produtoList = this.produtoDAO.list(id_user);
		
		result.include("produtoList", produtoList).forwardTo("/WEB-INF/jsp/produto/meusProdutos.jsp");
		
	}
	
	@Restrito
	@Get("/produto/{id_user}/favoritos")
	public void addFavorito(){
		
	}
	@Restrito
	@Get("/produto/{id_user}/favoritos")//Lista somente os produtos do usuario logado
	public void favoritos(int id_user){
		
		Collection<Produto> produtoList = this.produtoDAO.favorito(id_user);
		
		result.include("produtoList", produtoList).forwardTo("/WEB-INF/jsp/produto/favoritos.jsp");
		
	}
	@Restrito
	@Post("/produto")
	public void salvar(final Produto produto){
		
		validarCampos(produto);
		
		if(produto.getPreco().isEmpty())
			produto.setPreco("0.00");
		
				
		String s = produto.getPreco().replace(".", "").replace(",", ".");	
		
		produto.setPreco(s);		
		
		produtoDAO.save(produto);
		
		result.redirectTo(this).listar(produto.getUsu_id());	
	}
	
	@Restrito
	@Delete("/produto/{produto.id}")
	public void remover(Produto produto){
		
		produto = this.produtoDAO.remove(produto);
		
		result.redirectTo(this).listar(produto.getUsu_id());
		
		
	}
	
	@Restrito
	@Get("/produto/{produto.id}/editar")
	public void editar(Produto produto){
		
		produto = this.produtoDAO.loadById(produto);
		
		//System.out.println(produto.getId());
		
		/*//Formatar preco que vendo do banco para exibir no jsp
		String precoFormatado = formatador.format(Double.parseDouble(produto.getPreco()));     
		
		System.out.println(precoFormatado);
		
		//produto.setPreco(precoFormatado);	  
*/		
		
		result.include("produto", produto);
				
	}
	
	@Restrito
	@Post("/produto/atualizar")
	public void atualizar(Produto produto){	

		
		//Produto prod = this.produtoDAO.loadByCodigo(produto.getCodigo());
		//System.out.println(prod.getNome());
		
		
		/*
		 *  Para usar m�todo validarCampos(Produto produto) aqui tenho que modificar para que n�o seja poss�vel editar o codigo.
		 */
		
		//Valida��o de campos utilizando a Classe Validator do Vraptor
		if(produto.getCodigo().equals("") ){	
			
			this.validator.add(new ValidationMessage("O campo c�digo � obrig�rio", "Codigo"));
			
		}else if(!produto.getCodigo().matches("\\d+")){
			
			this.validator.add(new ValidationMessage("O campo c�digo deve conter apenas n�meros.", "Codigo"));
		}
		
		if(produto.getNome().equals("")){
			
			this.validator.add(new ValidationMessage("O campo nome � obrigatorio.", "Nome"));		
			
		}else if(produto.getNome().length() < 3){
			
			this.validator.add(new ValidationMessage("O campo nome deve ter no m�nimo 3 caracteres.", "Nome"));
		}
		
		if(produto.getDescri().equals("")){
			this.validator.add(new ValidationMessage("O campo descri��o � obrigat�rio.", "Descricao"));
		}
		
	/*	if(produto.getPreco() < 0.0){
			this.validator.add(new ValidationMessage("O campo pre�o deve ser positivo.", "Preco"));
		}	*/
		
		
		this.validator.onErrorUsePageOf(this).novo();
		//fim - Valida��o de campos utilizando a Classe Validator do Vraptor
		
		
		if(produto.getPreco().isEmpty())
			produto.setPreco("0.00");
		
		//retir o primeiro ponto e coloco virgula para poder gravar no banco
		String s = produto.getPreco().replace(".", "").replace(",", ".");	
		
				
		produto.setPreco(s);
		
		this.produtoDAO.update(produto);
		
		result.forwardTo(this).exibir(produto);		
		
		
	}
	
	
	
	public void validarCampos(Produto produto){
		
		/* <input type="text" name="produto.codigo" value="${produto.codigo}"
		 * 
		 *  coloquei value="..." nos input da pagina novo.jsp, s� assim ele n�o deixou adicionar o produto com o erro
		 *  
		 */
		
		//Valida��o de campos utilizando a Classe Validator do Vraptor
		if(produto.getCodigo().equals("") ){
			
			this.validator.add(new ValidationMessage("O campo c�digo � obrig�rio", "Codigo"));
			
		}else if(!produto.getCodigo().matches("\\d+")){
			
			this.validator.add(new ValidationMessage("O campo c�digo deve conter apenas n�meros.", "Codigo"));
			
		}else if(produtoDAO.loadById(produto) != null){
			
			this.validator.add(new ValidationMessage("Esse c�digo j� est� sendo usando por outro produto.", "Codigo"));
		}
			
		
		if(produto.getNome().equals("")){
			
			this.validator.add(new ValidationMessage("O campo nome � obrigatorio.", "Nome"));		
			
		}else if(produto.getNome().length() < 3){
			
			this.validator.add(new ValidationMessage("O campo nome deve ter no m�nimo 3 caracteres.", "Nome"));
		}
		
		if(produto.getDescri().equals("")){
			this.validator.add(new ValidationMessage("O campo descri��o � obrigat�rio.", "Descricao"));
		}
		
	/*	if(produto.getPreco() < 0.0){
			this.validator.add(new ValidationMessage("O campo pre�o deve ser positivo.", "Preco"));
		}*/	
		
		
		this.validator.onErrorUsePageOf(this).novo();
		//fim - Valida��o de campos utilizando a Classe Validator do Vraptor
	}	
	@Restrito

	 @Get("/produto/busca")	

	public void busca(Produto produto) {		

			/*if(produto.getNome().length()< 3){

			 this.validator.add(new ValidationMessage("A palavra deve cont�m no m�nimo 3 caracteres.", "Descricao"));

		}
		

		 this.validator.onErrorUsePageOf(this).busca(produto);

		*/

		

		 Collection<Produto> produtoList = this.produtoDAO.busca(produto.getNome());

		

		result.include("produtoList", produtoList);

	 }

}

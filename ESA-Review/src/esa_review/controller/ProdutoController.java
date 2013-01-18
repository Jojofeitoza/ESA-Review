package esa_review.controller;

import java.util.Collection;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.sun.org.apache.xerces.internal.impl.validation.ValidationManager;

import esa_review.dao.CriadorDeSessionFactory;
import esa_review.dao.CriadorSession;
import esa_review.dao.ProdutoDAO;
import esa_review.model.Produto;
import br.com.caelum.vraptor.Delete;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.Validator;
import br.com.caelum.vraptor.validator.ValidationMessage;

@Resource
public class ProdutoController {

	private final ProdutoDAO produtoDAO;
	private final Result result;
	private Validator validator;
	
	
	public ProdutoController(Result r, Validator validator){
		this.result = r;
		
		SessionFactory factory = new CriadorDeSessionFactory().getInstance();
		Session session = new CriadorSession(factory).getInstance();
		
		this.validator = validator;
		this.produtoDAO = new ProdutoDAO(session);
		
	}
	
	@Get("/produto/novo")
	public void novo() {
		
		
	}
	
	@Get("/produto/{produto.codigo}/exibir") // {produto.codigo} instancia o objeto produto, chama o setCodigo e esse objeto é passo como parametro no metodo exibir
	public void exibir(Produto produto){
		
		produto = produtoDAO.loadById(produto);
		
		result.include("produto", produto);
		
	}
	
	
	
	@Get("/produto")
	public void listar(){//nome do metodo tem que ser igual ao nome da pagina jsp(lista.jsp)
		
		Collection<Produto> produtoList = this.produtoDAO.listAll();
		
		result.include("produtoList", produtoList);
		
	}
	
	@Post("/produto")
	public void salvar(final Produto produto){
		
		validarCampos(produto);
		
		produtoDAO.save(produto);
		
		result.include("messagem", "Produto cadastrado com sucesso!").redirectTo(this).listar();		
	}
	
	@Delete("/produto/{produto.codigo}")
	public void remover(Produto produto){
		
		produto = this.produtoDAO.remove(produto);
		
		result.redirectTo(this).listar();
		
		
	}
	
	@Get("/produto/{produto.codigo}/editar")
	public void editar(Produto produto){
		
		produto = this.produtoDAO.loadById(produto);
		
		result.include("produto", produto);
				
	}
	
	@Post("/produto/atualizar")
	public void atualizar(Produto produto){	

		
		/*
		 *  Para usar método validarCampos(Produto produto) aqui tenho que modificar para que não seja possível editar o codigo.
		 */
		
		//Validação de campos utilizando a Classe Validator do Vraptor
		if(produto.getCodigo().equals("") ){	
			
			this.validator.add(new ValidationMessage("O campo código é obrigário", "Codigo"));
			
		}else if(!produto.getCodigo().matches("\\d+")){
			
			this.validator.add(new ValidationMessage("O campo código deve conter apenas números.", "Codigo"));
		}
		
		if(produto.getNome().equals("")){
			
			this.validator.add(new ValidationMessage("O campo nome é obrigatorio.", "Nome"));		
			
		}else if(produto.getNome().length() < 3){
			
			this.validator.add(new ValidationMessage("O campo nome deve ter no mínimo 3 caracteres.", "Nome"));
		}
		
		if(produto.getDescri().equals("")){
			this.validator.add(new ValidationMessage("O campo descrição é obrigatório.", "Descricao"));
		}
		
		if(produto.getPreco() < 0.0){
			this.validator.add(new ValidationMessage("O campo preço deve ser positivo.", "Preco"));
		}	
		
		
		this.validator.onErrorUsePageOf(this).novo();
		//fim - Validação de campos utilizando a Classe Validator do Vraptor
		
		
		this.produtoDAO.update(produto);
		
		result.forwardTo(this).exibir(produto);		
		
		
	}
	
	
	
	public void validarCampos(Produto produto){
		
		/* <input type="text" name="produto.codigo" value="${produto.codigo}"
		 * 
		 *  coloquei value="..." nos input da pagina novo.jsp, só assim ele não deixou adicionar o produto com o erro
		 *  
		 */
		
		//Validação de campos utilizando a Classe Validator do Vraptor
		if(produto.getCodigo().equals("") ){
			
			this.validator.add(new ValidationMessage("O campo código é obrigário", "Codigo"));
			
		}else if(!produto.getCodigo().matches("\\d+")){
			
			this.validator.add(new ValidationMessage("O campo código deve conter apenas números.", "Codigo"));
			
		}else if(produtoDAO.loadById(produto) != null){
			
			this.validator.add(new ValidationMessage("Esse código já está sendo usando por outro produto.", "Codigo"));
		}
			
		
		if(produto.getNome().equals("")){
			
			this.validator.add(new ValidationMessage("O campo nome é obrigatorio.", "Nome"));		
			
		}else if(produto.getNome().length() < 3){
			
			this.validator.add(new ValidationMessage("O campo nome deve ter no mínimo 3 caracteres.", "Nome"));
		}
		
		if(produto.getDescri().equals("")){
			this.validator.add(new ValidationMessage("O campo descrição é obrigatório.", "Descricao"));
		}
		
		if(produto.getPreco() < 0.0){
			this.validator.add(new ValidationMessage("O campo preço deve ser positivo.", "Preco"));
		}
		
		//Tenho que mudar atributo peco para String pois quando usuario inseri com valor com , no formulario o vraptor faz a validação e nega
		// mesmo fazendo o replace da errado.
		String precoFormatado = String.valueOf(produto.getPreco()).replace(".", "").replace(",", ".");
		System.out.println(">>>>>>>>>>>"+precoFormatado);
		produto.setPreco(Float.valueOf(precoFormatado));
		
		
		
		this.validator.onErrorUsePageOf(this).novo();
		//fim - Validação de campos utilizando a Classe Validator do Vraptor
	}
	
	

}

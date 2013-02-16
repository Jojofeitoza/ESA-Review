package esa_review.controller;

import java.util.ArrayList;
import java.util.Collection;

import ordena_review.BoobleSort;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import Autenticacao.Restrito;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.Validator;
import esa_review.dao.CriadorDeSessionFactory;
import esa_review.dao.CriadorSession;
import esa_review.dao.ProdutoDAO;
import esa_review.dao.ReviewDAO;
import esa_review.dao.UsuarioDAO;
import esa_review.model.Produto;
import esa_review.model.Review;

@Resource
public class ReviewController {

	private final ReviewDAO reviewDAO;
	private final Result result;
	private Validator validator;
	private final UsuarioDAO usuarioDAO;
	private final ProdutoDAO produtoDAO;// acrescentado 08/02/2013
	
	public ReviewController(Result r, Validator validator, UsuarioDAO usuarioDAO,
							ProdutoDAO produtoDAO){
		this.result = r;
		this.usuarioDAO = usuarioDAO;
		this.produtoDAO = produtoDAO;// acrescentado 08/02/2013
		SessionFactory factory = new CriadorDeSessionFactory().getInstance();
		Session session = new CriadorSession(factory).getInstance();
		
		this.validator = validator;
		this.reviewDAO = new ReviewDAO(session);
		
		
	}
	
	@Restrito
	@Get("/review/novo")
	public void novo(int prod_id) { // esse parametro vem do listar.jsp, está sendo enviado atraves do name do input. 
		
		result.include("prod_id", prod_id);
		
	}
	
	@Restrito
	@Get("/review/{review.id}/exibir") // {review.id} instancia o objeto review, chama o setCodigo e esse objeto é passo como parametro no metodo exibir
	public void exibir(Review review){
		Collection<Review> reviewList = this.reviewDAO.listAll();
		Collection<Produto> produtoList = this.produtoDAO.listAll();// acrescentado 08/02/2013
		result.include("produtoList", produtoList);// acrescentado 08/02/2013
		result.include("reviewList", reviewList);
		
		review = reviewDAO.loadById(review);
		result.include("review", review);
		
		
	}
	
	
	@Restrito
	@Get("/review")
	public void listar(){//nome do metodo tem que ser igual ao nome da pagina jsp(lista.jsp)
		Review review = new Review();
		Collection<Review> reviewList = this.reviewDAO.listAll();
		
		// ordenar a lista pela votação posiitiva
		//ArrayList lista =  (ArrayList) reviewList;
		//BoobleSort booble = new BoobleSort(  );
		//reviewList  = (Collection<Review>) booble.ordena(lista);
		
		Collection<Produto> produtoList = this.produtoDAO.listAll();// acrescentado 08/02/2013
		result.include("produtoList", produtoList);// acrescentado 08/02/2013
		result.include("reviewList", reviewList);
		
	}
	
	@Restrito
	@Post("/review")
	public void salvar(final Review review){
		
		//review.setContP(1);
		
		reviewDAO.save(review);
		
		result.redirectTo(this).listar();		
	}

/*	@Restrito
	@Delete("/review/{review.codigo}")
	public void remover(Review review){
		
		review = this.reviewDAO.remove(review);
		
		result.redirectTo(ProdutoController.class).listar();	
		
		
	}
	
	@Restrito
	@Get("/review/{review.codigo}/editar")
	public void editar(Review review){
		
		review = this.reviewDAO.loadById(review);
		
		result.include("review", review);
				
	}*/
	
	@Restrito
	@Get("/review/{review.id}/votarPositivo")
	public void votarPositivo(Review review){	
		//result.include("review", review);
		result.include("message","Voto Realizado com Sucesso!");
		Review aux = reviewDAO.loadById(review);
		
		int voto = aux.getContP() + 1;
	
		aux.setContP(voto);				
		
		this.atualizar(aux);
		
	}
	
	@Restrito
	@Get("/review/{review.id}/votarNegativo")
	public void votarNegativo(Review review){
		//result.include("review", review);
		result.include("message","Voto Realizado com Sucesso!");
		
		Review aux = reviewDAO.loadById(review);
		
		int voto = aux.getContN() + 1;
		
		aux.setContN(voto);				
		
		this.atualizar(aux);
	}
	
	@Restrito
	@Post("/review/atualizar")
	public void atualizar(Review review){	

		/*
		
		//  Para usar método validarCampos(Produto produto) aqui tenho que modificar para que não seja possível editar o codigo.
		 
		
		//Validação de campos utilizando a Classe Validator do Vraptor
		if(review.getId() == 0 ){	
			
			this.validator.add(new ValidationMessage("O campo código é obrigário", "Codigo"));
			
		}else if(!review.getCodigo().matches("\\d+")){
			
			this.validator.add(new ValidationMessage("O campo código deve conter apenas números.", "Codigo"));
		}
		
		if(review.getNome().equals("")){
			
			this.validator.add(new ValidationMessage("O campo nome é obrigatorio.", "Nome"));		
			
		}else if(review.getNome().length() < 3){
			
			this.validator.add(new ValidationMessage("O campo nome deve ter no mínimo 3 caracteres.", "Nome"));
		}
		
		if(review.getDescri().equals("")){
			this.validator.add(new ValidationMessage("O campo descrição é obrigatório.", "Descricao"));
		}
		
		if(review.getPreco() < 0.0){
			this.validator.add(new ValidationMessage("O campo preço deve ser positivo.", "Preco"));
		}	
		
		
		this.validator.onErrorUsePageOf(this).novo();
		//fim - Validação de campos utilizando a Classe Validator do Vraptor
		
		
		
		*/
		
		
		this.reviewDAO.update(review);
		
		result.forwardTo(this).listar();		
		
		
	}
	
	
	
	/**public void validarCampos(Review review){
		
		/* <input type="text" name="produto.codigo" value="${produto.codigo}"
		 * 
		 *  coloquei value="..." nos input da pagina novo.jsp, só assim ele não deixou adicionar o produto com o erro
		 *  
		 
		
		//Validação de campos utilizando a Classe Validator do Vraptor
		if(produto.getCodigo().equals("") ){
			
			this.validator.add(new ValidationMessage("O campo código é obrigário", "Codigo"));
			
		}else if(!produto.getCodigo().matches("\\d+")){
			
			this.validator.add(new ValidationMessage("O campo código deve conter apenas números.", "Codigo"));
			
		}else if(reviewDAO.loadById(produto) != null){
			
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
	*/
	

}



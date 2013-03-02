package esa_review.controller;

import java.util.Collection;

import Autenticacao.Restrito;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.Validator;
import esa_review.dao.ComentarioDAO;
import esa_review.model.Comentario;

@Resource
public class ComentarioController {
	
	private final ComentarioDAO comentarioDAO;
	private final Result result;
	private Validator validator;
	
	
	
	public ComentarioController(Result r, Validator validator, ComentarioDAO comentarioDAO){
		
		this.result = r;
		this.comentarioDAO = comentarioDAO;		
		this.validator = validator;
		
	}
	
	@Restrito
	@Get("/comentario/novo")
	public void novo(int rv_id) {
		
		this.result.include("rv_id", rv_id); //esse parametro vem do listar.jsp, está sendo enviado atraves do name do input. 
		
		
	}
	
	/*@Restrito
	@Get("/comentario/{comentario.id}/exibir") // {produto.codigo} instancia o objeto produto, chama o setCodigo e esse objeto é passo como parametro no metodo exibir
	public void exibir(Comentario comentario){
		
		comentario = comentarioDAO.loadById(comentario);
		
		result.include("comentario", comentario);
		
	}*/
	
	
	/*@Restrito
	@Get("/comentario")
	public void listar(){//nome do metodo tem que ser igual ao nome da pagina jsp(lista.jsp)
		
		Collection<Comentario> comentarioList = this.comentarioDAO.listAll();
		
		result.include("comentarioList", comentarioList);
		
	}*/
	
	
	@Restrito
	@Get("/comentario/{id_rev}/meusComentarios")//Lista soomente os produtos do usuario logado
	public void listar(int id_rev){
		
		Collection<Comentario> comentarioList = this.comentarioDAO.list(id_rev);
		
		result.include("produtoList", comentarioList).forwardTo("/WEB-INF/jsp/produto/meusComentarios.jsp");
		
	}
	
	@Restrito
	@Post("/comentario")
	public void salvar(final Comentario comentario){
		
		//validarCampos(comentario);
		
		comentarioDAO.save(comentario);
		
		result.redirectTo(ReviewController.class).listar();	
	}
	
	/*@Restrito
	@Delete("/produto/{produto.id}")
	public void remover(Produto produto){
		
		produto = this.produtoDAO.remove(produto);
		
		result.redirectTo(this).listar(produto.getUsu_id());
		
		
	}*/
	
	/*@Restrito
	@Get("/produto/{produto.id}/editar")
	public void editar(Produto produto){
		
		produto = this.produtoDAO.loadById(produto);
		
		System.out.println(produto.getId());
		
		//Formatar preco que vendo do banco para exibir no jsp
		String precoFormatado = formatador.format(Double.parseDouble(produto.getPreco()));     
		
		System.out.println(precoFormatado);
		
		//produto.setPreco(precoFormatado);	  
		
		
		result.include("produto", produto);
				
	}*/
	
	/*@Restrito
	@Post("/produto/atualizar")
	public void atualizar(Produto produto){	

		
		
		 *  Para usar método validarCampos(Produto produto) aqui tenho que modificar para que não seja possível editar o codigo.
		 
		
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
		
		
		if(produto.getPreco().isEmpty())
			produto.setPreco("0.00");
		
		//retir o primeiro ponto e coloco virgula para poder gravar no banco
		String s = produto.getPreco().replace(".", "").replace(",", ".");	
		
		System.out.println(s);
		
		produto.setPreco(s);
		
		this.produtoDAO.update(produto);
		
		result.forwardTo(this).exibir(produto);		
		
		
	}*/
	
	
	
	/*public void validarCampos(Produto produto){
		
		 <input type="text" name="produto.codigo" value="${produto.codigo}"
		 * 
		 *  coloquei value="..." nos input da pagina novo.jsp, só assim ele não deixou adicionar o produto com o erro
		 *  
		 
		
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
		
		
		this.validator.onErrorUsePageOf(this).novo();
		//fim - Validação de campos utilizando a Classe Validator do Vraptor
	}*/

}

package esa_review.controller;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import Autenticacao.Restrito;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.Validator;
import br.com.caelum.vraptor.validator.ValidationMessage;
import esa_review.dao.CriadorDeSessionFactory;
import esa_review.dao.CriadorSession;
import esa_review.dao.UsuarioDAO;
import esa_review.model.Usuario;
import esa_review.model.UsuarioWeb;

@Resource
public class UsuarioController {

	private final UsuarioDAO usuarioDAO;
	private final Result result;
	private final Validator validator;
	private final UsuarioWeb usuarioWeb;
	
	public UsuarioController(Validator validator,Result r, UsuarioWeb usuarioWeb){
		
		this.validator = validator;
		this.result = r;
		this.usuarioWeb = usuarioWeb;
		
		SessionFactory factory = new CriadorDeSessionFactory().getInstance();
		Session session = new CriadorSession(factory).getInstance();
		
		this.usuarioDAO = new UsuarioDAO(session);
	}
	
//	@Restrito
//	@Get("/usuario/novo")
//	public void novo(){
//		
//	}
	
	@Restrito // Não deixar acessar os métodos do controller sem que haja um usuario logado
	@Post("/usuario")
	public void salvar(Usuario usuario){
		
		if(usuarioDAO.existeUsuario(usuario)){
			this.validator.add(new ValidationMessage("Login já existe", "usuario.login"));
		}
		validator.onErrorUsePageOf(IndexController.class).index();
	
		usuario = usuarioDAO.save(usuario);
		System.out.println("cadastrado");
		result.redirectTo(IndexController.class).index();		
	}
	
	@Restrito
	@Get("/usuario/{usuario.id}")
	public void remover(Usuario usuario){
		
		this.usuarioWeb.logout();
		this.usuarioDAO.remove(usuario);
		result.redirectTo(IndexController.class).index();
		
	}
	
//	@Delete("/usuario/{usuario.id}")
//	public void remover(Usuario usuario){
//		
//		this.usuarioDAO.remove(usuario);
//		result.redirectTo(IndexController.class).index();
//		
//	}
	
	@Restrito
	@Get("/usuario/{usuario.id}/exibir") // {usuario.id} instancia o objeto usuario, chama o setId e esse objeto é passo como parametro no metodo exibir
	public void exibir(Usuario usuario){

		usuario = usuarioDAO.loadById(usuario);
		
		result.include("usuario", usuario);
		
	}
	
	@Restrito
	@Get("/usuario/{usuario.id}/editar")
	public void editar(Usuario usuario){
		
		usuario = usuarioDAO.loadById(usuario);
		
		result.include("usuario", usuario);
	}
	
	@Restrito
	@Post("/usuario/atualizar") // {usuario.id} instancia o objeto usuario, chama o setId e esse objeto é passo como parametro no metodo exibir
	public void atualizar(Usuario usuario){
				
		this.usuarioDAO.update(usuario);
		
		usuarioWeb.logout();
		result.redirectTo(IndexController.class).index();
		
	}
//	@Get("/usuario/login")
//	public void loginForm(){
//		
//	}
	
	
	@Post("/login")
	public void login(Usuario usuario){
		
		Usuario carregado = usuarioDAO.carrega(usuario);
		if(carregado == null){
			validator.add(
					new ValidationMessage("Login e/ou senha inválidos",	"Login/Senha"));
		}
		validator.onErrorUsePageOf(IndexController.class)
			     .index();
		usuarioWeb.login(carregado);
		
		result.redirectTo(ProdutoController.class).listar();
	}
	
	@Restrito
	@Path("/logout")
	public void logout(){ 
		usuarioWeb.logout();
		result.redirectTo(IndexController.class).index();
	}
	
	
	
}

package esa_review.model;

import br.com.caelum.vraptor.ioc.Component;
import br.com.caelum.vraptor.ioc.SessionScoped;

@Component
@SessionScoped
public class UsuarioWeb {
	
	private Usuario logado;
	//private int usu_id_logado;
	
	public void login(Usuario usuario){
		this.logado = usuario;		
	}
	
	public String getNome(){
		
		return logado.getNome();
		
	}
	
	public int getUsu_id_logado(){
		
		return logado.getId();
		
	}
	
	public boolean isLogado(){
		
		return logado !=null;
	}

	public void logout() {
		this.logado = null;;
		
	}

}

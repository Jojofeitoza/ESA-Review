package esa_review.dao;

import br.com.caelum.vraptor.ioc.Component;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import esa_review.model.Usuario;


@Component
public class UsuarioDAO {
	
	private final Session session;

	public UsuarioDAO(Session session){
		this.session = session;
	}
		
	public Usuario save(Usuario usuario) {
		Transaction tx = session.beginTransaction();
		session.save(usuario);
		tx.commit();

		return usuario;
	}
	public Usuario loadById(Usuario usuario){
		
		return (Usuario) this.session.load(Usuario.class, usuario.getId());
		
	}
	public boolean existeUsuario(Usuario usuario){
		Usuario encontrado = (Usuario) session.createCriteria(Usuario.class)
				.add(Restrictions.eq("login", usuario.getLogin()))
				.uniqueResult();
		return  encontrado != null;
	}

	public Usuario carrega(Usuario usuario) {
		
		return (Usuario) session.createCriteria(Usuario.class)
				.add(Restrictions.eq("login", usuario.getLogin() ))
				.add(Restrictions.eq("senha", usuario.getSenha() ))
				.uniqueResult();
	}
	// não estar funcionando é preciso verificar e testar.
	public Usuario atualiza(Usuario usuario){
		Usuario novo = (Usuario) session.createCriteria(Usuario.class)
				.add(Restrictions.eq("login", usuario.getLogin() ))
				.add(Restrictions.eq("senha", usuario.getSenha() ))
				.uniqueResult();
		return novo;
		
	}
	
	public void update(Usuario usuario){
		
		Transaction tx = this.session.beginTransaction();
		this.session.update(usuario);
		tx.commit();
		
		
	}
	
	public void remove(Usuario usuario){
		
		Transaction tx = this.session.beginTransaction();
		this.session.delete(usuario);
		tx.commit();
		
	}

}

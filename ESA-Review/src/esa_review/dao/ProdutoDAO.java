package esa_review.dao;

import org.hibernate.Session;
import org.hibernate.Transaction;
import java.util.List;

import br.com.caelum.vraptor.ioc.Component;
import esa_review.model.Produto;

@Component
public class ProdutoDAO {

	private final Session session;

	public ProdutoDAO(Session session) {
		this.session = session;
	}

	public Produto save(Produto produto) {
		
		Transaction tx = this.session.beginTransaction();
		this.session.save(produto);
		tx.commit();

		return produto;
	}

	public Produto remove(Produto produto) {

		Transaction tx = this.session.beginTransaction();
		this.session.delete(produto);
		tx.commit();

		return produto;

	}

	@SuppressWarnings("unchecked")
	public List<Produto> listAll() {

		return this.session.createCriteria(Produto.class).list();
	}
	
	public void update(Produto produto){
		
		Transaction tx = this.session.beginTransaction();
		this.session.update(produto);
		tx.commit();
		
		
	}

	
	public Produto loadById(Produto produto) {
		
		
		/* retorna o objeto encontrado na linha do banco de dados. É bom ser usado caso já tenhamos certeza que aquele objeto está no banco. Ex: Editar produto
		 * 
		 */		
		//return (Produto) this.session.load(Produto.class, produto.getCodigo());
		
		/*retorna o objeto encontrado na linha do banco de dados. A diferença é que se estamos procurando alguém que não temos certeza de que está no banco esse método retorna null,
		 * já o load iria retornar ObjectNotFoundException.
		 * 
		 */
		return (Produto) this.session.get(Produto.class, produto.getCodigo());

	}
	
}

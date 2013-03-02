package esa_review.dao;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.hibernate.criterion.Order;

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

		return this.session.createCriteria(Produto.class).addOrder(Order.desc("id")).list();
	}
	
	@SuppressWarnings("unchecked")
	public List<Produto> list(int id_usu) {

		return this.session.createCriteria(Produto.class)
		.add(Restrictions.eq("usu_id", id_usu)).addOrder(Order.desc("id"))
		.list();
	}
	
	@SuppressWarnings("unchecked")
	public List<Produto> favorito(int id_usu) {

		return this.session.createCriteria(Produto.class)
		.add(Restrictions.eq("usu_id", id_usu)).addOrder(Order.desc("id"))
		.list();
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
		return (Produto) this.session.get(Produto.class, produto.getId());

	}
	
	public Produto loadById(int id) {
		
		
		/* retorna o objeto encontrado na linha do banco de dados. É bom ser usado caso já tenhamos certeza que aquele objeto está no banco. Ex: Editar produto
		 * 
		 */		
		//return (Produto) this.session.load(Produto.class, produto.getCodigo());
		
		/*retorna o objeto encontrado na linha do banco de dados. A diferença é que se estamos procurando alguém que não temos certeza de que está no banco esse método retorna null,
		 * já o load iria retornar ObjectNotFoundException.
		 * 
		 */
		return (Produto) this.session.get(Produto.class, id);

	}
	
	public Produto loadByCodigo(String cod) {
		
		Criteria select = session.createCriteria(Produto.class);  
		select.add(Restrictions.ge( "codigo", cod ));
		
		List<Produto> lis = select.list();
		
		Produto aux = null;
		for(Produto c : lis){
			aux = c;
		}
		
		return aux;
		//return (Produto) this.session.createCriteria(Produto.class).add(Restrictions.ge("codigo", cod)).setMaxResults(1).uniqueResult();

	}
	/*
    public List<Produto> buscar(String nome) {
		
		return this.session.createCriteria(Produto.class)
				.add(Restrictions.ilike("nome", nome, MatchMode.ANYWHERE))
				.list();
	}*/
	@SuppressWarnings("unchecked")

	 public List<Produto> busca(String nome){

		

		return this.session.createCriteria(Produto.class)

				 .add(Restrictions.ilike("nome", nome, MatchMode.ANYWHERE))

				.addOrder(Order.desc("id"))

				 .list();

		

	}



	
}

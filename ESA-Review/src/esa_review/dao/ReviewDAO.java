package esa_review.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import br.com.caelum.vraptor.ioc.Component;
import esa_review.model.Produto;
import esa_review.model.Review;

@Component
public class ReviewDAO {
	private final Session session;

	public ReviewDAO(Session session) {
		this.session = session;
	}

	public Review save(Review review) {
		
		Transaction tx = this.session.beginTransaction();
		this.session.save(review);
		tx.commit();

		return review;
	}

	public Review remove(Review review) {

		Transaction tx = this.session.beginTransaction();
		this.session.delete(review);
		tx.commit();

		return review;

	}

	@SuppressWarnings("unchecked")
	public List<Review> listAll() {		

		
		//select * from review where prod_id='20' order by rev_id desc limit 1
		return this.session.createCriteria(Review.class)				
				.addOrder(Order.desc("id"))				
				.list();
		
		/*//pega todos os registros inserido com prod_id 20 ordena decrescente e me devolve s� somente um registro
		return this.session.createCriteria(Review.class)
				.add(Restrictions.eq("prod_id", 20 ))
				.addOrder(Order.desc("id")).setMaxResults(1).list();*/
	}
	
	@SuppressWarnings("unchecked")
	public List<Review> list(int id_usu) {

		return this.session.createCriteria(Review.class)
		.add(Restrictions.eq("usu_id", id_usu)).addOrder(Order.desc("id"))
		.list();
	}
	
	public void update(Review review){
		
		Transaction tx = this.session.beginTransaction();
		this.session.update(review);
		tx.commit();
		
		
	}

	
	public Review loadById(Review review) {
		
		
		/* retorna o objeto encontrado na linha do banco de dados. � bom ser usado caso j� tenhamos certeza que aquele objeto est� no banco. Ex: Editar produto
		 * 
		 */		
		//return (Produto) this.session.load(Produto.class, produto.getCodigo());
		
		/*retorna o objeto encontrado na linha do banco de dados. A diferen�a � que se estamos procurando algu�m que n�o temos certeza de que est� no banco esse m�todo retorna null,
		 * j� o load iria retornar ObjectNotFoundException.
		 * 
		 */
		return (Review) this.session.get(Review.class, review.getId());

	}
	
}



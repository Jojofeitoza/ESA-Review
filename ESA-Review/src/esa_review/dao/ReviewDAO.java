package esa_review.dao;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
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

		return this.session.createCriteria(Review.class).list();
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



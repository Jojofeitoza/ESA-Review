package esa_review.dao;

import java.util.Collection;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import br.com.caelum.vraptor.ioc.Component;

import esa_review.model.Comentario;
import esa_review.model.Review;

@Component
public class ComentarioDAO {
	
	private final Session session;

	public ComentarioDAO(Session session) {
		this.session = session;
	}

	public Comentario save(Comentario comentario) {
		
		Transaction tx = this.session.beginTransaction();
		this.session.save(comentario);
		tx.commit();

		return comentario;
	}
	
	public Long quantComentario(Review review){

		return (Long) this.session.createCriteria(Comentario.class)
				.add(Restrictions.eq("rev_id", review.getId()))
				.setProjection(Projections.rowCount()).uniqueResult();
	}

	@SuppressWarnings("unchecked")
	public Collection<Comentario> list(int id_rev) {
		
		return this.session.createCriteria(Comentario.class)
				.add(Restrictions.eq("rev_id", id_rev)).addOrder(Order.desc("id"))
				.list();
	}

}

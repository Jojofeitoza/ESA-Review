package esa_review.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import br.com.caelum.vraptor.ioc.Component;
import br.com.caelum.vraptor.ioc.ComponentFactory;

@Component
public class CriadorSession implements ComponentFactory<Session> {

	private final SessionFactory factory;

	public CriadorSession(SessionFactory factory) {
		this.factory = factory;
	}

	public Session getInstance() {
		Session session = factory.openSession();
		return session;
	}

}

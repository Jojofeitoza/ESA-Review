package esa_review.dao;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

import br.com.caelum.vraptor.ioc.ApplicationScoped;
import br.com.caelum.vraptor.ioc.Component;
import br.com.caelum.vraptor.ioc.ComponentFactory;

@Component
@ApplicationScoped
public class CriadorDeSessionFactory implements	ComponentFactory<SessionFactory> {

	public SessionFactory getInstance() {
		Configuration configuration = new Configuration();
		configuration.configure();
		
		
		ServiceRegistry serviceRegistry = new ServiceRegistryBuilder().applySettings(configuration.getProperties()).buildServiceRegistry();         
	   
		
		SessionFactory factory = configuration.configure().buildSessionFactory(serviceRegistry);
		return factory;
	}

}

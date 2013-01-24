package esa_review.controller;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import esa_review.dao.CriadorDeSessionFactory;
import esa_review.dao.CriadorSession;

import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Result;

public class SobreController {
	
	private final Result result;

	String parametro   =" SOBRE ESTE REVIEW DE PRODUTOS";
	
	
	public SobreController(Result result){
		this.result = result;
		SessionFactory factory = new CriadorDeSessionFactory().getInstance();
		Session session = new CriadorSession(factory).getInstance();
		
	}
	@Get("/sobre/sobre")
	public void sobre(){
		result.include("sobre", parametro);
	}

}

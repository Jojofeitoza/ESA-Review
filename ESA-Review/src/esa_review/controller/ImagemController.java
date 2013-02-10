package esa_review.controller;

import imagens.Imagens;

import java.io.File;

import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.interceptor.multipart.UploadedFile;

@Resource
public class ImagemController {

	private final Result result;	
	private final Imagens imagens;

	public ImagemController(Imagens imagens, Result result) {		
		this.imagens = imagens;
		this.result = result;
	}

	@Get("/imagem/{id}/alterar")//poder ser qualquer nome: /imagem/{codigo/alt}	// {codigo} codigo é uma variavel que ira armazenar o valor vindo via get da pagina listar.jsp(<a href=.../imagem/${produto.codigo}" ...)
	
	public void alterar(int id) {

		this.result.include("id_", id);// se eu não colocar o redirectTo ele
											// redireciona para alterar.jsp

	}

	@Post("/imagem/{id}") // variavel codigo pode ser qualquer outro nome e o parametro do metodo upload tem que ser igual a essa variavel
	public void upload(final UploadedFile imagem, int id) {		
		
		System.out.println(id);
		
		imagens.salva(imagem, id);		

		this.result.redirectTo(ProdutoController.class).listar(); //aqui tenho que mudar para ele ir para pagina exibir.jsp, que vai exibir somento o produto

	}
	
	@Get("/imagem/{id}")
	public File download(int id) {
		
		return imagens.mostra(id);
	}
}

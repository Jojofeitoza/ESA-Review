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

	@Get("/imagem/{codigo}/alterar")//poder ser qualquer nome: /imagem/{codigo/alt}	// {codigo} codigo é uma variavel que ira armazenar o valor vindo via get da pagina listar.jsp(<a href=.../imagem/${produto.codigo}" ...)
	
	public void alterar(int codigo) {

		this.result.include("id_", codigo);// se eu não colocar o redirectTo ele
											// redireciona para alterar.jsp

	}

	@Post("/imagem/{codigo}") // variavel codigo pode ser qualquer outro nome e o parametro do metodo upload tem que ser igual a essa variavel
	public void upload(final UploadedFile imagem, int codigo) {		
		
		imagens.salva(imagem, codigo);		

		this.result.redirectTo(ProdutoController.class).listar(); //aqui tenho que mudar para ele ir para pagina exibir.jsp, que vai exibir somento o produto

	}
	
	@Get("/imagem/{codigo}")
	public File download(int codigo) {
		
		return imagens.mostra(codigo);
	}
}

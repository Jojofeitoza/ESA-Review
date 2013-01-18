package imagens;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.ServletContext;

import org.apache.commons.io.IOUtils;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import esa_review.dao.CriadorDeSessionFactory;
import esa_review.dao.CriadorSession;
import esa_review.model.Produto;
import esa_review.model.Usuario;


import br.com.caelum.vraptor.interceptor.multipart.UploadedFile;
import br.com.caelum.vraptor.ioc.Component;


@Component
public class Imagens {

	private final Session session;
	private File pastaIMG;
	private Produto p;

	public Imagens(ServletContext context) {
		
		//Criando a session para acessar os dados do banco de dados
		SessionFactory factory = new CriadorDeSessionFactory().getInstance();
		Session session = new CriadorSession(factory).getInstance();
		this.session = session;
		
		
		//System.out.println(">>>>"+context.getContextPath());
		
		String caminhoImagens = context.getRealPath("/WEB-INF/imagens/");		
		//String caminho = System.getProperty("user.home"); // pega a pasta do usuario do systema:"C:\Documents and Settings\Vinicius"
		pastaIMG = new File(caminhoImagens).getAbsoluteFile();
		pastaIMG.mkdir();
	}

	public void salva(UploadedFile imagem, int id_) {
		
		this.p = loadByIdProd(id_);
		
		//File destino = new File(pastaIMG, p.getNome() + "_"+ id_ + ".jpg"); salva a imagem como: nome_id.jpg
		File destino = new File(pastaIMG, id_ + ".jpg");
		try {
			IOUtils.copy(imagem.getFile(), new FileOutputStream(destino));
		} catch (IOException e) {
			throw new RuntimeException("Erro ao copiar imagem", e);
		}
	}
	
	public File mostra(int id_) {
		
		this.p = loadByIdProd(id_);
		
		//File file = new File(pastaIMG, p.getNome() + "_" + id_ + ".jpg"); recupera a imagem como: nome_id.jpg
		File file = new File(pastaIMG, id_ + ".jpg");		
		
		return ( file.exists() ? file : new File(pastaIMG, "default_image.gif"));
	}
	
	public Produto loadByIdProd(int codigo) {
		return (Produto) this.session.load(Produto.class, String.valueOf(codigo));
	}
	
	public Usuario loadByIdUser(int id) {
		return (Usuario) this.session.load(Usuario.class, id);
	}

}

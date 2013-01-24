<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css" >
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/estilos.css" media="screen" title="Freshy">
     	
	<title>ESA-Review | Contact-nos</title>
</head>
<body>
		
	<div id='cssmenu'>
		<ul>
  		    <li class='active'><a href='${pageContext.request.contextPath}/'><span>Início</span></a></li> 
            <li class='has-sub'><a href='#'><span>Usuário</span></a>
               <ul>
                  <li class='has-sub'><a href='#'><span>Editar perfil</span></a>      
                  </li>      
                  <li class='has-sub'><a href='#'><span>Excluir conta</span></a>         
                  </li>
               </ul>    
           </li> 
           <li class='has-sub'><a href='#'><span>Produtos</span></a>
              <ul>
                 <li class='has-sub'><a href='${pageContext.request.contextPath}/produto/novo'><span>Cadastrar Produtos</span></a>         
                 </li>      
                <li class='has-sub'><a href='${pageContext.request.contextPath}/produto'><span>Listar Produtos</span></a>        
                </li>
             </ul>    
          </li> 
   		 <li><a href='${pageContext.request.contextPath}/sobre/sobre'><span>Sobre</span></a></li>
         <li><a href='${pageContext.request.contextPath}/contato/contato'><span>Contact-nos</span></a></li>
      </ul>
    </div>	
	
	<h1>${contato}</h1>
	
	 <CENTER>
	 <font color="BLUE">
		<p>E-mails para contactar a equipe de desenvolvedores. Sugestões.<br>
		<p>Contribua com a melhoria do Site. Outras Informações.<br>
		<br>
	</font>
	<font color="RED">
		
		<p>caio.cezar@dce.ufpb.br<br>
		<p>joelson.feitosa@dce.ufpb.br<br>
		<p>jpaulo.dantas@dce.ufpb.br<br>
		<p>luiz.silva@dce.ufpb.br<br>
		<p>vinicius.alencar@dce.ufpb.br<br>
		<p>vitor.demetrio@dce.ufpb.br<br>
		<p>wellison.paula@dce.ufpb.br<br>
		
	</font>
		
	
	 
	
</body>
</html>
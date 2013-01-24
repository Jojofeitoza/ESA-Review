<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Date;" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css" >
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/estilos.css" media="screen" title="Freshy">
     	 
	<title>ESA-Review | Sobre</title>
	
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
	
	<h1>${sobre}</h1>
	
	 <CENTER>
	 <font color="BLUE">
		<p>ESTE SERVIÇO WEB TEM POR OBJETIVO OFERECER UM<br>
		<p>REVIEW DE PRODUTOS, ONDE PODEM SER CADASTRADOS<br>
		<p>NOVOS PRODUTOS E POSTADOS COMENTÁRIOS SOBRE OS MESMOS.<br>
		
	</font>
	 </CENTER>	
	    <p>O USUÁRIO PODE EXERCER AS SEGUINTES ATIVIDADES:<br>
		<li>CADSTRAR PRODUTOS;</li><br>
		<li>LISTAR PRODUTOS QUE ESTÃO CADASTRADOS;</li><br>
		<li>ATUALIZAR DADOS DOS PRODUTOS;</li><br>
		<li>CADASTRAR-SE PARA UTILIZAR OS SERVIÇOS;</li><br>
		<li>EXCLUIR SUA CONTA NO SERVIÇO;</li><br>
		<li>COMPARTILHAR ATRAVÉS DE REDES SOCIAIS;</li><br>
		<li>E MAIS...</li><br>
	
		<p>INÍCO DO PROJETO: 12/2013.<br>
		
	
	
		
</body>
</html>
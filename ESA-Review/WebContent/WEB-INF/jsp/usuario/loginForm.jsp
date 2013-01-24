<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" type="text/css" 
		  href="${pageContext.request.contextPath}/css/styles.css" >
	<link rel="stylesheet" type="text/css" 
		  href="${pageContext.request.contextPath}/css/estilos.css"  
     	  media="screen" title="Freshy">
	<title>Insert title here</title>
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
	

	<center>
	<form action="${pageContext.request.contextPath}/login" method="POST" enctype="multipart/form-data" >
		<fieldset>
			<legend>Efetue o login</legend>			
			<label for="login">Login:</label>			
 			<input id="login" class="required" 
 				   type="text" name="usuario.login"/><br/>
 			<label for="senha">Senha:</label>			
 			<input id="senha" class="required" 
 				   type="password" name="usuario.senha"/><br/>
			<button type="submit">Login</button>		
		</fieldset>
		</form>
	</center>
</body>
</html>
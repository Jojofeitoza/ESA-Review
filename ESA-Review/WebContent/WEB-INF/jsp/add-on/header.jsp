<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>ESA-Review - Produto</title>
		
		<link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" type="text/css">
		
	</head>
<body>
				
		<div id='topo' >			
			<p style="text-align: center;"> <img alt="" src="${pageContext.request.contextPath}/img/logo.jpeg"> </p>
			<p style="text-align: center;">Bem vindo ao Sistema de Review de Produtos</p>
			
		</div>
		
		
		<div style="margin-right: 100px">
			<c:if test="${usuarioWeb.logado}">
		  			Você está logado como: ${usuarioWeb.nome}
		  			<a href='${pageContext.request.contextPath}/logout' ><button class="btn" type="submit">Logout</button></a>
		  	</c:if>
		</div>
		
		
		<c:if test="${usuarioWeb.logado}">		
		
		<div id='cssmenu' style="float: left;margin-right: 20px;">
		
		<ul>
		   <li class='active '><a href='${pageContext.request.contextPath}/'><span>n&iacute;cio</span></a></li>
		   		   
		   <li class='has-sub'><a href='#'><span>Usuário</span></a>
               <ul>
               	  <li><a href='${pageContext.request.contextPath}/exibir'><span>Exibir perfil</span></a>
               	  </li>
                  <li><a href='${pageContext.request.contextPath}/usuario/${usuarioWeb.usu_id_logado}/editar'><span>Editar perfil</span></a>      
                  </li>      
                  <li><a href='${pageContext.request.contextPath}/usuario/${usuarioWeb.usu_id_logado}'><span>Excluir conta</span></a>         
                  </li>
                  
                  <li>
                  	<a href="#">Alterar Senha</a>
                  </li>
               </ul>    
           </li> 
           
		   <li class='has-sub'><a href='#'><span>Produtos</span></a>
		   		<ul>
                  <li>
                  	<a href='${pageContext.request.contextPath}/produto/novo'><span>Novo Produto</span></a>
                  </li>
           		</ul>
           		
           		<ul>
                  <li>
                  	<a href='${pageContext.request.contextPath}/produto'><span>Listar Produtos</span></a>
                  </li>
           		</ul>
		   </li>
		   
		   
           <li>
           	<a href='${pageContext.request.contextPath}/sobre'><span>Sobre</span></a>
           </li>
           
           <li>
           	<a href='${pageContext.request.contextPath}/Contato'><span>Contato</span></a>
           </li>
           
		   
		 </ul>
		   		
		</div>
		</c:if>
		
<!-- 		Imprime os erros que são capturados depois da tentativa de validação usando a classe Validator -->
		<div id="erros">
			<ul>
				<c:forEach items="${errors}" var="error">
				<li>${error.category } - ${error.message }</li>
			</c:forEach>
			</ul>
		</div>
<!-- fim -->
		
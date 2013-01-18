<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>ESA-Review - Produto</title>
		
	</head>
</head>
	<body>
			
	
		<link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" type="text/css">
		
		<div id='topo'>
			<h1>Review de Produtos</h1>
			
		</div>
		


		
		
		<div id='cssmenu' style="float: left;margin-right: 20px;">
		<ul>
		   <li class='active '><a href='${pageContext.request.contextPath}/'><span>n&iacute;cio</span></a></li>
		   <li><a href='${pageContext.request.contextPath}/usuario'><span>Usu&aacute;rios</span></a></li>
		   <li><a href='${pageContext.request.contextPath}/usuario/novo'><span>Novo Usu&aacute;rio</span></a></li>
		   <li><a href='${pageContext.request.contextPath}/produto'><span>Produtos</span></a></li>
		   <li><a href='${pageContext.request.contextPath}/produto/novo'><span>Novo Produto</span></a></li>
		</ul>
		</div>
		
<!-- 		Imprime os erros que são capturados depois da tentativa de validação usando a classe Validator -->
		<div id="erros">
			<ul>
				<c:forEach items="${errors}" var="error">
				<li>${error.category } - ${error.message }</li>
			</c:forEach>
			</ul>
		</div>
<!-- fim -->
		
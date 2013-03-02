<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%-- formata o numero exibindo até os zeros decimais --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
 
<jsp:include page="../add-on/header.jsp" />


<div class="colleft" >

<fieldset>

	<legend>Lista de Produtos</legend>
	
	
	<c:forEach items="${errors}" var="error">
		<p style="font-size: 14px;color:red;font-weight:bold;margin-top: -30px;">${error.message }</p>
	</c:forEach>
	
	<div>
		<form action="${pageContext.request.contextPath}/produto/busca" method="get">
			<input type="text" name="produto.nome" />						 
			<input type="submit" value="Buscar" class="btn"/>
		</form>
	</div>
	
	
	<table class="table table-bordered table-condensed " >
		<tr style="background: #87CEFF; font-size: 15px"  >
			<td>Foto</td>
			<td >Nome</td>
			<td>Descrição</td>
			<td>Preco(R$)</td>
			
			<c:if test="${not empty produtoList}">
				<td></td>
				<td></td>
			
			</c:if>
			
		</tr>
		
		<c:forEach items="${produtoList}" var="produto">
			<tr>
				<td>
					<a href="${pageContext.request.contextPath}/imagem/${produto.id}/alterar" title="Alterar imagem"> 
						<img src="${pageContext.request.contextPath}/imagem/${produto.id}"style="width: 60px; height: 60px" border="0" class="img-rounded" />
					</a>
				</td>

				<td>${produto.nome}</td>
				<td>${produto.descri}</td>
				<!-- formata o numero exibindo até os zeros decimais  -->
				<fmt:setLocale value="pt-BR" />
				<td><fmt:formatNumber value="${produto.preco}" pattern="#,###.00" maxFractionDigits="2" minIntegerDigits="1"/></td>
				
				<td>
				
				<!-- Testar usando essa form : <a href='${pageContext.request.contextPath}/logout' ><button class="btn" type="submit">Logout</button></a> -->
				<form action="${pageContext.request.contextPath}/produto/${produto.id}/exibir" method="get">
						<input type="submit" value="Exibir" class="btn" />
					</form>
				</td>
				
				<!--
				<c:if test="${produto.usu_id == usuarioWeb.id}">
				
				caso não de certo, deve-se copiar essa pagina e colar em meusprodutos e depois apagar editar e remover desta pagina
				<td>				
					<form action="${pageContext.request.contextPath}/produto/${produto.id}/editar" method="get">
						<input type="submit" value="Editar" class="btn" />
					</form>
				</td>
				</c:if>
				

				<td><form action="${pageContext.request.contextPath}/produto/${produto.id}" method="post">
						<input type="hidden" name="_method" value="DELETE" /> 
						<input type="submit" value="Remover" class="btn"/>
					</form></td>
					-->
				<td><form action="${pageContext.request.contextPath}/review/novo" method="get">
						<input type="hidden" name="prod_id" value="${produto.id}" />						 
						<input type="submit" value="Review" class="btn"/>
					</form>
				</td>

			</tr>
			


		</c:forEach>
	</table>
</fieldset>
</div>
<jsp:include page="../add-on/footer.jsp" />

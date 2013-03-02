<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%-- formata o numero exibindo até os zeros decimais --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
 
<jsp:include page="../add-on/header.jsp" />


<div class="colleft" style="width: 1000px;">

<fieldset>

	<legend>Produtos</legend>

	<table class="table table-bordered table-condensed" style="width: 100%" >
		<tr style="background: #87CEFF;" >
			<td>Foto</td>
			<td >Nome</td>
			<td>Descrição</td>
			<td>Preco(R$)</td>
			
			<c:if test="${not empty produtoList}">
				<td></td>
				<td></td>
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
				<form action="${pageContext.request.contextPath}/produto/${produto.id}/exibir"	method="get">
						<input type="submit" value="Exibir" class="btn" />
					</form>
				</td>
				<td>				
					<form action="${pageContext.request.contextPath}/produto/${produto.id}/editar" method="get">
						<input type="hidden" name="produto.usu_id" value="${usuarioWeb.id}" />
						<input type="submit" value="Editar" class="btn" />
					</form>
				</td>

				<td>
					<form action="${pageContext.request.contextPath}/produto/${produto.id}" method="post">
						<input type="hidden" name="_method" value="DELETE" />
						<input type="hidden" name="produto.usu_id" value="${usuarioWeb.id}" /> 
						<input type="submit" value="Remover" class="btn"/>
					</form></td>
					
				<td>
					<form action="${pageContext.request.contextPath}/review/novo" method="get">
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
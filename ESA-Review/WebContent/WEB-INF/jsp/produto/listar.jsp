<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="../add-on/header.jsp" />

<fieldset style="width: 530px;">

	<legend>Lista de Produtos</legend>

	<table class="table table-bordered table-condensed table-hover" >
		<tr>
			<td>Foto</td>
			<td>Nome</td>
			<td>Descrição</td>
			<td>Preco</td>

		</tr>
		<c:forEach items="${produtoList}" var="produto">
			<tr>

				<td>
					<a href="${pageContext.request.contextPath}/imagem/${produto.codigo}/alterar" title="Alterar imagem"> 
						<img src="${pageContext.request.contextPath}/imagem/${produto.codigo}"style="width: 60px; height: 60px" border="0" class="img-rounded" />
					</a>
				</td>



				<td>${produto.nome}</td>
				<td>${produto.descri}</td>
				<td>${produto.preco}</td>




				<td><form action="${pageContext.request.contextPath}/produto/${produto.codigo}/exibir"	method="get">
						<input type="submit" value="exibir" class="btn" />
					</form>
				</td>

				<td>
					<form action="${pageContext.request.contextPath}/produto/${produto.codigo}/editar" method="get">
						<input type="submit" value="editar" class="btn" />
					</form>
				</td>

				<td><form action="${pageContext.request.contextPath}/produto/${produto.codigo}" method="post">
						<input type="hidden" name="_method" value="DELETE" /> 
						<input type="submit" value="remover" class="btn"/>
					</form></td>

			</tr>
			<br />


		</c:forEach>
	</table>
</fieldset>
<jsp:include page="../add-on/footer.jsp" />

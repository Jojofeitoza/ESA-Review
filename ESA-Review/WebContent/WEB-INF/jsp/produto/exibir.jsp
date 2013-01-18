<jsp:include page="../add-on/header.jsp" />


<fieldset style="width: 530px;">
	<legend>Produto</legend>


	<table class="table table-bordered table-condensed table-hover">
		<tr>
			<td>
				<img src="${pageContext.request.contextPath}/imagem/${produto.codigo}" style="width: 199px; height: 200px" border="0" />
			</td>



			<td>${produto.nome}</td>
			<td>${produto.descri}</td>
			<td>${produto.preco}</td>

			<td>
				<form action="${pageContext.request.contextPath}/produto/${produto.codigo}/editar" method="get">
					<input type="submit" value="editar" class="btn"/>
				</form>
			</td>

			<td><form action="${pageContext.request.contextPath}/produto/${produto.codigo}" method="post">
					<input type="hidden" name="_method"/> 
					<input type="submit" value="remover" class="btn"/>
				</form></td>

		</tr>
	</table>
</fieldset>
<jsp:include page="../add-on/footer.jsp" />

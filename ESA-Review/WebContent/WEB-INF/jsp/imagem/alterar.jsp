<jsp:include page="../add-on/header.jsp" />

<fieldset style="width: 390px;">

	<form action="${pageContext.request.contextPath}/imagem/${id_}" method="POST" enctype="multipart/form-data">

		<legend>Upload de Imagem</legend>

		<input type="file" name="imagem" />
		<button type="submit" class="btn">Enviar</button>

	</form>
</fieldset>

<jsp:include page="../add-on/footer.jsp" />

<jsp:include page="../add-on/header.jsp"/> 

		
		<fieldset style="width: 390px;">
			<legend>Produto</legend>


			<form class="form-horizontal well" action="${pageContext.request.contextPath}/produto" method="post" >
			
				<label> C&oacute;digo: </label>			
 				<input type="text" name="produto.codigo" value="${produto.codigo}" /> <br/>
 				
				<label>Nome:</label>
				<input type="text" name="produto.nome" value="${produto.nome}"/> <br/>

				<label>Descri&ccedil;&acirc;o:</label>				
				<textarea rows="" cols="" name="produto.descri">${produto.descri}</textarea><br/>
				

				<label>Pre&ccedil;o:</label>
				<input type="text" name="produto.preco" value="${produto.preco}"/> <br/>				

				<input type="submit" value="salvar" class="btn"/>
			</form>
			
		</fieldset>
		
<jsp:include page="../add-on/footer.jsp"/> 
		
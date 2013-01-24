<jsp:include page="../add-on/header.jsp"></jsp:include>

		<fieldset style="width: 390px;">
		
			<legend>Editar perfil</legend>

			<form class="form-horizontal well" action="${pageContext.request.contextPath}/usuario/atualizar" method="post">
			
				<input type="hidden" name="usuario.id" value="${usuario.id}"/><br/>
				<input type="hidden" name="usuario.senha" value="${usuario.senha}"/>
			
				<label for="nome">Nome:</label>			
	 			<input id="nome" class="required" type="text" name="usuario.nome" value="${usuario.nome}" onblur="validaNome()"/><br/>
	 			
	 			<label for="login">Login:</label>			
	 			<input id="login" class="required" type="text" name="usuario.login" value="${usuario.login}"onblur="login()"/><br/>
	 			
	 			<label for="email">E_mail:</label>			
	 			<input id="email" class="required" type="text" name="usuario.e_mail" value="${usuario.e_mail}" onblur="validaEmail()"/><br/>
	 		
				
				<input class="btn btn-primary" type="submit" value="Atualizar"/>
				
				<input class="btn btn-primary" type="reset" value="Limpar"/><br>
				
			</form>
		</fieldset>




<jsp:include page="../add-on/footer.jsp"></jsp:include>
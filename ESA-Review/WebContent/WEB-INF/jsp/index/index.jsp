<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<jsp:include page="../add-on/header.jsp"/> 
		
		
		
<!-- 		Falta colocar os js que estão no arquivo atualizar.jsp -->
		
		
		
		
		<c:if test="${empty usuarioWeb.logado or not usuarioWeb.logado}">
		
			<div>		
			<form  action="${pageContext.request.contextPath}/login" method="POST" enctype="multipart/form-data"  class="formlogin">
				<input type="text" name="usuario.login" value="login" onBlur="if(this.value == '') this.value = 'login'" onFocus="if(this.value == 'login') this.value = ''">
				<br>
				<input type="password" name="usuario.senha" value="senha" onBlur="if(this.value == '') this.value = 'senha'" onFocus="if(this.value == 'senha') this.value = ''">
				<br>
				<input type="submit" name="botao" value="Acessar" class="btn btn-primary">
			</form>
			</div>
			
			<div>
			<fieldset style="width: 390px;" >
				<form class="formlogin" action="${pageContext.request.contextPath}/usuario" method="post" >
				
					
		 			<label for="nome">Nome:</label>			
		 			<input id="nome" class="required" type="text" name="usuario.nome" value="${usuario.nome}" onblur="validaNome()"/><br/>
		 			
		 			<label for="login">Login:</label>			
		 			<input id="login" class="required" type="text" name="usuario.login" value="${usuario.login}"onblur="login()"/><br/>
		 			
		 			<label for="senha">Senha:</label>			
		 			<input id="senha" class="required" type="password" name="usuario.senha" value="" onblur="senha()"/><br/>
		 			
		 			<label for="confirma">Confirma senha:</label>			
		 			<input id="confirma" equalTo="#senha" type="password"/><br/>
		 			
		 			<label for="email">E_mail:</label>			
		 			<input id="email" class="required" type="text" name="usuario.e_mail" value="${usuario.e_mail}" onblur="validaEmail()"/><br/>
		 		
					
					<input class="btn btn-primary" type="submit" value="Cadastre-se"/>
					<input class="btn btn-primary" type="reset" value="Limpar"/><br>
					
				</form>
			</fieldset>
			</div>
		</c:if>
		
			
		
		
		
			
<jsp:include page="../add-on/footer.jsp"/> 
		
		
<jsp:include page="../add-on/header.jsp"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 


		<!-- JSTL - seto uma variavel para que vai receber um valor  -->
		<c:set var="review_id" value="${rv_id}" />		

		<fieldset style="width: 390px;">
		
			<legend>Novo Coment&aacute;rio </legend>

			<form class="form-horizontal well" action="${pageContext.request.contextPath}/comentario" method="post" >				
				<input type="hidden" name="comentario.usu_id" value="${usuarioWeb.id}" />
				<input type="hidden" name="comentario.rev_id" value="${review_id}" />
				<input type="hidden" name="comentario.dono" value="${usuarioWeb.nome}" />
				
				<label>Coment&aacute;rio</label>				
				<textarea rows="" cols="" name="comentario.comentario" 
				          maxlength="300"
					      style="width: 350px;"
				          size="40"
				          title="Informe seu seu texto neste campo! Tamanho máximo:300 caracteres!"
						  onmouseover="this.style.backgroundColor = 'yellow';"
						  onmouseout ="this.style.backgroundColor = 'white';">					
				</textarea><br/>
				          
				</textarea><br/>							
 				
 				
				<input type="submit" value="Salvar" class="btn"/>
				
			</form>
			
		</fieldset>
		
<jsp:include page="../add-on/footer.jsp"/> 
		
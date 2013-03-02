<jsp:include page="../add-on/header.jsp"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 


		<!-- JSTL - seto uma variavel para que vai receber um valor  -->
		<c:set var="produto_id" value="${prod_id}" />

		<fieldset style="width: 390px;">
		
			<legend>Novo Review</legend>

			<form class="form-horizontal well" action="${pageContext.request.contextPath}/review" method="post" >				
				<input type="hidden" name="review.usu_id" value="${usuarioWeb.id}" />
				<input type="hidden" name="review.prod_id" value="${produto_id}" />
				<input type="hidden" name="review.dono" value="${usuarioWeb.nome}" />
				
				<label>Descricao:</label>				
				<textarea rows="5" cols="40" name="review.descricao" 
				          maxlength="300"
				          style="width: 350px;"
				          size="40"
				          title="Informe seu seu texto neste campo! Tamanho máximo:300 caracteres!"
						  onmouseover="this.style.backgroundColor = 'yellow';"
						  onmouseout ="this.style.backgroundColor = 'white';">					
				</textarea><br/>						
 				
 				
				<input type="submit" value="Salvar" class="btn"/>
				
			</form>
			
		</fieldset>
		
<jsp:include page="../add-on/footer.jsp"/> 
		
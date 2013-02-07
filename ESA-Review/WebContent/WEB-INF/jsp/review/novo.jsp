<jsp:include page="../add-on/header.jsp"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 


		<!-- JSTL - seto uma variavel para que vai receber um valor  -->
		<c:set var="produto_id" value="${prod_id}" />

		<fieldset style="width: 390px;">
		
			<legend>Novo Review</legend>

			<form class="form-horizontal well" action="${pageContext.request.contextPath}/review" method="post" >				
				<input type="hidden" name="review.usu_id" value="${usuarioWeb.id}" />
				<input type="hidden" name="review.prod_id" value="${produto_id}" />
				
				<!-- ou posso usar direto sem usar a variavel produto_id 
				<!-- modificado -->
				
				<input type="hidden" name="review.prod_id" value="${prod_id}" /> ( prod_id está vindo lá do métod novo() da classe ReviewController)
				
				-->
	
				<label>Descricao:</label>				
				<textarea rows="" cols="" name="review.descricao"></textarea><br/>							
 				
 				
				<input type="submit" value="Salvar" class="btn"/>
				
			</form>
			
		</fieldset>
		
<jsp:include page="../add-on/footer.jsp"/> 
		
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="../add-on/header.jsp" />

<div class="colleft" style="width: 1000px;">


<fieldset>

	<legend>Reviews</legend>

	<table class="table table-bordered table-condensed table-hover" style="width: 100%" >
		<tr>
			
			<td>Produto</td>
			<td>Review</td>
			

		
		</tr>
			
		 <c:forEach items="${reviewList}" var="review">
		 
		  <c:forEach items="${produtoList}" var="produto">
			
			<c:if test="${review.prod_id eq produto.id }">
			
			 <tr>
				<td>
					
					
					<img src="${pageContext.request.contextPath}/imagem/${review.prod_id}"style="width: 60px; height: 60px" border="0" class="img-rounded" />
					<br>			
					Código:${review.prod_id}<br>				
					Nome:${produto.nome}<br>	
					Preço:${produto.preco}<br>	
					Descrição:${produto.descri}
					
				</td>				
				<td>${review.descricao}
				<font color="red"><br>voto</font>
				</td>
							
				<%-- <td>${review.usu_id}</td> --%>
		   		
			 </tr>		
		   </c:if>	
		 </c:forEach>
	   </c:forEach>
	</table>
</fieldset>
</div>
<jsp:include page="../add-on/footer.jsp" />
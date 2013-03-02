<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="../add-on/header.jsp" />

<div class="colleft" style="width: 1000px;" >

<fieldset>

	<legend>Reviews</legend>

	<table class="table table-bordered table-condensed table-hover" >
		<tr style="background: #87CEFF; font-size: 15px"" >
			
			<td>Produto</td>
			<td>Descrição</td>
						
			<c:if test="${not empty reviewList}">
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			
			</c:if>

		</tr>
		<c:forEach items="${reviewList}" var="review">
			<tr>

				<td>
				 
					<img src="${pageContext.request.contextPath}/imagem/${review.prod_id}"style="width: 60px; height: 60px" border="0" class="img-rounded" />
					
				</td>

				
				<td>${review.descricao}</td>
				
				<td>
				<form action="${pageContext.request.contextPath}/review/${review.id}/exibir" method="get">
						<input type="submit" value="Exibir" class="btn" />
					</form>
				</td>
				
				<td>				
					<form action="${pageContext.request.contextPath}/review/${review.id}/editar" method="get">
						<input type="submit" value="Comentar" class="btn" />
					</form>
				</td>
				
				<td>				
					<form action="${pageContext.request.contextPath}/review/${review.id}/editar" method="get">
						<input type="button" value="Editar" class="btn" />
					</form>
				</td>
				
				<td><form action="${pageContext.request.contextPath}/review/${review.id}" method="post">
						<input type="hidden" name="_method" value="DELETE" /> 
						<input type="button" value="Remover" class="btn"/>
					</form></td>
				
				
			
			</tr>
			


		</c:forEach>
	</table>
</fieldset>
</div>
<jsp:include page="../add-on/footer.jsp" />

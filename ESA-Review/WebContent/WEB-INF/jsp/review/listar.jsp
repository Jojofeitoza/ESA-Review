<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="../add-on/header.jsp" />

<div class="colleft" style="width: 1000px;">

<fieldset>

	<legend>Lista de Review</legend>

	<table class="table table-bordered table-condensed table-hover" style="width: 100%" >
		<tr>
			
			<td>Foto</td>
			<td>Review</td>
			

		</tr>
		
		
		<c:forEach items="${reviewList}" var="review">
			<tr>
				
				
				<td>
				 
					<img src="${pageContext.request.contextPath}/imagem/${review.prod_id}"style="width: 60px; height: 60px" border="0" class="img-rounded" />
					
				</td>

				
				<td>
				
				${review.descricao}
				
				
				
				</td>
				
				
			
			</tr>
			


		</c:forEach>
	</table>
</fieldset>
</div>
<jsp:include page="../add-on/footer.jsp" />

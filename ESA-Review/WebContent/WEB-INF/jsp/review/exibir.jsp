<jsp:include page="../add-on/header.jsp" />

<%-- formata o numero exibindo até os zeros decimais --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<fieldset style="width: 330px;">
	<legend>${nome}</legend>


	<div>
		<img src="${pageContext.request.contextPath}/imagem/${review.prod_id}" style="width: 200px; height: 200px" border="0" /></br>
	</div>
	
	
	<div>		
		<span style="font-size: 19px; font: bold;" >Review</span>
		<p>${review.descricao}</p>
		
	</div>
	<br>
	
	
	
	<div>		
		<img alt="BalaoComentario" src="${pageContext.request.contextPath}/img/balaoComentario6.png" width="35px" align="middle">
		<span>${quantComentario}</span>		
		<span style="font-size: 19px; font: bold;" >Comentarios</span>
	</div>
	
	<c:forEach items="${comentarioList}" var="comentario" >
		
		
		<div>
				
		<fieldset style="width: 330px;">
			<div style="float: left; margin-right: 20px;">		
				<img alt="ImagemUsuarioComentario" src="${pageContext.request.contextPath}/img/imgUserComentario.png" width="35px" align="middle">
			</div>
			
			<p><h5>${comentario.dono}</h5></p>
			<p>${comentario.comentario}</p>
			<legend></legend>
		</fieldset>
		
				
	
		</div>
		<tr>
	</c:forEach>
</fieldset>
<jsp:include page="../add-on/footer.jsp" />

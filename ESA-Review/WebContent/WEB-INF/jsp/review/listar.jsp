<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="../add-on/header.jsp" />

<div class="colleft" style="width: 1000px;" >
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.maskMoney.js"></script>



<fieldset>

	<legend>Reviews</legend>

	<table class="table table-bordered table-condensed table-hover" style="width: 100%" >
		<tr>
			
			<td>Produto</td>
			<td>Exibir Review</td>
			

		
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
				<td>
				<!-- 
				${review.descricao}
				<font color="red"><br>voto: </font>
				<form action="${pageContext.request.contextPath}/review/votacao" id="form" method="post" id="fvoto">
				
				<input type="hidden" name="review.usu_id" value="${usuarioWeb.id}" />
				<input type="hidden" name="review.prod_id" value="${produto_id}" />
				<input type="hidden" name="review.rev_id" value="${review.id}" />
				<div id="votop"></div>
				<div id="voton"></div>
				<button id="p" type="button" value="p"onclick="return votoPositivo(${review.prod_id})">POSITIVO</button>
				<button id="n" type="button" value="n"onclick="return votoNegativo(${review.prod_id})">NEGATIVO</button>		
				
				</form>
				<div id="mensagem"></div>
					-->
				<div id="msg"></div>
				 
				<form action="${pageContext.request.contextPath}/review/${review.id}/exibir"	method="get">
					<input type="hidden" name="review.usu_id" value="${usuarioWeb.id}" />
					<input type="hidden" name="review.prod_id" value="${review.prod_id}" />
					<input type="hidden" name="review.id" value="${review.id}" />
					<input type="hidden" name="review.contP" value="${review.contP}" />
					<input type="hidden" name="review.contN" value="${review.contN}" />
					<input type="hidden" name="review.descricao" value="${review.descricao}" />
					<input type="submit" value="Exibir-Review" class="btn" />
					</form>
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

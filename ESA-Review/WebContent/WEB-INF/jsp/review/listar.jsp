<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="../add-on/header.jsp" />

<div class="colleft" >
<script type="text/javascript">

	function votoPositivo() {	
		alert("Voto realizado com sucesso!\n"+"Positivo");
		var formu,pos,neg,valor;
		var msge = document.getElementById("msg");
		var dd = document.getElementById("p");
		var nn = document.getElementById("n");
		//msge.style.color="green";
		//msge.innerHTML = "<h3>Voto realizado com sucesso!</h3>";
		formu = document.getElementById("form");
		valor = formu.p.value;
		dd.disabled = true;
		nn.disabled = true;		
		formu.submit();
		//return true;				   	
  	}
	
	function votoNegativo() {	
		alert("Voto realizado com sucesso!\n"+"Negativo");
		var formu,pos,neg,valor;
		var msge = document.getElementById("msg");
		var dd = document.getElementById("p");
		var nn = document.getElementById("n");
		//msge.style.color="green";
		//msge.innerHTML = "<h3>Voto realizado com sucesso!</h3>";
		formu = document.getElementById("form");
		valor = formu.n.value;
		dd.disabled = true;
		nn.disabled = true;	
		formu.submit();
		//return true;	
  	}
	/* <!--	<input type="submit" id="P" type="button" class="btn" 
	       value="POSITIVO"onclick="votoPositivo()"
	       title="Selecione aqui para VOTAR POSITIVAMENTE no Review!"/> -->
	  <!--	<input type="submit" id="n" type="button" class="btn" 
		   value="NEGATIVO"onclick="votoNegativo()"
		    title="Selecione aqui para VOTAR NEGATIVAMENTE no Review!"/> -->
	*/
</script>

<fieldset>

	<legend>Reviews</legend>

	<table class="table table-bordered table-condensed"  >
		<tr style="background: #87CEFF; font-size: 15px"" >
			
			<td WIDTH=300 HEIGHT=20 ALIGN=left><b>Produto</b></td>
			<td WIDTH=300 HEIGHT=20 ALIGN=left><b>Descriçao</b></td>
			<td WIDTH=300 HEIGHT=20 ALIGN=left><b>Usuario</b></td>
			<td WIDTH=300 HEIGHT=20 ALIGN=left></td>
			<td WIDTH=300 HEIGHT=20 ALIGN=left></td>
			<td WIDTH=300 HEIGHT=20 ALIGN=left><b>Positivo</b></td>
			<td WIDTH=300 HEIGHT=20 ALIGN=left><b>Negativo</b></td>
			
			<c:if test="${not empty reviewList}">
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
				
				<td>${review.dono}</td>
				
				<td>
				<form action="${pageContext.request.contextPath}/review/${review.id}/exibir" method="get">
						<input type="submit" value="Exibir" class="btn" 
						       title="Selecione aqui para EXIBIR O REVIEW!"/>
					</form>
				</td>
				
				<td>				
					<form action="${pageContext.request.contextPath}/comentario/novo" method="get">
						<input type="hidden" name="rv_id" value="${review.id}" />
						<input type="submit" value="Comentar" class="btn" 
						       title="Selecione aqui para INSERIR COMENTÁRIO!"/>				
					</form>
				</td>
				<td>
				<form action="${pageContext.request.contextPath}/review/${review.id}/votarPositivo"	method="get">
				<div align="left">
					<input type="hidden" name="review.id" value="${review.id}" />
					<input type="hidden" name="review.descricao" value="${review.descricao}" />
					<input type="hidden" name="review.prod_id" value="${review.prod_id}" />
					<input type="hidden" name="review.usu_id" value="${review.usu_id}" /> 
					<input type="hidden" name="review.contP" value="${review.contP }" /> 
					<input type="hidden" name="review.contN" value="${review.contN}" />					
					<input type="image" src="${pageContext.request.contextPath}/img/positivo.jpg"
					       style="width: 30px; 
					       height: 30px" 
					       id="p"
					       value="POSITIVO"
					       onclick="votoPositivo()"
	                       title="Selecione aqui para VOTAR POSITIVAMENTE no Review!"
					       border="0" 
					       class="img-rounded"/>					      
					       <b><FONT COLOR="green">Nº${review.contP}</FONT></b>
					 											
				</div>
			</form>
			</td>
			<td>	
			<form action="${pageContext.request.contextPath}/review/${review.id}/votarNegativo"	method="get">
				<div align="left">
					<input type="hidden" name="review.id" value="${review.id}" />
					<input type="hidden" name="review.descricao" value="${review.descricao}" />
					<input type="hidden" name="review.prod_id" value="${review.prod_id}" />
					<input type="hidden" name="review.usu_id" value="${review.usu_id}" /> 
					<input type="hidden" name="review.contP" value="${review.contP }" /> 
					<input type="hidden" name="review.contN" value="${review.contN}" />											
					<input type="image" src="${pageContext.request.contextPath}/img/negativo.jpg"
					       style="width: 30px; 
					       height: 30px" 
					       id="n"
					       onclick="votoNegativo()"
					       value="NEGATIVO"
					       onclick="votoNegativo()"
					 	   title="Selecione aqui para VOTAR NEGATIVAMENTE no Review!"
					       border="0" class="img-rounded"/>					      
					       <b><FONT COLOR="RED">Nº${review.contN}</FONT></b>
									
											
				</div>
			</form>
			</td>	 	
				
			
			</tr>
			


		</c:forEach>
	</table>
</fieldset>

			<!-- <div>${message}</div> --> 
				<div id="msg"></div>
				
</div>
<jsp:include page="../add-on/footer.jsp" />

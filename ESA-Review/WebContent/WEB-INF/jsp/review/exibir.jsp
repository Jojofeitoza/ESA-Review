<jsp:include page="../add-on/header.jsp" />

<%-- formata o numero exibindo até os zeros decimais --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="colleft" style="width: 1000px;" >
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.maskMoney.js"></script>
		
<script type="text/javascript">

	function votoPositivo() {	
		alert("Voto realizado com sucesso!\n"+"Positivo");
		var formu,pos,neg,valor;
		var msge = document.getElementById("msg");
		var dd = document.getElementById("p");
		var nn = document.getElementById("n");
		msge.style.color="green";
		msge.innerHTML = "<h3>Voto realizado com sucesso!</h3>";
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
		msge.style.color="green";
		msge.innerHTML = "<h3>Voto realizado com sucesso!</h3>";
		formu = document.getElementById("form");
		valor = formu.n.value;
		dd.disabled = true;
		nn.disabled = true;	
		formu.submit();
		//return true;	
  	}

</script>


<fieldset style="width: 800px;">
  <legend><h1>Review</h1></legend>
 
	 <table class="table table-bordered table-condensed table-hover" style="width: 200%" >
	   <tr>
			<td>Review</td>
			<td>Votar</td>
	   </tr>	
	   <td>
		 <div>	
			<img src="${pageContext.request.contextPath}/imagem/${review.prod_id}"style="width: 60px; height: 60px" border="0" class="img-rounded" />	
		 </div>
		 <div>
			<span style="font-size: 19px; font: bold;" >Código do Produto:</span>
			${review.prod_id}<br>
		 </div>	
		 <div>		
			<span style="font-size: 19px; font: bold;" >Review:</span>
			${review.descricao}
		 </div>
   <!--  ${review.contP} contagem
		 ${review.contN}
		 -->
		 </td>	
		 <td>
			<form action="${pageContext.request.contextPath}/review/${review.id}/votarPositivo"	method="get">
				<div>
					<input type="hidden" name="review.id" value="${review.id}" />
					<input type="hidden" name="review.descricao" value="${review.descricao}" />
					<input type="hidden" name="review.prod_id" value="${review.prod_id}" />
					<input type="hidden" name="review.usu_id" value="${review.usu_id}" /> 
					<input type="hidden" name="review.contP" value="${review.contP }" /> 
					<input type="hidden" name="review.contN" value="${review.contN}" />
					<input type="submit" id="P" type="button" class="btn" value="POSITIVO"onclick="votoPositivo()"/>										
				</div>
			</form>
				
			<form action="${pageContext.request.contextPath}/review/${review.id}/votarNegativo"	method="get">
				<div>
					<input type="hidden" name="review.id" value="${review.id}" />
					<input type="hidden" name="review.descricao" value="${review.descricao}" />
					<input type="hidden" name="review.prod_id" value="${review.prod_id}" />
					<input type="hidden" name="review.usu_id" value="${review.usu_id}" /> 
					<input type="hidden" name="review.contP" value="${review.contP }" /> 
					<input type="hidden" name="review.contN" value="${review.contN}" />
					<input type="submit" id="n" type="button" class="btn" value="NEGATIVO"onclick="votoNegativo()"/>						
				</div>
			</form>
				 	
			
			<!-- <div>${message}</div> --> 
				<div id="msg"></div>
		 </td>	
	
		 </tr>
		 <tr>
		 
		 </tr>
	</table>
   </fieldset>
 </div>
<jsp:include page="../add-on/footer.jsp" />

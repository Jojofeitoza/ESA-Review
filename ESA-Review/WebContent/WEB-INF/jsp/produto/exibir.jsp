<jsp:include page="../add-on/header.jsp" />

<%-- formata o numero exibindo at� os zeros decimais --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<fieldset style="width: 330px;">
	<legend>Produto</legend>


	<div>
		<img src="${pageContext.request.contextPath}/imagem/${produto.id}" style="width: 200px; height: 200px" border="0" /></br>
	</div>
	
	
	<div>
		
			<span style="font-size: 19px; font: bold;" >Nome</span>
			<p>${produto.nome}</p>
		
	</div>	
	
	<div>		
			<span style="font-size: 19px; font: bold;" >Descri��o</span>
			<p>${produto.descri}</p>
		
		</div>
		
	<div>
		
			<span style="font-size: 19px; font: bold;" >Pre�o</span>
			<!-- formata o numero exibindo at� os zeros decimais  
			
			minIntegerDigits="1"  - 0,05
			minIntegerDigits="2" - 00,05
			-->
			
			<p>R$ <fmt:formatNumber value="${produto.preco}" pattern="#,###.00" maxFractionDigits="2" minIntegerDigits="1" /></p>
				
		
	
	</div>
	
	
	<%-- <table class="table table-bordered table-condensed table-hover">	
		<tr>
			<td>Nome</td>
			<td>${produto.nome}</td>
		</tr>
		
		<tr>
			
			<td>Descri��o</td>
			<td>${produto.descri}</td>
		</tr>
		
		<tr>
			<td>Pre�o</td>
			<!-- formata o numero exibindo at� os zeros decimais  
			
			minIntegerDigits="1"  - 0,05
			minIntegerDigits="2" - 00,05
			-->
			
			<td><fmt:formatNumber value="${produto.preco}" pattern="#,###.00" maxFractionDigits="2" minIntegerDigits="1" /></td>
				
		</tr>
		
	</table> --%>
</fieldset>
<jsp:include page="../add-on/footer.jsp" />

<jsp:include page="../add-on/header.jsp"/> 

		
		<script>
		function salvar(){
			
			if( (validacaoNome == true)&&(validacaoID == true)&&(validacaoLogin == true)
			   &&(validacaoSenha == true)&&(validacaoEmail == true)  ){
				
			}
			
		}
		var salvar = document.getElementById("salvar");
		reset.onclick = function(){
			if (salvar == true){
				reset = true;
			} 
		}
		
		var validacaoNome = false;
        function validaNome(){
			
			var nome = document.getElementById("nome").value;

			if(!nome == "")
			{ 
				if(nome == "nome") 
			       {
				    alert("Nome inv�lido! Tente outra vez");
				    validacaoNome = false;

				}else{
	                  alert("Parab�ns! Nome V�lido");
	                  validacaoNome = true;

			       }

			}else{

				alert("Nome inv�lido! Tente outra vez");
				validacaoNome = false;
			}

		}	
		
		// Valida��o de senha:
		var validacaoID = false;
		
		function validaID(){

			var id = document.getElementById("id").value;

			if( (!id == "") && (id.length <= 10)  )
			{		   
			   
				alert("Parab�ns! id V�lido");
				validacaoID = true;		   

			}else{

				alert("Id inv�lida! Tente outra vez" );
				validacaoID = false;
			}

		}
		var validacaoLogin = false;
		function login(){

			var login = document.getElementById("login").value;

			if(!login == "")
			{ 
				if(login == "login") 
			       {
				    alert("login inv�lido! Tente outra vez");
				    validacaoLogin = false;

				}else{
	                 alert("Parab�ns! login V�lido");
	                 validacaoLogin = true;

			       }

			}else{

				alert("login inv�lido! Tente outra vez");
				validacaoLogin = false;
			}

		}	
		var validacaoSenha = false;
		function senha(){

			var senha = document.getElementById("senha").value;

			if((!senha == "") && (senha.length <= 10))
			{ 
				if(senha == "senha") 
			       {
				    alert("senha inv�lido! Tente outra vez");
				    validacaoSenha = false;

				}else{
                     alert("Parab�ns! senha V�lido");
	                 validacaoSenha = true;

			    }
			}else{
				alert("senha inv�lido! Tente outra vez");
				validacao = false;
			}
		}	
		
		
		var padrao = /^([\w-]+(\.[\w-]+)*)@(([\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(\.[a-z]{2})?)$/i;
		
        var validacaoEmail = false;

		function validaEmail(){

			var email = document.getElementById("e_mail").value;

			if( padrao.test(email)  )
			{	
				if ( email == "exemplo@exemplo.com" )
				{

          			 alert("E-mail inV�lido! Tente outra vez");
          			validacaoEmail = false;
				

				}else {
					alert("Parab�ns! E-mail V�lido");
					validacaoEmail = true;
			      
		        }

			}else {

				alert("E-mail inV�lido! Tente outra vez");
				validacaoEmail = false;
			}

		}

		</script>
	
		<!-- 
		Em novo produto "cadastrar " n� preciza ter "novo produto"
		<a href="${pageContext.request.contextPath}/produto/novo">Novo Produto</a><br/><br/>
		 -->
	
	
		<div> <h2><legend>Cadastro de Usuario</legend></h2></div>
		
		<fieldset style="width: 390px;">		
		<legend>Criar novo Usu�rio</legend>
		
		<form class="form-horizontal well"  action="${pageContext.request.contextPath}/usuario" method="post" enctype="multipart/form-data">
					
			<label for="id">ID:</label>			
 			<input id="id" class="required" type="text" name="usuario.id" value="${usuario.id}" onblur="validaID()"/><br/>
 			
 			<label for="nome">Nome:</label>			
 			<input id="nome" class="required" type="text" name="usuario.nome" value="${usuario.nome}" onblur="validaNome()"/><br/>
 			
 			<label for="login">Login:</label>
 			<input id="login" class="required" type="text" name="usuario.login" value="${usuario.login}"onblur="login()"/><br/>
 			
 			<label for="senha">Senha:</label>			
 			<input id="senha" class="required" type="password" name="usuario.senha" value="" onblur="senha()"/><br/>
 			
 			<label for="confirma">Confirma senha:</label>
 			<input id="confirma" equalTo="#senha" type="password"/><br/>
 			
 			<label for="email">E_mail:</label>			
 			<input id="email" class="required" type="text" name="usuario.e_mail" value="${usuario.e_mail}" onblur="validaEmail()"/><br/>
 		
			<input class="btn" id="salvar" type="submit" value="salvar"/><input type="reset" value="Descartar Dados"/><br>
			
			
		</form>
		</fieldset>
		<script type="text/javascript">
			$('usuariosForm').validate();		
		</script> 
		
<jsp:include page="../add-on/footer.jsp"/> 
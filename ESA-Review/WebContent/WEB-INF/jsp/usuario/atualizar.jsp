<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css" >
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/estilos.css" media="screen" title="Freshy">
 
	<title>ESA-Review | Atualiza Usuario</title>
		<script>
		function salvar(){
			
			if( (validacaoNome == true)&&(validacaoID == true)&&(validacaoLogin == true)
			   &&(validacaoSenha == true)&&(validacaoEmail == true)  ){
				window.document.forms["${pageContext.request.contextPath}/usuario/atualizar"] = "${pageContext.request.contextPath}/usuario/atualizar";
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
				    alert("Nome inválido! Tente outra vez");
				    validacaoNome = false;

				}else{
	                  alert("Parabéns! Nome Válido");
	                  validacaoNome = true;

			       }

			}else{

				alert("Nome inválido! Tente outra vez");
				validacaoNome = false;
			}

		}	
		
		// Validação de senha:
		var validacaoID = false;
		
		function validaID(){

			var id = document.getElementById("id").value;

			if( (!id == "") && (id.length <= 10)  )
			{		   
			   
				alert("Parabéns! id Válido");
				validacaoID = true;		   

			}else{

				alert("Id inválida! Tente outra vez" );
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
				    alert("login inválido! Tente outra vez");
				    validacaoLogin = false;

				}else{
	                 alert("Parabéns! login Válido");
	                 validacaoLogin = true;

			       }

			}else{

				alert("login inválido! Tente outra vez");
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
				    alert("senha inválido! Tente outra vez");
				    validacaoSenha = false;

				}else{
                     alert("Parabéns! senha Válido");
	                 validacaoSenha = true;

			    }
			}else{
				alert("senha inválido! Tente outra vez");
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

          			 alert("E-mail inVálido! Tente outra vez");
          			validacaoEmail = false;
				

				}else {
					alert("Parabéns! E-mail Válido");
					validacaoEmail = true;
			      
		        }

			}else {

				alert("E-mail inVálido! Tente outra vez");
				validacaoEmail = false;
			}

		}

		</script>
				
</head>
	<body>
		
	<div id='cssmenu'>
		<ul>
  		    <li class='active'><a href='${pageContext.request.contextPath}/'><span>Início</span></a></li> 
            <li class='has-sub'><a href='#'><span>Usuário</span></a>
               <ul>
                  <li class='has-sub'><a href='#'><span>Editar perfil</span></a>      
                  </li>      
                  <li class='has-sub'><a href='#'><span>Excluir conta</span></a>         
                  </li>
               </ul>    
           </li> 
           <li class='has-sub'><a href='#'><span>Produtos</span></a>
              <ul>
                 <li class='has-sub'><a href='${pageContext.request.contextPath}/produto/novo'><span>Cadastrar Produtos</span></a>         
                 </li>      
                <li class='has-sub'><a href='${pageContext.request.contextPath}/produto'><span>Listar Produtos</span></a>        
                </li>
             </ul>    
          </li> 
   		 <li><a href='${pageContext.request.contextPath}/sobre/sobre'><span>Sobre</span></a></li>
          <li><a href='${pageContext.request.contextPath}/contato/contato'><span>Contact-nos</span></a></li>
      </ul>
    </div>	
	
	
		<div> <h2><legend>Atualiza Usuario</legend></h2></div>
		<fieldset style="width: 390px;">
		<legend>Criar novo Usuário</legend>
		<form action="${pageContext.request.contextPath}/usuario/atualizar" method="post" enctype="multipart/form-data">
					
			<label for="id">ID:</label>			
 			<input id="id" class="required" 
 				   type="text" name="usuario.id" value="${usuario.id}" onblur="validaID()"/><br/>
 			<label for="nome">Nome:</label>			
 			<input id="nome" class="required" 
 				   type="text" name="usuario.nome" value="${usuario.nome}" onblur="validaNome()"/><br/>
 			<label for="login">Login:</label>			
 			<input id="login" class="required" 
 				   type="text" name="usuario.login" value="${usuario.login}"onblur="login()"/><br/>
 			<label for="senha">Senha:</label>			
 			<input id="senha" class="required" 
 				   type="password" name="usuario.senha" value="" onblur="senha()"/><br/>
 			<label for="confirma">Confirma senha:</label>			
 			<input id="confirma" equalTo="#senha" type="password"/><br/>
 			<label for="email">E_mail:</label>			
 			<input id="email" class="required" 
 				   type="text" name="usuario.e_mail" value="${usuario.e_mail}" onblur="validaEmail()"/><br/>
 		
			<input id="salvar" type="submit" value="salvar"/><input type="reset" value="Descartar Dados"/><br>
			
			
		</form>
		</fieldset>
		<script type="text/javascript">
			$('usuariosForm').validate();		
		</script> 
	</body>
</html>
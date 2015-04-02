<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div id="wrap"> 
	<div id="header">
			<img class="float-left" src="images/Org_Logo.png" width="89px">
			<h1 id="logo">DALU<span class="gray"> C.A</span></h1>
			<h2 id="slogan">Proyecto de Desarrollo Web</h2>

			<div id="loginform">
				<form method="POST" class="login" action="JSP/cerrar_sesion.jsp">
					<input name="cuenta" value="Cuenta" class="button_header button_large glow" type="button" />
					<input name="salir" value="Salir" class="button_header button_large glow" type="submit" />
				</form>
			</div>
	</div>

	<div id="menu_administrador">
		<ul>
			<li id="current"><a href="#"><span class="span_menu">Inicio</span></a></li>
			<li><a href="#"><span class="span_menu">Administrar</span></a></li>
			<li style="float: right; margin-right: 20px;"><span class="span_menu">Administrador</span></li>
		</ul>
	</div>
	
	<div class="body_inside">
		<div id="content-wrap">
			<div id="main"> 
				<h1 onclick="hideshow();" class="mouse">Registrar usuario</h1>
				<p class="p_texto">Agregue un nuevo participante al sistema, asignele un rol dentro de la organización. Entre mas usuarios mas ventajas podra obtener de sus enfuerzo conjunto.</p>
				<form name="form" style="display:block" method="" id="form" onsubmit="return validateForm()" >
					<label>Usuario: <input type="text" name="usuario" class="input_form_cuerpo glow" size="20"></label>
					<label>Nombre: <input type="text" name="nombre" class="input_form_cuerpo glow" size="20"></label>
					<label>Apellido: <input type="text" name="apellido" class="input_form_cuerpo glow" size="20"></label>
					<label>Cédula: <input type="text" name="cedula" class="input_form_cuerpo glow" size="20"></label>
					<label>Tipo de Usuario
					<select class="select_form_cuerpo glow" name="tipo">
							<option value="0">Elija Uno</option>
							<option value="3">Gerente</option> 
							<option value="2">Analista</option> 
							<option value="1">Administrador</option>
							<option value="4">Solicitante</option> 
					</select></label>
					<label>Departamento
					<select class="select_form_cuerpo glow" name="departamento">
							<option value="0">Elija Uno</option>
							<option value="1">Sistemas</option> 
							<option value="2">Ventas</option> 
							<option value="3">Compras</option>
							<option value="4">Seguridad</option>
							<option value="5">Mantenimiento</option>
					</select></label>
					<label>Comentario</label>
					<textarea class="glow" name="comentario" rows="5" cols="5"></textarea>
					<input name="submit_registro" id="submit_registro" class="button_cuerpo button_whole glow" type="submit" value="enviar">
				</form>
			</div>
		</div>

		<div id="content-wrap">
			<div id="main">         
			<h1 onclick="hideshow2();" class="mouse">Eliminar Usuario</h1>
			<p class="p_texto">Está opción, inabilitará al usuario para que no pueda ingresar al sistema. Para inhabilitar a un usuario escriba su usuario y presione el botón "Eliminar"</p>
			<form method="POST" name="form2" id="form2" style="display:block" onsubmit="return validateFormElim()">
				<label>Usuario: </label>
				<input type="text" name="usuario" id="usuario" class="input_form_cuerpo glow" size="20"> </br>
				<input class="button_cuerpo button_whole glow" type="submit" value="eliminar">
			</form>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
/*VALIDACIONES DE LOS FORMULARIOS QUE CONTIENE LA PÁGINA ADMIN.JSP*/
	function validateForm() {
	    var usuario = document.forms["form"]["usuario"].value;
	    if (usuario == null || usuario == "") {
	    	reset();
			alertify.alert("No has ingresado el <b class='msjError'>\"Usuario\"</b>");
			return false;
	    }
	    var nombre = document.forms["form"]["nombre"].value;
	    if (nombre == null || nombre == "") {
	    	reset();
			alertify.alert("No has ingresado el <b class='msjError'>\"Nombre\"</b>");
			return false;
	    }
	    var apellido = document.forms["form"]["apellido"].value;
	    if (apellido == null || apellido == "") {
	    	reset();
			alertify.alert("No has ingresado el <b class='msjError'>\"Apellido\"</b>");
			return false;
	    }
	    var cedula = document.forms["form"]["cedula"].value;
	    if (cedula == null || cedula == "") {
	    	reset();
			alertify.alert("No has ingresado el <b class='msjError'>\"Cedula\"</b>");
			return false;
	    }
	    var tipo = document.forms["form"]["tipo"].value;
	    if (tipo == null || tipo == "Elija Uno") {
	    	reset();
			alertify.alert("Debes elegir un cargo para el nuevo usuario.");
			return false;
	    }
	    var departamento = document.forms["form"]["departamento"].value;
	    if (departamento == null || departamento == "0") {
	    	reset();
			alertify.alert("¿A que <b class='msjError'>departamento</b> pertenece?");
			return false;
	    }
	}

	function validateFormElim() {
	    var usuario = document.forms["form2"]["usuario"].value;
	    if (usuario == null || usuario == "") {
	    	reset();
			alertify.alert("Escribe el <b class='msjError'>Usuario</b> del miembro que quieres colocar en estado de inactividad en el sistema.");
			return false;
	    }
	}
</script>
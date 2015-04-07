<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script type="text/javascript" src="JS/list.js"></script>
<link rel="stylesheet" href="CSS/list.css" type="text/css" />

<div id="wrap"> 
	<div id="header">
			<img class="float-left" src="images/Org_Logo.png" width="89px">
			<h1 id="logo">DALU<span class="gray"> C.A</span></h1>

			<div id="loginform">
				<form method="POST" class="login" action="JSP/cerrar_sesion.jsp">
					<input name="salir" value="Salir" class="button_header button_large glow" type="submit" />
				</form>
			</div>
	</div>

	<div id="menu_administrador">
		<ul>
			<li id="current"><a href="#"><span class="span_menu">Inicio</span></a></li>
			<li ><a href="JSP/solicitudes_administrador.jsp"><span class="span_menu">Solicitudes</span></a></li>
			<li><a href="JSP/usuario_info.jsp?user=<%out.print(session.getAttribute("ID_Usuario"));%>"><span class="span_menu">Mi Información</span></a></li>
			<li style="float: right; margin-right: 20px;"><span class="span_menu"><%out.print(session.getAttribute("ID_Usuario"));%>, Administrador</span></li>
		</ul>
	</div>

	<!-- PARA OBTENER LOS NUMEROS DE SOLICITUDES POR ATENDER Y SIENDO ATENDIDAS -->
	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost/db_daluca" user="root"  password="lperez18"/>
	<sql:query dataSource="${snapshot}" var="result">
	SELECT * FROM usuario WHERE estatus="Activo";
	</sql:query>
	<c:set var="por_atender" value="${result.rowCount}" />
	<!-- PARA OBTENER LOS NUMEROS DE SOLICITUDES POR ATENDER Y SIENDO ATENDIDAS -->

	<div class="body_inside">
		<div id="content-wrap">
			<div id="main"> 
				<h1 onclick="hideshow();" class="mouse">Registrar usuario</h1>
				<p class="p_texto">Agregue un nuevo participante al sistema, asignele un rol dentro de la organización. Entre mas usuarios mas ventajas podra obtener de sus enfuerzo conjunto.</p>
				<form name="form" style="display:block" method="POST" action="JSP/nuevo_usuario.jsp" id="form" autocomplete="off" onsubmit="return validateForm()" >
					<label>Usuario:
						<input type="text" id="usuario" name="usuario" class="input_form_cuerpo glow" size="20" onfocus="hola(usu_info)" onblur="chao(usu_info)" >
					</label>
					<p class="p_info" id="usu_info" style="display:none;">¡<b>Obligatorio</b>! Debe ser único, será una referancia directa de la persona en el sistema.<br>El mismo no debe contener espacios.</p>
					
					<label>Nombre:
						<input type="text" name="nombre" class="input_form_cuerpo glow" size="20" onfocus="hola(nom_info)" onblur="chao(nom_info)">
					</label>
					<p class="p_info" id="nom_info" style="display:none;">¡<b>Obligatorio</b>! Primer Nombre de la persona.</p>
					<label>Apellido:
						<input type="text" name="apellido" class="input_form_cuerpo glow" size="20" onfocus="hola(ape_info)" onblur="chao(ape_info)">
					</label>
					<p class="p_info" id="ape_info" style="display:none;">¡<b>Obligatorio</b>! Primer Apellido de la persona.</p>
					<label>Cédula:
						<input type="text" name="cedula" class="input_form_cuerpo glow" size="20"onfocus="hola(ced_info)" onblur="chao(ced_info)">
					</label>
					<p class="p_info" id="ced_info" style="display:none;">¡<b>Obligatorio</b>! Número de Identificación Personal. Solo números!!!</p>
					<label>Fecha de Nacimiento:
						<input type="text" name="f_nac" class="input_form_cuerpo glow" size="20"onfocus="hola(f_nacimiento)" onblur="chao(f_nacimiento)">
					</label>
					<p class="p_info" id="f_nacimiento" style="display:none;">¡<b>Obligatorio</b>! AÑO-MES-DIA, valores numericos estrictamente</p>
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
						<!-- CONSULTA Y RESULTADO DEVUELTO EN LA VARIABLE 'result' -->
						<sql:query dataSource="${snapshot}" var="result">
						SELECT ID_departamento,nombre_dpto from departamento;
						</sql:query>
						<c:forEach var="row" items="${result.rows}"><!--asigno a row la fila resultante de la consulta-->
						<option value="<c:out value='${row.ID_departamento}'/>"><c:out value="${row.nombre_dpto}"/></option>
						</c:forEach>
						<!-- ******************* ********************* ******************** -->
					</select></label>
					<label>Comentario</label>
					<textarea class="glow" name="comentario" rows="5" cols="5"></textarea>
					<input name="submit_registro" id="submit_registro" class="button_cuerpo button_whole glow" type="submit" value="Enviar">
				</form>
			</div>
		</div>

		<sql:query dataSource="${snapshot}" var="result2">
		SELECT * FROM usuario WHERE estatus="Inactivo";
		</sql:query>
		<c:set var="por_atender2" value="${result2.rowCount}" />
		<!-- PARA OBTENER LOS NUMEROS DE SOLICITUDES POR ATENDER Y SIENDO ATENDIDAS -->

		<div id="content-wrap">
			<div id="main">         
			<h1 onclick="hideshow2();" class="mouse">Inhabilitar/Habilitar Usuario</h1>
			<p class="p_texto">
				Esta opción permite administrar el acceso de los usuarios al sistema. Escriba el usuario de cualquier miembro del sistema para cambiar su acceso ('<b>Inactivo</b>'/'<b>Activo</b>').<br>Para inhabilitar a un miembro escriba su usuario y presione el botón "Eliminar"<br>
				<br>Actualmente el sistema tiene <c:out value="${por_atender}" /> usuarios activos y <c:out value="${por_atender2}" /> inactivos.
			</p>
			<form method="POST" action="JSP/eliminar_usuario.jsp" name="form2" id="form2" style="display:block" onsubmit="return validateFormElim()" autocomplete="off">
				<sql:query dataSource="${snapshot}" var="result">
					SELECT * from db_daluca.usuario;
				</sql:query>
				<div id="FiltrarUsuarios">
				<input class="search glow" placeholder="Escriba el Usuario" type="text" name="usuario" id="usuario" />
				<!--<input type="button" value="Ordena por User" class="sort" data-sort="name">-->
					<div class="big_table">
						<table>
							<tr>
								<th class="sort" data-sort="name">Nombre</th>
								<th class="sort" data-sort="iduser">Usuario</th>
								<th class="sort" data-sort="tipo">Tipo</th>
								<th class="sort" data-sort="estatus">Estatus</th>
							</tr>
							<!-- IMPORTANT, class="list" have to be at tbody -->
							
							<tbody class="list">
								<c:set var="est" value="Activo" />
								<c:forEach var="row" items="${result.rows}"><!--asigno a row la fila resultante de la consulta-->
								<tr class="<c:if test='${row.estatus != est}'>prio_maxima</c:if><c:if test='${row.estatus == est}'>prio_baja</c:if>">
									<td class="name"><c:out value='${row.nombre}'/> <c:out value="${row.apellido}"/></td>
									<td class="iduser"><c:out value='${row.ID_usuario}'/></td>
									<td class="tipo">
										<c:if test="${row.tipo_usuario == 1}">Administrador</c:if>
										<c:if test="${row.tipo_usuario == 2}">Analista</c:if>
										<c:if test="${row.tipo_usuario == 3}">Gerente</c:if>
										<c:if test="${row.tipo_usuario == 4}">Solicitante</c:if>
									</td>
									<td class="estatus"><c:out value="${row.estatus}"/></td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<!--<input type="text" name="usuario" id="usuario" class="input_form_cuerpo glow">-->
				<input class="button_cuerpo button_whole glow" type="submit" value="Marcar Como Inactivo">
			</form>
			</div>
		</div>
	</div>

</div>
<script type="text/javascript">
/*PARA FILTRAR USURIOS*/
	var options = {
	valueNames: [ 'name', 'iduser', 'tipo', 'estatus' ]
	};

	var userList = new List('FiltrarUsuarios', options);
</script>
<script type="text/javascript">
/*VALIDACIONES DE LOS FORMULARIOS QUE CONTIENE LA PÁGINA ADMIN.JSP*/
	function validateForm() {
		var usuario = document.forms["form"]["usuario"].value;
		if (usuario == null || usuario == "") {
			reset();
			alertify.alert("<h1>Atención</h1><p class='p_texto'>No has proporcionado un nombre de usuario</p>");
			return false;
		}
		var nombre = document.forms["form"]["nombre"].value;
		if (nombre == null || nombre == "") {
			reset();
			alertify.alert("<h1>Atención</h1><p class='p_texto'>No has ingresado en Nombre del usuario.</p>");
			return false;
		}
		var apellido = document.forms["form"]["apellido"].value;
		if (apellido == null || apellido == "") {
			reset();
			alertify.alert("<h1>Atención</h1><p class='p_texto'>No has ingresado un apellido para el usuario.</p>");
			return false;
		}
		var cedula = document.forms["form"]["cedula"].value;
		if (cedula == null || cedula == "") {
			reset();
			alertify.alert("<h1>Atención</h1><p class='p_texto'>Por favor ingresa una cédula. Ej. V-12.345.678 o E-104.456.785</p>");
			return false;
		}
		var f_nac = document.forms["form"]["f_nac"].value;
		if (f_nac == null || f_nac == "") {
			reset();
			alertify.alert("<h1>Atención</h1><p class='p_texto'>Falta la Fecha de Nacimiento</p>");
			return false;
		}
		var tipo = document.forms["form"]["tipo"].value;
		if (tipo == null || tipo == "Elija Uno") {
			reset();
			alertify.alert("<h1>Atención</h1><p class='p_texto'>Elige un cargo para el nuevo usuario</p>");
			return false;
		}
		var departamento = document.forms["form"]["departamento"].value;
		if (departamento == null || departamento == "0") {
			reset();
			alertify.alert("<h1>Atención</h1><p class='p_texto'>Especifica un derpartamento para el nuevo miembro</p>");
			return false;
		}
	}

	function validateFormElim() {
		var usuario = document.forms["form2"]["usuario"].value;
		if (usuario == null || usuario == "") {
			reset();
			alertify.alert("<h1>Atención</h1><p class='p_texto'>Debes especificar un usuario para ser colocado como 'Activo' o 'Inactivo'</p>");
			return false;
		}
	}
</script>

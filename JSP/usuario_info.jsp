<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<link rel="shortcut icon" href="../images/Org_Logo.png">
	<link rel="stylesheet" href="../CSS/dalustyle.css" type="text/css" />
	<script type="text/javascript" src="JS/jquery-1.11.2.js"></script>
	<link rel="stylesheet" href="../JS/alertify/themes/alertify.core.css" />
	<link rel="stylesheet" href="../JS/alertify/themes/alertify.default.css" id="toggleCSS" />
	<meta name="viewport" content="width=device-width">
	<title>DALU-CA</title>
</head>

<body>
<div id="header">
			<img class="float-left" src="../images/Org_Logo.png" width="89px">
			<h1 id="logo">DALU<span class="gray"> C.A</span></h1>

			<div id="loginform">
				<form method="" class="login" action="../index.jsp">
					<input name="salir" value="Regresar" class="button_header button_large glow" type="submit" />
				</form>
			</div>
	</div>

	<div id="menu">
		<ul>
			<li><a href="../index.jsp"><span class="span_menu">Inicio</span></a></li>
			<li id="current"><a href=""><span class="span_menu">Mi Información</span></a></li>
			<li style="float: right; margin-right: 20px;"><span class="span_menu">Hola, <%out.print(session.getAttribute("ID_Usuario"));%>!!!</span></li>
		</ul>
	</div>

	<div id="wrap">
		<div class="body_inside">
					<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
				  url="jdbc:mysql://localhost/db_daluca"
				  user="root"  password="lperez18"/>
				<sql:query dataSource="${snapshot}" var="result">
					SELECT * from db_daluca.usuario WHERE ID_usuario="<%out.print(session.getAttribute("ID_Usuario"));%>";
				</sql:query>
				<c:forEach var="row" items="${result.rows}">
				<div id="content-wrap">
					<div id="main">
						<h2>Resumen de Información Personal</h2>
						<div class="info_per">
							<p class="vales"><b>Nombre y Apellido</b>:<br><c:out value="${row.nombre}" /> <c:out value="${row.apellido}" /><br></p>
							<p class="vales"><b>Fecha de Nacimiento</b>:<br><c:out value="${row.fecha_nacimiento}" /><br></p>
							<p class="vales"><b>Estatus</b>:<br><c:out value="${row.estatus}" /><br></p>
							<p class="vales"><b>Departamento</b>:<br>(<c:out value="${row.departamento}" />)
									<c:set var="Dep" value="${row.departamento}" />
									<sql:query dataSource="${snapshot}" var="result2">SELECT * from db_daluca.departamento WHERE ID_departamento="<c:out value="${Dep}" />";</sql:query>
										<c:forEach var="row2" items="${result2.rows}">
											<c:out value="${row2.nombre_dpto}" /><br>
										</c:forEach></p>
						</div>
					</div>
				</div>
				</c:forEach>
			<div id="content-wrap">
				<div id="main">
					<h1>Editar Mis Datos Personales</h1>
					<p class="p_texto">Por los momentos necesita dirigirse con el administrador para modificar los datos personales de su cuenta.</p>
				</div>
			</div>

		</div>
	</div>
</body>
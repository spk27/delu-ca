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

	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost/db_daluca" user="root"  password="lperez18"/>

	<div id="menu">
		<ul>
			<li><a href="../index.jsp"><span class="span_menu">Inicio</span></a></li>
			<li id="current"><a href="#"><span class="span_menu">Solicitudes</span></a></li>
			<li><a href="usuario_info.jsp?user=<%out.print(session.getAttribute("ID_Usuario"));%>"><span class="span_menu">Mi Información</span></a></li>
			<li style="float: right; margin-right: 20px;"><span class="span_menu">Hola, <%out.print(session.getAttribute("ID_Usuario"));%>!!!</span></li>
		</ul>
	</div>

	<div id="wrap">
		<div class="body_inside">
			<div id="content-wrap" class="pequeño">
				<div id="main">
					<h2>Resumen de las Solicitudes</h2>
					<div class="info_per">
						<p class="vales">Una solicitude se puede encontrar en varios estados. A continuación un resumen global de ellas. No hay limite para la cantidad de solicitudes ni quien las genera.</p>

						<p class="vales"><b>En Espera</b>: 
							<sql:query dataSource="${snapshot}" var="result">SELECT * from db_daluca.solicitud_ticket WHERE estatus="En Espera"; </sql:query>
							<c:set var="num_p" value="${result.rowCount}" />
							<c:out value="${num_p}" />
						</p>

						<p class="vales"><b>En Proceso</b>: 
							<sql:query dataSource="${snapshot}" var="result">SELECT * from db_daluca.solicitud_ticket WHERE estatus="En Proceso"; </sql:query>
							<c:set var="num_p" value="${result.rowCount}" />
							<c:out value="${num_p}" />
						</p>

						<p class="vales"><b>Atendidas</b>: 
							<sql:query dataSource="${snapshot}" var="result">SELECT * from db_daluca.solicitud_ticket WHERE estatus="Atendidas"; </sql:query>
							<c:set var="num_p" value="${result.rowCount}" />
							<c:out value="${num_p}" />
						</p>

						<p class="vales"><b>Sol. Desarrollo</b>: 
							<sql:query dataSource="${snapshot}" var="result">SELECT * from db_daluca.solicitud_ticket WHERE tipo_incidente="Desarrollo"; </sql:query>
							<c:set var="num_p" value="${result.rowCount}" />
							<c:out value="${num_p}" />
						</p>

						<p class="vales"><b>Sol. Software</b>: 
							<sql:query dataSource="${snapshot}" var="result">SELECT * from db_daluca.solicitud_ticket WHERE tipo_incidente="Software"; </sql:query>
							<c:set var="num_p" value="${result.rowCount}" />
							<c:out value="${num_p}" />
						</p>

						<p class="vales"><b>Sol. Hardware</b>: 
							<sql:query dataSource="${snapshot}" var="result">SELECT * from db_daluca.solicitud_ticket WHERE tipo_incidente="Hardware"; </sql:query>
							<c:set var="num_p" value="${result.rowCount}" />
							<c:out value="${num_p}" />
						</p>
					</div>
				</div>
			</div>
			
			<div id="content-wrap" class="pequeño">
					<div id="main">
						<h2>Sobre los Usuarios</h2>
						<div class="info_per">
							<p class="vales">Unicamente existen 4 tipos de usuarios en el sistema. No hay limite para la cantidad o tipo de usuarios que admite el sistema.</p>

							<table class="inside_tab">
								<thead>
									<td style="text-align: center; background-color: #636363; color: white;"><b>Administrador</b></td>
									<td style="text-align: center; background-color: #636363; color: white;"><b>Analista</b></td>
									<td style="text-align: center; background-color: #636363; color: white;"><b>Gerente</b></td>
									<td style="text-align: center; background-color: #636363; color: white;"><b>Solicitante</b></td>
								</thead>
								<tbody>
									<td style="text-align: center;"><sql:query dataSource="${snapshot}" var="result">SELECT * from db_daluca.usuario WHERE tipo_usuario=1; </sql:query>
									<c:set var="num_p" value="${result.rowCount}" />
									<c:out value="${num_p}" /></td>

									<td style="text-align: center;"><sql:query dataSource="${snapshot}" var="result">SELECT * from db_daluca.usuario WHERE tipo_usuario=2;</sql:query>
									<c:set var="num_p" value="${result.rowCount}" />
									<c:out value="${num_p}" /></td>
							
									<td style="text-align: center;"><sql:query dataSource="${snapshot}" var="result">SELECT * from db_daluca.usuario WHERE tipo_usuario=3;</sql:query>
									<c:set var="num_p" value="${result.rowCount}" />
									<c:out value="${num_p}" /></td>
							
									<td style="text-align: center;"><sql:query dataSource="${snapshot}" var="result">SELECT * from db_daluca.usuario WHERE tipo_usuario=4;</sql:query>
									<c:set var="num_p" value="${result.rowCount}" />
									<c:out value="${num_p}" /></td>
								</tbody>
							</table>
						</div>
					</div>
			</div>

			<div id="content-wrap" class="pequeño">
				<div id="main">
					<h2>Usuarios - Solicitudes</h2>
					<div class="info_per">
						<p class="vales">Una solicitud se puede encontrar en varios estados. A continuación un resumen global de ellas. No hay limite para la cantidad de solicitudes ni quien las genera.</p>

						<p class="vales"><b>Usuarios y las Solicitudes que han Generado</b>:<br>
							<sql:query dataSource="${snapshot}" var="result">SELECT solicitud_ticket.generada_por,COUNT(*) AS cantidad FROM solicitud_ticket GROUP BY generada_por DESC;</sql:query>
							<c:forEach var="row" items="${result.rows}">
								<c:out value="${row.generada_por}" /> (<c:out value="${row.cantidad }" />)<br>
							</c:forEach>
						</p>
						
					</div>
				</div>
			</div>

		</div>
		<div class="body_inside">
			<div id="content-wrap">
				<div id="main">
					<h2>Analistas - Solicitudes</h2>
					<div class="info_per">
						<p class="vales">Un Analista puede atender cuantas solicitudes le parezca, no hay limite.</p>

						<p class="vales"><b>Analistas y las Solicitudes que manejan</b>:<br>
							<sql:query dataSource="${snapshot}" var="result">SELECT solicitud_ticket.atendida_por,COUNT(*) AS cantidad FROM solicitud_ticket GROUP BY atendida_por DESC;</sql:query>
							<c:forEach var="row" items="${result.rows}">
								<c:out value="${row.atendida_por}" /> (<c:out value="${row.cantidad }" />)<br>
							</c:forEach>
						</p>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>
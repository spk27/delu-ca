<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="es" xml:lang="es">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Documento sin título</title>
</head>

<body>
	<!-- Para ver acentos -->
	<%  request.setCharacterEncoding("UTF-8"); %>
	<!-- Extrayendo los datos del formulario -->
	<% String user = request.getParameter("usu"); %>
	<% String pass = request.getParameter("con"); %>

	<!-- PREPARANDO LA CONEXION DE LA BASE DE DATOS
	EN LA VARIABLE 'snapshot' -->
	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
    url="jdbc:mysql://localhost/db_daluca"
    user="root"  password="lperez18"/>

    <!-- CONSULTA Y RESULTADO DEVUELTO EN LA VARIABLE 'result' -->
    <sql:query dataSource="${snapshot}" var="result">
    	SELECT * from usuario where ID_usuario ="<%out.print(user);%>" AND ID_password="<%out.print(pass);%>";
	</sql:query>

	<table border="1" width="100%">
		<tr>
			<th>Emp ID</th>
			<th>First Name</th>
			<th>Last Name</th>
			<th>Age</th>
			<th>Emp ID</th>
			<th>First Name</th>
			<th>Last Name</th>
		</tr>
		<c:forEach var="row" items="${result.rows}">
		<tr>
			<td><c:out value="${row.tipo_usuario}"/></td>
			<td><c:out value="${row.cedula}"/></td>
			<td><c:out value="${row.nombre}"/></td>
			<td><c:out value="${row.apellido}"/></td>
			<td><c:out value="${row.ID_usuario}"/></td>
			<td><c:out value="${row.ID_password}"/></td>
			<td><c:out value="${row.fecha_nacimiento}"/></td>
		</tr>
		</c:forEach>
	</table>

	<%
		/*to discrimanate among sessions*/
		String var = "sesion_admin";
		String var2 = "sesion_ana";
		String var3 = "sesion_gerente";
		String var4 = "sesion_usuario";

		/*if(user.equals("lperez") && pass.equals("lperez")){
			session.setAttribute("iniSesion", var4);
			String site = new String("../index.jsp");
			response.setStatus(response.SC_MOVED_TEMPORARILY);
			response.setHeader("Location",site);
		}else{
			String site = new String("../index.jsp");
			session.setAttribute("iniSesion", null);
			response.setStatus(response.SC_MOVED_TEMPORARILY);
			response.setHeader("Location",site);
		}*/
	%>

	<c:if test="${result.rowCount > 0}"> <!-- hay al menos uno-->
		<c:forEach var="row" items="${result.rows}"><!--asigno a row la fila resultante de la consulta-->
			<c:set var="tipo_usuario" value="${row.tipo_usuario}"/><!--extraigo el tipo_usuario-->
			<c:if test="${tipo_usuario == 1}">Administrador
				<% session.setAttribute("iniSesion", var);
				String site = new String("../index.jsp");
				response.setStatus(response.SC_MOVED_TEMPORARILY);
				response.setHeader("Location",site); %>
			</c:if><!--vugarl y silvestre condicional simple-->
			<c:if test="${tipo_usuario == 2}">Analista
				<% session.setAttribute("iniSesion", var2);
				String site = new String("../index.jsp");
				response.setStatus(response.SC_MOVED_TEMPORARILY);
				response.setHeader("Location",site); %>
			</c:if>
			<c:if test="${tipo_usuario == 3}">Gerente
				<% session.setAttribute("iniSesion", var3);
				String site = new String("../index.jsp");
				response.setStatus(response.SC_MOVED_TEMPORARILY);
				response.setHeader("Location",site); %>
			</c:if>
			<c:if test="${tipo_usuario == 4}">Solicitante
				<% session.setAttribute("iniSesion", var4);
				String site = new String("../index.jsp");
				response.setStatus(response.SC_MOVED_TEMPORARILY);
				response.setHeader("Location",site); %>
			</c:if>
		</c:forEach>
	</c:if>

</body>
</html>
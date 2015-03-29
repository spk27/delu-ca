<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
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

	<%
		String var = "sesion_admin";
		String var2 = "sesion_ana";

		out.print(user+pass+"<br>");

		if(user.equals("lperez") && pass.equals("lperez")){
			session.setAttribute("iniSesion", var);
			String site = new String("../index.jsp");
			response.setStatus(response.SC_MOVED_TEMPORARILY);
			response.setHeader("Location",site);
		}else{
			String site = new String("../index.jsp");
			session.setAttribute("iniSesion", null);
			response.setStatus(response.SC_MOVED_TEMPORARILY);
			response.setHeader("Location",site);
		}
	%>

</body>
</html>
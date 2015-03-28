<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
		out.print(user+pass+"<br>");
		if(user.equals("lperez") && pass.equals("lperez")){
			out.print("Florence is Alive!");
		}else{
			out.print("Florence is love");
		}
	%>

</body>
</html>
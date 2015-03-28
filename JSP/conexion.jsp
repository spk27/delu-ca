<%@ page contentType="text/html; charset=utf-8" language="java" errorPage="" %>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="es" xml:lang="es">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<link rel="stylesheet" href="../CSS/style.css" type="text/css" />
	<link rel="stylesheet" href="../images/dalustyle.css" type="text/css" />
	<link href='http://fonts.googleapis.com/css?family=Lato&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
	<title>JSP+MySQL Conexión</title>
</head>

<body>
	<div id="wrap">
		<h1 class="conex_ok_title">Estatus de la conexión</h1>
		<div class="conex_ok_message">
			<%
			try {
				String connectionURL = "jdbc:mysql://localhost:3306/db_daluca";
				Connection connection = null; 
				Class.forName("com.mysql.jdbc.Driver").newInstance(); 
				connection = DriverManager.getConnection(connectionURL, "root", "lperez18");
				if(!connection.isClosed()){
					out.println("Se ha conectado satisfactoriamente a " + connectionURL);
					connection.close();
				}
			}
			catch(Exception ex){
				out.println("Algo ha acurrido, no se ha podido conectar a la BD. "+ex);
			}  
			%>
		</div>
		<div class="conex_back float-left"><a href="../index.html" name="Ir al sitio principal.">Página de Inicio</a></div>
	</div>
</body>
</html>
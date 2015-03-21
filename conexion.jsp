<%@ page contentType="text/html; charset=utf-8" language="java" errorPage="" %>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="es" xml:lang="es">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" href="CSS/style.css" type="text/css" />
<title>JSP+MySQL Conexión</title>
</head>

<body>
<h1>Estatus de la conexión</h1>
<%
	try {
		String connectionURL = "jdbc:mysql://localhost:3306/db_daluca";
		Connection connection = null; 
		Class.forName("com.mysql.jdbc.Driver").newInstance(); 
		connection = DriverManager.getConnection(connectionURL, "root", "lperez18");
		if(!connection.isClosed())
			 out.println("Successfully connected to " + "MySQL server using TCP/IP...");
		connection.close();
	}catch(Exception ex){
		out.println("Unable to connect to database. "+ex);
	}  
%>
</body>
</html>
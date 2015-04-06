<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%
	Connection connection = null;
	Statement  stmt = null;
	ResultSet rs = null; /*Para obtener el valor de la consulta*/
	String consulta = new String();

	String site = new String("../index.jsp");
	String num_sol = request.getParameter("num_sol");

	try{
	String connectionURL = "jdbc:mysql://localhost:3306/db_daluca"; 
		Class.forName("com.mysql.jdbc.Driver").newInstance(); 
		connection = DriverManager.getConnection(connectionURL, "root", "lperez18");
		
		stmt = connection.createStatement();
		consulta = "UPDATE db_daluca.solicitud_ticket SET estatus='En Proceso' WHERE numero_solicitud="+num_sol+";";
		stmt.executeUpdate(consulta);
		out.print(consulta);
		
		String analista = (String)session.getAttribute("ID_Usuario");
		consulta = "INSERT INTO departamento_atiende_solicitud(numero_solicitud, atendida_por) VALUES (\""+num_sol+"\",\""+analista+"\");";
		stmt.executeUpdate(consulta);
		out.print(consulta);
	}finally{
		response.setStatus(response.SC_MOVED_TEMPORARILY);
		response.setHeader("Location",site);
	}
%>
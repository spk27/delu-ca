<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%
	String site = new String("../index.jsp");
	/*Verificar la Conexión a la base de datos*/
	if("sesion_admin" == session.getAttribute("iniSesion")){
		request.setCharacterEncoding("UTF-8");
		String usuario = request.getParameter("usuario");
		String aux = (String)session.getAttribute("ID_Usuario");
		if(usuario.equals(aux)){
			/*no te puede colocar inactivo tu mismo */
			session.setAttribute("msjEliminar", "mismo");
			response.setStatus(response.SC_MOVED_TEMPORARILY);
			response.setHeader("Location",site);
		}else{
			Connection connection = null;
			Statement  stmt = null;
			ResultSet rs = null; /*Para obtener el valor de la consulta*/
			String consulta = new String();

			/*CONEXION A LA BASE DE DATOS DE OTRA FORMA*/
			try {
			String connectionURL = "jdbc:mysql://localhost:3306/db_daluca"; 
			Class.forName("com.mysql.jdbc.Driver").newInstance(); 
			connection = DriverManager.getConnection(connectionURL, "root", "lperez18");
			}catch(Exception ex){
				out.println("Algo ha acurrido, no se ha podido conectar a la BD. "+ex);
			}
			/*Verificando que esté en la tabla 'usuario'*/
			try{
				stmt = connection.createStatement();
				consulta = "SELECT * FROM db_daluca.usuario WHERE ID_usuario=\""+usuario+"\";";
				rs = stmt.executeQuery(consulta);
				if(!rs.next()){
					session.setAttribute("msjEliminar", "error_eliminar");
				}else{
					consulta = "UPDATE db_daluca.usuario SET estatus='Inactivo' WHERE ID_usuario=\""+usuario+"\";";
					stmt.executeUpdate(consulta);
					session.setAttribute("msjEliminar", "msjOK");
				}
			}finally{
				response.setStatus(response.SC_MOVED_TEMPORARILY);
				response.setHeader("Location",site);
			}
		}
	}else{
		/*Si no hay conexión redirect index.jsp*/
		session.setAttribute("iniSesion", null);
		response.setStatus(response.SC_MOVED_TEMPORARILY);
		response.setHeader("Location",site);
	}
%>
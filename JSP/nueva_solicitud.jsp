<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%
	String site = new String("../index.jsp");
	/*Verificar la Conexión a la base de datos*/
	if("sesion_usuario" == session.getAttribute("iniSesion")){
		request.setCharacterEncoding("UTF-8");

		String prioridad = request.getParameter("prioridad");
		String tipo = request.getParameter("tipo");
		String imagen = request.getParameter("imagen");
		String descripcion = request.getParameter("descripcion");
		String estatus = "En Espera"; //Por defecto al crear una nueva
		String usuario_genera = (String)session.getAttribute("ID_Usuario");
		String t_max_resp = request.getParameter("tiempo_max");
		//out.print(prioridad +" "+ tipo +" "+ imagen +" "+ descripcion);
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

		try{
			stmt = connection.createStatement();
			consulta = "INSERT INTO db_daluca.solicitud_ticket(generada_por, descripcion, estatus, tipo_incidente, prioridad, tiempo_max_respuesta, imagen) VALUES (\""+usuario_genera+"\",\""+descripcion+"\",\""+estatus+"\",\""+tipo+"\",\""+prioridad+"\",\""+t_max_resp+"\",\""+imagen+"\");";
			stmt.executeUpdate(consulta);
			session.setAttribute("newSol", "msjOK");
		}finally{
			response.setStatus(response.SC_MOVED_TEMPORARILY);
			response.setHeader("Location",site);
		}
	}else{
		/*Si no hay conexión redirect index.jsp*/
		session.setAttribute("iniSesion", null);
		response.setStatus(response.SC_MOVED_TEMPORARILY);
		//response.setHeader("Location",site);
	}
%>
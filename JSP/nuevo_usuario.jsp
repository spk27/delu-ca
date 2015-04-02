<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%
	/*Verificar la Conexión a la base de datos*/
	if("sesion_admin" == session.getAttribute("iniSesion")){
		request.setCharacterEncoding("UTF-8");
		String usuario = request.getParameter("usuario");
		String nombre = request.getParameter("nombre");
		String apellido = request.getParameter("apellido");
		String cedula = request.getParameter("cedula");
		String f_nac = request.getParameter("f_nac");
		String tipo = request.getParameter("tipo");
		String departamento = request.getParameter("departamento");
		String comentario = request.getParameter("comentario");
		
		/*out.print(usuario)		out.print(nombre)		out.print(apellido)		out.print(cedula)		out.print(f_nac)		out.print(tipo)		out.print(departamento)		out.print(comentario);*/
%>
		<!-- CONEXION A LA BASE DE DATOS -->
		<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost/db_daluca"
		user="root"  password="lperez18"/>

		<!-- CONTRASTANDO LA EXISTENCIA DEL NUEVO USUARIO -->
		<sql:query dataSource="${snapshot}" var="result">
			SELECT * from usuario where ID_usuario ="<%out.print(usuario);%>";
		</sql:query>

		<c:if test="${result.rowCount == 0}">
			<!-- SE PUEDE HACER LA INSERSION -->
			<%
			Connection connection = null;
			Statement  stmt = null;
			PreparedStatement ps = null;

			String queryPerson = new String(); //Query statement
			String queryUserInfo = new String();
			String queryAccount = new String();

			/*CONEXION A LA BASE DE DATOS DE OTRA FORMA*/
			try {
			String connectionURL = "jdbc:mysql://localhost:3306/db_daluca"; 
			Class.forName("com.mysql.jdbc.Driver").newInstance(); 
			connection = DriverManager.getConnection(connectionURL, "root", "lperez18");
			}catch(Exception ex){
				out.println("Algo ha acurrido, no se ha podido conectar a la BD. "+ex);
			}
			/* HACIENDO LA INSERCIÓN, YA SE VERIFICO QUE NO EXISTIERA */
			try{
			  stmt = connection.createStatement(); 

			  queryAccount = "INSERT INTO db_daluca.usuario(tipo_usuario, cedula, nombre, apellido, ID_usuario, ID_password, fecha_nacimiento, estatus) VALUES ("+tipo+","+cedula+",\""+nombre+"\",\""+apellido+"\",\""+usuario+"\",\""+usuario+"\",\""+f_nac+"\",\"Activo\");";

			  stmt.executeUpdate(queryAccount);
			}catch(Exception ex){
				session.setAttribute("msjError", "user_error_param");
				session.setAttribute("iniSesion", "sesion_admin"); /*O PUEDO QUITAR ESTA LINEA*/
				String site = new String("../index.jsp");
				response.setStatus(response.SC_MOVED_TEMPORARILY);
				response.setHeader("Location",site);
			}
			
			/* AÑADIENDO USUARIO A UN DEPARTAMENTO */
			try{
				stmt = connection.createStatement(); 

				queryAccount = "INSERT INTO db_daluca.usuario_pertenece_departamento(ID_departamento, ID_usuario) VALUES (\""+departamento+"\",\""+usuario+"\");";

				stmt.executeUpdate(queryAccount);
			}finally{
				connection.close();
				session.setAttribute("msjError", "user_insertado");
				session.setAttribute("iniSesion", "sesion_admin"); /*O PUEDO QUITAR ESTA LINEA*/
				String site = new String("../index.jsp");
				response.setStatus(response.SC_MOVED_TEMPORARILY);
				response.setHeader("Location",site);
			}
			%>
		</c:if>
		<c:if test="${result.rowCount > 0}"> <!-- YA HAY ALGUIEN CON ESE USER-->
			<% session.setAttribute("msjError", "user_existe");
			session.setAttribute("iniSesion", "sesion_admin"); /*O PUEDO QUITAR ESTA LINEA*/
			String site = new String("../index.jsp");
			response.setStatus(response.SC_MOVED_TEMPORARILY);
			response.setHeader("Location",site); %>
		</c:if>
<%
	}else{
		/*Si no hay conexión redirect index.jsp*/
		String site = new String("../index.jsp");
		session.setAttribute("iniSesion", null);
		response.setStatus(response.SC_MOVED_TEMPORARILY);
		response.setHeader("Location",site);
	}
%>
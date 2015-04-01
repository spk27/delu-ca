<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Arrays"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>


    <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
    url="jdbc:mysql://localhost/db_daluca"
    user="root"  password="lperez18"/>

    <!-- CONSULTA Y RESULTADO DEVUELTO EN LA VARIABLE 'result' -->
    <sql:query dataSource="${snapshot}" var="result">
        SELECT ID_usuario from usuario;
    </sql:query>
    <%
    String[] usuario = {};
    String value;
    int N=0;
    %>
    <c:forEach var="row" items="${result.rows}"><!--asigno a row la fila resultante de la consulta-->
        <c:set var="id_usuario" value="${row.ID_usuario}"/><!--extraigo el tipo_usuario-->
        <%
            N = usuario.length;
            value = (String)pageContext.getAttribute("id_usuario");
            usuario = Arrays.copyOf(usuario, N+1);
            usuario[N] = value;
        %>
    </c:forEach>
    <%
        String query = (String)request.getParameter("q");
        //System.out.println("1"+request.getParameterNames().nextElement());
        response.setHeader("Content-Type", "text/html");
        int cnt = 1;
        out.print('[');
        for(int a=0; a<usuario.length; a++){
            out.print("{\"label\" : \""+usuario[a]+"\"}, ");
            
            if(cnt>=10){
                break;
            }
            cnt++;
        }
        out.print("{\"label\" : \"none\"}]");
    %>
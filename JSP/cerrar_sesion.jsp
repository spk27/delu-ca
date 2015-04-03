<%
	session.setAttribute("iniSesion", null);
	session.removeAttribute("ID_Usuario");
	String site = new String("../index.jsp");
	response.setStatus(response.SC_MOVED_TEMPORARILY);
	response.setHeader("Location",site);
%>
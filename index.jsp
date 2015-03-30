<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <link rel="stylesheet" href="CSS/dalustyle.css" type="text/css" />
  <title>DALU-CA</title>
</head>

<body>
  <% if(null == session.getAttribute("iniSesion")){ %>
  <!-- Sección que mostrar si no ha iniciado sesion -->
  <div id="wrap">
    <div id="header">
      <img class="float-left" src="images/Org_Logo.png" width="89px">
      <h1 id="logo">DALU<span class="gray"> C.A</span></h1>
      <h2 id="slogan">Proyecto de Desarrollo Web</h2>
      
      <div id="loginform">
        <form method="POST" class="login" action="JSP/verif_log.jsp" autocomplete="off">
          <p>
            <input class="input_header glow" name="usu" placeholder="Usuario" type="text" value="" />
            <input class="input_header glow" name="con" placeholder="Contraseña"  type="password" value="" />
            <input name="log" value="Entrar" class="button_header button_short glow" type="submit" />
          </p>
        </form>
      </div>
    </div>
    
    <div id="menu">
      <ul>
        <li id="current"><a href="#"><span class="span_menu">Inicio</span></a></li>
      </ul>
    </div>
    <div class="body_inside">
      <div id="content-wrap">
        <div id="main">
          <h1>Información</h1>
          <p class="p_texto">Sistema para la gestión de siniestros en el area de sistemas de la compañia <strong>DALU C.A</strong></p>
          
          <h1>¿Quiénes Somos?</h1>
          <p class="p_texto">Somos una empresa comprometida con lo que hace y brindamos productos de calidad, contamos con experiencian en muchos campos y reunimos mas de 50 años de experiencia en el campo en el que nos desemvolvemos.</p>
        </div>
      </div>
       <div id="content-wrap">
        <div id="main">      
          <h1>Contacto</h1>
          <p class="p_texto">Sientasé libre de escribirnos a contacto_dalu.ca@dalu.ca.org<br>En cualquier momento le atenderemos.</p>
        </div>
      </div>
    </div>
  </div>
  <!-- Fin Sección que mostrar si no ha iniciado sesion -->
  <% }
  if("sesion_admin" == session.getAttribute("iniSesion")){ %>
    <%@ include file="admin.html" %>
  <% }
  if("sesion_ana" == session.getAttribute("iniSesion")){ %>
    <%@ include file="analista.html" %>
  <% }
  if("sesion_gerente" == session.getAttribute("iniSesion")){ %>
    <%@ include file="gerente.html" %>
  <% }%>
  <div>&nbsp;</div>
  <div id="footer">
      <p id="inside">&copy; 2015 <strong>Dalu Company</strong><br>Poryecto de Desarrollo Web - FACyT, UC 2015.</p>
  </div>
</body>
</html>

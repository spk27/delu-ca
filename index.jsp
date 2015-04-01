<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <link rel="stylesheet" href="CSS/dalustyle.css" type="text/css" />
  <script type="text/javascript" src="JS/jquery-1.11.2.js"></script>
  <title>DALU-CA</title>
</head>

<body>
  <% if(null == session.getAttribute("iniSesion")){ %>
  <!-- Sección que mostrar si no ha iniciado sesion -->
  <div id="wrap">
    <!-- paso de mensajes -->
    <% if("none" == session.getAttribute("msjError")){ %>
      <div class="msjError">No ha podido ingresar, verifique los datos.</div>
    <% session.removeAttribute("msjError");
    } %>
    <!-- FIN_ paso de mensajes -->
    
    <div id="header">
      <img class="float-left" src="images/Org_Logo.png" width="89px">
      <h1 id="logo">DALU<span class="gray"> C.A</span></h1>
      <h2 id="slogan">Proyecto de Desarrollo Web</h2>
      
      <div id="loginform">
        <form method="POST" class="login" action="JSP/verif_log.jsp" autocomplete="off" id="form-login" name="form-login">
          <p>
            <input id="usu" name="usu" class="input_header glow" placeholder="Usuario" type="text" />
            <input id="con" name="con" class="input_header glow" placeholder="Contraseña"  type="password" />
            <input type="submit" id="boton-submit" name="boton-submit" value="Entrar" class="button_header button_short glow" />
          </p>
        </form>
      </div>
    </div>

    <div id="menu">
      <ul>
        <li id="current"><a href="#"><span class="span_menu">Inicio</span></a></li>
        <li style="float: right; margin-right: 20px;"><span class="span_menu">Usted no ha iniciado sesión</span></li>
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
    <%@ include file="admin.jsp" %>
  <% }
  if("sesion_ana" == session.getAttribute("iniSesion")){ %>
    <%@ include file="analista.html" %>
  <% }
  if("sesion_gerente" == session.getAttribute("iniSesion")){ %>
    <%@ include file="gerente.html" %>
  <% }
  if("sesion_usuario" == session.getAttribute("iniSesion")){ %>
    <%@ include file="usuario.html" %>
  <% } %>
  <div>&nbsp;</div>
  <div id="footer">
      <p id="inside">&copy; 2015 <strong>Dalu Company</strong><br>Poryecto de Desarrollo Web - FACyT, UC 2015.</p>
  </div>
  lperez - Administrador<br>
  dacevedo - Analista<br>
  daguilar - Gerente<br>
  wflorence  - Solicitante<br>
</body>
</html>

<script type="text/javascript">
    var $form = $("#form-login"),
        $errorMsg = $("<span class='msjErrorInput'>Campo obligatorio!</span>");
    $("#boton-submit").on("click", function () {
        var toReturn = true;
        $("input", $form).each(function () {
            if ($(this).val() == "") {
                if (!$(this).data("error")) {
                    $(this).data("error", $errorMsg.clone().insertBefore($(this)));
                }
                toReturn = false;
            }
            else {
                if ($(this).data("error")) {
                    $(this).data("error").remove();
                    $(this).removeData("error");
                }
            }
        });
        return toReturn;
    });
  </script>
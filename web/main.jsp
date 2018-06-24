<%-- 
    Document   : main
    Created on : 24-feb-2018, 16:51:22
    Author     : Jorge
--%>

<%@page import="frontController.Client"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if (session.getAttribute("user") == null) {
        RequestDispatcher r = request.getRequestDispatcher("index.jsp");
        r.forward(request, response);
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css">
        <title>Torniquete seguros s.a.</title>
    </head>
    <body>
        <h1 class="title">Torniquete seguros s.a.</h1>
        <%
            out.print("<FORM action='FrontController'>");
            out.print("<INPUT type='hidden' name='command' value='Logout'>");
            out.print("<INPUT type='submit' value='Cerrar sesión' class='botonLogout'>");
            out.print("</FORM><BR>");
            
            String user = (String) session.getAttribute("user");
            out.print("<h3>Agente: " + user + "</h3>");

            List<Client> clientes = new ArrayList<Client>();
            clientes.add(new Client("00000000T", "Jorge", "Fernandez", "555-555-555"));
            clientes.add(new Client("11111111H", "Pedro", "Cabrera", "555-555-444"));
            clientes.add(new Client("22222222J", "Rita", "Medina", "555-555-523"));
            clientes.add(new Client("33333333P", "Sandra", "Hernandez", "555-555-123"));
            clientes.add(new Client("44444444A", "Marta", "Gonzalez", "555-555-654"));

            out.print("<TABLE border=1 class='center'>");
            out.print("<TR><TD colspan='5'>LISTADO DE CLIENTES</TD></TR>");
            out.print("<TR><TH><B>Dni</B></TH><TH><B>Nombre</B></TH><TH><B>Apellido</B></TH><TH><B>Teléfono</B></TH><TH><B>Ficha</B></TH></TR>");
            for (Client elem : clientes) {
                out.print("<TR>");
                out.print("<TD>" + elem.getId() + "</TD>");
                out.print("<TD>" + elem.getName() + "</TD>");
                out.print("<TD>" + elem.getSurame() + "</TD>");
                out.print("<TD>" + elem.getTelephone() + "</TD>");
                out.print("<TD><FORM action='FrontController' method='post'>");
                out.print("<INPUT type='hidden' name='command' value='ClientFile'>");
                out.print("<INPUT type='hidden' name='dni' value='" + elem.getId() + "'>");
                out.print("<INPUT type='hidden' name='nombre' value='" + elem.getName() + "'>");
                out.print("<INPUT type='hidden' name='apellido' value='" + elem.getSurame() + "'>");
                out.print("<INPUT type='hidden' name='telefono' value='" + elem.getTelephone() + "'>");
                out.print("<INPUT type='submit' value='Acceder' class='botonTable'></FORM>");
                out.print("</TR>");
            }
            out.print("</TABLE>");
        %>
    </body>
</html>


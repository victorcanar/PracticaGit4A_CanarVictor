<%-- 
    Document   : buscarEstu
    Created on : 6 dic 2023, 10:57:14
    Author     : MASTER
--%>

<%@page import="java.net.http.HttpRequest"%>
<%@page import="java.net.http.HttpResponse.BodyHandlers"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.net.http.HttpResponse"%>
<%@page import="java.net.URI"%>
<%@page import="java.net.http.HttpClient"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="index.jsp"/>
        <table class="table"    >
            <thead>
                <tr>
                    <th scope="col">Cedula</th>
                    <th scope="col">Nombre</th>
                    <th scope="col">Apellido</th>
                    <th scope="col">Direccion</th>
                    <th scope="col">Telefono</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try {
                        String cedula = request.getParameter("cedula");
                        String api = "http://localhost/quinto/select.php?cedula="+cedula;
                        //Cliente
                        HttpClient cliente = HttpClient.newHttpClient();
                        //Solicito
                        HttpRequest solicitud = HttpRequest.newBuilder().uri(URI.create(api)).GET().build();
                        //Respuesta
                        HttpResponse<String> respuesta = cliente.send(solicitud, BodyHandlers.ofString());

                        //Datos
                        StringBuilder tablaBody = new StringBuilder();
                        tablaBody.append(respuesta.body());
                        out.println(tablaBody.toString());
                    } catch (Exception e) {
                        out.print("Error " + e);
                    }

                %>
            </tbody>
        </table>
    </body>
</html>

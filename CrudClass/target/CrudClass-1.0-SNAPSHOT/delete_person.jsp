<%-- 
    Document   : delete_person
    Created on : 5 dic 2023, 20:57:02
    Author     : 4ndre
--%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.net.http.HttpResponse.BodyHandlers"%>
<%@page import="java.net.http.HttpResponse"%>
<%@page import="java.net.URI"%>
<%@page import="java.net.http.HttpRequest"%>
<%@page import="java.net.http.HttpClient"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar</title>
    </head>
    <body>
        <div>
            <jsp:include page="navbar.jsp"></jsp:include>
        </div>
        
        </body>
        
        
        
        <%
    try {
        String cedulaToDelete = request.getParameter("cedula");
        
        //cliente
        HttpClient client = HttpClient.newHttpClient();
        
        // Construir la URL para la eliminación (ajusta según tu API)
        String apiUrl = "http://localhost/quinto/api.php?cedula=" + cedulaToDelete;
        
        //solicitud
          HttpRequest solicitud = HttpRequest.newBuilder()
                  .uri(URI.create(apiUrl))
                  .DELETE()
                  .build();

        //Respuesta
          HttpResponse<String> respuesta = client.send(solicitud, BodyHandlers.ofString());

        // Verificar si la eliminación fue exitosa
        if (respuesta.statusCode() == 200) {
            // Estudiante eliminado con éxito
            response.sendRedirect("lista_estudiantes.jsp");
        } else {
            // La eliminación no fue exitosa
            out.print("No se pudo eliminar el estudiante con la cédula: " + cedulaToDelete);
        }
    } catch (Exception e) {
        out.print(e);
    }
%>
</html>
<%-- 
    Document   : insertar
    Created on : 29 nov 2023, 12:00:22
    Author     : MASTER
--%>
<%@page import="java.net.http.HttpResponse.BodyHandlers"%>
<%@page import="java.net.URI"%>
<%@page import="java.net.http.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div>
            <jsp:include page="index.jsp"/>
        </div>
        <form method="POST">
            <div class="mb-3">
                <label class="form-label">Cedula</label>
                <input type="text" class="form-control" id="cedula" name="cedula">
            </div>
            <div class="mb-3">
                <label class="form-label">Nombre</label>
                <input type="text" class="form-control" id="nombre" name="nombre">
            </div>
            <div class="mb-3">
                <label class="form-label">Apellido</label>
                <input type="text" class="form-control" id="apellido" name="apellido">
            </div>
            <div class="mb-3">
                <label class="form-label">Direccion</label>
                <input type="text" class="form-control" id="direccion" name="direccion">
            </div>
            <div class="mb-3">
                <label class="form-label">Telefono</label>
                <input type="text" class="form-control" id="telefono" name="telefono">
            </div>
            
            <button type="submit" class="btn btn-primary">Agregar</button>
        </form>
        
            <%
                if(request.getMethod().equals("POST")){
                String api = "http://localhost/quinto/api.php";
                String cedula = request.getParameter("cedula");
                String nombre = request.getParameter("nombre");
                String apellido = request.getParameter("apellido");
                String direccion = request.getParameter("direccion");
                String telefono = request.getParameter("telefono");
                
                String postData = "cedula="+cedula+"&nombre="+nombre
                +"&apellido="+apellido+"&direccion="+direccion+"&telefono="+telefono;
                //CLIENTE
                HttpClient cliente = HttpClient.newHttpClient();
                //SOLICITUD
                HttpRequest solicitud = HttpRequest.newBuilder()
                    .uri(URI.create(api))
                    .header("Content-Type","application/x-www-form-urlencoded")
                    .POST(HttpRequest.BodyPublishers.ofString(postData))
                    .build();
                    
                //RESPUESTA DEL SERVIDOR
                HttpResponse<String> respuesta = cliente.send(solicitud,
                HttpResponse.BodyHandlers.ofString());
                
                if(respuesta.statusCode() == 200){
                    out.print("<br>");
                    out.print("<div class='alert alert-success' "
                    + "role='alert'>REGISTRADO CON ÉXITO</div>");
                }
                }
            %>
        
        
    </body>
</html>

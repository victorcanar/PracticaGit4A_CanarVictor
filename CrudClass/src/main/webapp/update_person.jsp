<%-- 
    Document   : update_person
    Created on : 4 dic 2023, 11:10:34
    Author     : MASTER
--%>

<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.net.http.HttpResponse.BodyHandlers"%>
<%@page import="java.net.URI"%>
<%@page import="java.net.http.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Clase</title>
    </head>
    <body>
        <div><jsp:include page="index.jsp"/></div>
        <%
            String nombre = "", apellido = "", direccion = "", telefono = "", id = "";
            try {
                id = request.getParameter("cedula");
                String api = "http://localhost/quinto/select_by_id.php?cedula="+id;
                //Cliente
                HttpClient cliente = HttpClient.newHttpClient();
                //Solicito
                HttpRequest solicitud = HttpRequest.newBuilder().uri(URI.create(api)).GET().build();
                //Respuesta
                HttpResponse<String> respuesta = cliente.send(solicitud, BodyHandlers.ofString());

                //Datos
                JSONArray jsonArray = new JSONArray(respuesta.body());
                JSONObject jsonObject;
                for (int i = 0; i < jsonArray.length(); i++) {
                    jsonObject = jsonArray.getJSONObject(i);
                    nombre = jsonObject.getString("nombre");
                    apellido = jsonObject.getString("apellido");
                    direccion = jsonObject.getString("direccion");
                    telefono = jsonObject.getString("telefono");
                }
            } catch (Exception e) {
                out.print("Error "+e);
            }
        %>
        <h2>Actualizar Estudiante</h2>
        <form method="POST" autocomplete="off" action="actualizar.jsp">
            <div class="mb-3">
                <input type="hidden" class="form-control" id="cedula" name="cedula" 
                       value="<%out.print(id);%>">
            </div>
            <div class="mb-3">
                <label class="form-label">Nombre</label>
                <input type="text" class="form-control" id="nombre" name="nombre"
                       value="<%out.print(nombre);%>">
            </div>
            <div class="mb-3">
                <label class="form-label">Apellido</label>
                <input type="text" class="form-control" id="apellido" name="apellido"
                       value="<%out.print(apellido);%>">
            </div>
            <div class="mb-3">
                <label class="form-label">Direccion</label>
                <input type="text" class="form-control" id="direccion" name="direccion"
                       value="<%out.print(direccion);%>">
            </div>
            <div class="mb-3">
                <label class="form-label">Telefono</label>
                <input type="text" class="form-control" id="telefono" name="telefono"
                       value="<%out.print(telefono);%>">
            </div>

            <button type="submit" class="btn btn-primary" >Actualizar</button>
        </form>
    </body>
</html>

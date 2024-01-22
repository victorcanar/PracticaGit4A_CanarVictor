<%-- 
    Document   : lista_estudiantes
    Created on : 4 dic 2023, 10:23:13
    Author     : MASTER
--%>


<%@page import="javax.swing.JTextField"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.net.http.HttpResponse.BodyHandlers"%>
<%@page import="java.net.URI"%>
<%@page import="java.net.http.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Código JavaScript para confirmar eliminación -->
        <script>
            function confirmarEliminacion() {
                return confirm("¿Estás seguro de que deseas eliminar este estudiante?");
            }
        </script>

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
                    <th scope="col">Acciones</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try {
                        String api = "http://localhost/quinto/api.php";
                        //Cliente
                        HttpClient cliente = HttpClient.newHttpClient();
                        //Solicito
                        HttpRequest solicitud = HttpRequest.newBuilder().uri(URI.create(api)).GET().build();
                        //Respuesta
                        HttpResponse<String> respuesta = cliente.send(solicitud, BodyHandlers.ofString());

                        //Datos
                        JSONArray jsonArray = new JSONArray(respuesta.body());
                        StringBuilder tablaBody = new StringBuilder();
                        JSONObject jsonObject;
                        for (int i = 0; i < jsonArray.length(); i++) {
                            jsonObject = jsonArray.getJSONObject(i);
                            String fila = "<tr>"
                                    + "<td>" + jsonObject.getString("cedula").toString() + "</td>"
                                    + "<td>" + jsonObject.getString("nombre").toString() + "</td>"
                                    + "<td>" + jsonObject.getString("apellido").toString() + "</td>"
                                    + "<td>" + jsonObject.getString("direccion").toString() + "</td>"
                                    + "<td>" + jsonObject.getString("telefono").toString() + "</td>"
                                    + "<td>"
                                    + "<a href=\"update_person.jsp?cedula=" + jsonObject.get("cedula").toString() + "\" "
                                    + "> "
                                    + "<button type=\"button\" class=\"btn btn-primary\" >Actualizar </button> </a>"
                                    + "<a href=\"delete_person.jsp?cedula=" + jsonObject.getString("cedula") + "\" onclick=\"return confirmarEliminacion()\">"
                                    + "<button type=\"button\" class=\"btn btn-danger\">ELIMINAR</button>"
                                    + "</a>\t"
                                    + "</td></tr>";
                            tablaBody.append(fila);
                        }
                        out.println(tablaBody.toString());
                    } catch (Exception e) {
                        out.print("Error " + e);
                    }

                %>
            </tbody>
        </table>
    </body>
</html>

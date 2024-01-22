<%@page import="java.net.http.HttpResponse"%>
<%@page import="java.net.URI"%>
<%@page import="java.net.http.HttpRequest"%>
<%@page import="java.net.http.HttpClient"%>
<%@page import="org.json.JSONObject"%>
<%
    if (request.getMethod().equals("POST")) {
        try {
            String api = "http://localhost/quinto/api.php";
            String cedula = request.getParameter("cedula");
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String direccion = request.getParameter("direccion");
            String telefono = request.getParameter("telefono");
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("cedula", cedula);
            jsonObject.put("nombre", nombre);
            jsonObject.put("apellido", apellido);
            jsonObject.put("direccion", direccion);
            jsonObject.put("telefono", telefono);

            //CLIENTE
            HttpClient cliente = HttpClient.newHttpClient();
            //SOLICITUD
            HttpRequest solicitud = HttpRequest.newBuilder()
                    .uri(URI.create(api))
                    .header("Content-Type", "application/json")
                    .PUT(HttpRequest.BodyPublishers.ofString(jsonObject.toString()))
                    .build();
            HttpResponse<String> respuesta = cliente.send(solicitud, HttpResponse.BodyHandlers.ofString());
            if (respuesta.statusCode() == 200) {
                response.sendRedirect("lista_estudiantes.jsp");
            } else {
                out.print("<br>");
                    out.print("<div class='alert alert-danger' "
                    + "role='alert'>No se actualizo</div>");
            }
        } catch (Exception E) {

        }
    }

%>

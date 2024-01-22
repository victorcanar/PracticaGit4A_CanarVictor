<%-- 
    Document   : navbar
    Created on : 29 nov 2023, 11:49:35
    Author     : MASTER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="head.jsp"/>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="index.jsp">INICIO</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link " aria-current="page" href="insertar.jsp">Agregar Estudiante</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="lista_estudiantes.jsp">Editar Estudiante</a>
                        </li>
                        
                    </ul>
                </div>
                  </div>
        </nav>
    </body>
</html>

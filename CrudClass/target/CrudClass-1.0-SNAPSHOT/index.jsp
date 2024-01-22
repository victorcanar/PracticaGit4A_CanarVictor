<%-- 
    Document   : Index
    Created on : 29 nov 2023, 11:33:14
    Author     : MASTER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="navbar.jsp"/>
        <form action="buscarEstu.jsp?cedula=">
            <input name="cedula"></input>
            <input type="submit" value="Buscar" />
        </form>
    </body>
</html>

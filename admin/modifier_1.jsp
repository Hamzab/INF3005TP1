<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../connexion.jsp" %>
<%
    if (session.getAttribute("username") != null) {
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Bootstrap core CSS -->
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom styles for this template -->
        <link href="../css/signin.css" rel="stylesheet">
    </head>
    <body>
        <%
            ResultSet rs = null;
            Statement stmt = null;
            int id = Integer.parseInt(request.getParameter("id"));
            try {
                stmt = conn.createStatement();
                rs = stmt.executeQuery("SELECT * FROM categories where id=" + id);
                while (rs.next()) {

                    String nom = rs.getString("nom");

        %>
        <div class="logouttext">
            <a href="inxdex.jsp"><img src="../images/logo.png" border="0"/></a><br>
        </div>
        <div class="container">
            <div class="form-signin">

                <div class="panel panel-default">
                    <div class="panel-body"> 
                        <form action="modification_1.jsp?id=<%=id%>" class="form-signin" role="form" method="post">
                            <h4 class="form-signin-heading">Modifier ID=<%=id%> :</h4>
                            <label>Categorie : </label><br/>
                            <input type="text" class="form-control" name="nom" value="<%=nom%>"/></br>
                            <input type="submit" class="btn btn-primary" value="Modifer"/>
                            <a class="btn btn-default" href="categories.jsp">Retour </a>
                        </form>
                    </div>
                    <%
                            }
                            stmt.close();
                            conn.close();
                        } catch (SQLException e) {
                            System.out.println("Error!!!!!!" + e);
                        }

                    %>
                </div>
            </div>
        </div>
    </body>
</html>

<% } else {
        response.sendRedirect("../index.jsp");
    }%>
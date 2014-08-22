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
            try {
                Statement stmt = null;
                //ResultSet rs = null;
                int id = Integer.parseInt(request.getParameter("id"));

                stmt = conn.createStatement();
                rs = stmt.executeQuery("SELECT * FROM users where id=" + id);
                while (rs.next()) {
                    String userName = rs.getString("user_name");
                    String nom = rs.getString("first_name");
                    String prenom = rs.getString("last_name");
                    String pwd = rs.getString("password");
                    String courriel = rs.getString("email");
        %>
        <div class="logouttext">
            <a href="index.jsp"><img src="../images/logo.png" border="0"/></a><br>
        </div>
        <div class="container">
            <div class="form-signin">

                <div class="panel panel-default">
                    <div class="panel-body"> 
                        <form action="modification.jsp?id=<%=id%>" class="form-signin" role="form" method="post">
                            <h4 class="form-signin-heading">Modifier ID=<%=id%> :</h4>
                            <label>Nom d'utilisateur : </label><br/>
                            <input type="text" class="form-control" name="username" value="<%=userName %>"/>
                            <label>Mot de passe : </label>
                            <input type="password" class="form-control" name="password" value="<%=pwd %>"/>
                            <label>Nom : </label>
                            <input type="text" class="form-control" name="nom" value="<%=nom %>"/>
                            <label>Prénom : </label>
                            <input type="text" class="form-control" name="prenom" value="<%=prenom %>"/>
                            <label>Courriel : </label>
                            <input type="text" class="form-control" name="email" value="<%=courriel %>"/><br>
                            <input type="submit" class="btn btn-primary" value="Modifer"/>
                            <a class="btn btn-default" href="index.jsp">Retour </a>
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
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <div class="logouttext">
            <a href="index.jsp"><img src="../images/logo.png" border="0"/></a>
        </div>
        <div class="container">
            <div class="form-signin">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <form action="ajouter.jsp" class="form-signin" role="form" method="post">
                            <h4 class="form-signin-heading" >Ajouter utilisateur :</h4>
                            <label>Nom d'utilisateur : </label>
                            <input type="text" class="form-control" name="username" value="" placeholder="Nom utilisateur" required autofocus />
                            <label>Mot de passe : </label>
                            <input type="password" class="form-control" name="password" value="" placeholder="Mot de passe" required />
                            <label >Nom : </label>
                            <input type="text" class="form-control" name="nom" value="" placeholder="Nom" required />
                            <label>Prénom : </label>
                            <input type="text" class="form-control" name="prenom" value="" placeholder="Prénom" required />
                            <label>Courriel : </label>
                            <input type="email" class="form-control" name="email" value="" placeholder="Courriel" required />
                            </br>
                            <input type="submit" class="btn btn-primary" value="Enregistrer"/>  <a class="btn btn-default" href="./index.jsp" role="button">Retour</a></p

                        </form>
                    </div>       
                </div>       
            </div>       
        </div>
    </body>
</html>
<% } else {
        response.sendRedirect("../index.jsp");
    }%>


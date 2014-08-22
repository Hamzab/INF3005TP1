<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../connexion.jsp" %>
<%@ page import = "java.sql.*"%>
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
    if (session.getAttribute("username") != null) {
%>


        <%

            ResultSet rs = null;
            Statement stmt = null;

            try {
                stmt = conn.createStatement();
                rs = stmt.executeQuery("SELECT * FROM users");

        %>
        <div class="logouttext">
            <a href="index.jsp"><img src="../images/logo.png" border="0"/></a><br>
        </div>
        <div class='container'>
            <div class="form-signin">

                <div class="panel panel-default">
                    <div class="panel-body">   
                        <nav>
                            <ul class="nav nav-pills">
                                <li class="active"><a href="index.jsp">Users</a></li>
                                <li><a href="categories.jsp">Catégories</a></li>
                                <li><a href="motscles.jsp">Mots clés</a></li>
                            </ul>
                        </nav>
                        <p align="right"><a class="logout" href="../deconnecte"><span class="glyphicon glyphicon-log-out"></span> Déconnecté</a></p>
                    
                        <table  class='table table-condensed'>
                            <tr class='active'><th><span class="glyphicon glyphicon-user"></span> Utilisateurs</th><th></th></tr>
                            <%
                                while (rs.next()) {
                            %>

                            <tr><td><%out.println(rs.getString("user_name"));%></td>
                                <td align="right"><a href="./modifier.jsp?id=<%=rs.getInt("id")%>" title="Modifer"><span class="glyphicon glyphicon-edit"></span></a> 
                                    <a href="./delete.jsp?id=<%=rs.getInt("id")%>" title="Supprimer"><span class="glyphicon glyphicon-remove"></span></a></td></tr>
                                    <%}
                                    %>
                        </table>
                        <a  class="btn btn-default" href="./ajouter_user.jsp" role="button">Ajouter</a>  
                     
                    </div>
                    <%
                            rs.close();
                        } catch (SQLException e) {
                            System.out.println("Error!!!!!!" + e);
                        }
                    %>

                </div>
            </div> 
        </div>
<% } else {
        response.sendRedirect("../index.jsp");
    }%>
    </body>
</html>

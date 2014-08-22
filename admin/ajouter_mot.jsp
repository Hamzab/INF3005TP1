<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
        <div class="logouttext">
            <a href="index.jsp"><img src="../images/logo.png" border="0"/></a>
        </div>
        <div class="container">
            <div class="form-signin">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <form action="ajouter_2.jsp" class="form-signin" role="form" method="post">
                            <h4 class="form-signin-heading" >Ajouter mot cle :</h4>
                            <label>Categorie : </label>
                            <%
                                conn = null;
                                Statement stmt = null;
                                ResultSet rs = null;

                                try {
                                    Class.forName("com.mysql.jdbc.Driver");
                                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/data_tp1?user=root&password=");
                                    stmt = conn.createStatement();
                                    rs = stmt.executeQuery("select * from categories");
                            %>
                            <select class="form-control" name="categorie"> 

                                <%
                                    while (rs.next()) {

                                %>

                                <option value="<%=rs.getInt("id")%>"><%=rs.getString("nom")%></option> 

                                <%

                                    }%>
                            </select>
                            <%
                                    rs.close();
                                    stmt.close();
                                    conn.close();
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                            %> 
                            <label>Mot cle : </label>
                            <input type="text" class="form-control" name="nom" value="" />
                            </br>
                            <input type="submit" class="btn btn-primary" value="Enregistrer"/>  <a class="btn btn-default" href="./categories.jsp" role="button">Retour</a></p

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

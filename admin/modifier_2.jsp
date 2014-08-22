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
        <%

            ResultSet rs = null;
            try {
                Statement stmt = null;
                int id = Integer.parseInt(request.getParameter("id"));
                stmt = conn.createStatement();
                rs = stmt.executeQuery("SELECT * FROM motscles where id=" + id);
                int idcat =0;
                while (rs.next()) {
                    int ide = rs.getInt("id");
                     idcat =rs.getInt("idcat");
                    String nom = rs.getString("nom");
        %>
        <div class="logouttext">
            <a href="index.jsp"><img src="../images/logo.png" border="0"/></a><br>
        </div>
        <div class="container">
            <div class="form-signin">

                <div class="panel panel-default">
                    <div class="panel-body"> 
                        <form action="modification_2.jsp?id=<%=id%>" class="form-signin" role="form" method="post">
                            <h4 class="form-signin-heading">Modifier ID=<%=id%> :</h4>
                            <label>Categorie : </label>    
                            <%
                                
                                Statement stmt1 = null;
                                ResultSet rs1 = null;

                                try {                          
                                    stmt1 = conn.createStatement();
                                    rs1 = stmt.executeQuery("select * from categories");
                            %>
                            <select class="form-control" name="categorie">

                                <%
                                    while (rs1.next()) {


                                %>
                                <%
                                    if (idcat == rs1.getInt("id")) {
                                %>
                                <option value="<%=rs1.getInt("id")%>" selected><%=rs1.getString("nom")%></option>

                                <%
                                } else {
                                %>

                                <option value="<%=rs1.getInt("id")%>"><%=rs1.getString("nom")%></option>

                                <%
                                        }
                                    }%>
                            </select>
                            <%
                                    rs1.close();
                                    stmt1.close();
                                    
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                            %>         
                            <label>Mot cle : </label><br/>
                            <input type="text" class="form-control" name="nom" value="<%=nom%>"/><br>
                            <input type="submit" class="btn btn-primary" value="Modifer"/>
                            <a class="btn btn-default" href="motscles.jsp">Retour </a>
                        </form>
                    </div>
                    <%
                            }
                            rs.close();
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
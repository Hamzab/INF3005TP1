<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="./connexion.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Bootstrap core CSS -->
        <link href="./css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom styles for this template -->
        <link href="./css/signin.css" rel="stylesheet">
    </head>
    <body>
        <%

            Statement stmt = null;
            ResultSet rs = null;
            int id = Integer.parseInt(request.getParameter("id"));

            try {

                stmt = conn.createStatement();

                rs = stmt.executeQuery("Select * from messages where id='" + id + "'");

                while (rs.next()) {
                    String nom = rs.getString("nom");
                    String username = rs.getString("username");
                    String courriel = rs.getString("courriel");
                    String adresse = rs.getString("adresse");
                    String telephone = rs.getString("telephone");
                    String photo = rs.getString("photo");
                    String preferences = rs.getString("preferences");
                    String message = rs.getString("message");
        %>

        <div class="logouttext">
            <a href="index.jsp"><img src="./images/logo.png" border="0"/></a><br>
        </div>
        <div class="container">
            <div class="form-signin">
                <div class="panel panel-default">
                    <div class="panel-body"> 
                        <form action="envoyer.jsp" class="form-signin" role="form" method="post">
                            <h4 class="form-signin-heading">Message id=<%=id%> :</h4>
                            <label>Expéditeur : </label>
                            <%=username%><br/>
                            <label>Message : </label><br/>
                            <%=message%><br>
                            <img src="./photos/<%=photo%>" class="form-signin" border="0" height="180" width="180"/><br/>
                            <label>Informations : </label><br/>                         
                            Nom : <%=nom%><br/>                           
                            Courriel : <a href="mailto:<%=courriel%>" target="_top"><%=courriel%></a><br/>                        
                            Téléphone : <%=telephone%> <br/>                         
                            Adresse : <%=adresse%>  <br/>    
                            Préférences : <%=preferences%><br/><br/>
                            <a class="btn btn-default" href="index.jsp">Retour </a>
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


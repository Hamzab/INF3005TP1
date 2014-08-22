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
            String username = request.getSession().getAttribute("username").toString();
            String username_dest = request.getParameter("username");

            try {

                stmt = conn.createStatement();

                rs = stmt.executeQuery("Select * from users where user_name='" + username + "'");

                while (rs.next()) {
                    int id = rs.getInt("id");
                    String nom = rs.getString("first_name");
                    String prenom = rs.getString("last_name");
                    String courriel = rs.getString("email");
                    String adresse = rs.getInt("nrue") + ", " + rs.getString("rue")
                            + " " + rs.getString("ville") + " " + rs.getString("province")
                            + " " + rs.getString("cp") + " " + rs.getString("pays");
                    String telephone = rs.getString("telephone");
                    String photo = rs.getString("photo");
                    String preferences = rs.getString("preferences");
        %>


        <div class="logouttext">
            <a href="index.jsp"><img src="./images/logo.png" border="0"/></a><br>
        </div>
        <div class="container">
            <div class="form-signin">
                <div class="panel panel-default">
                    <div class="panel-body"> 
                        <form action="envoyer.jsp" class="form-signin" role="form" method="post">
                            <h4 class="form-signin-heading">Message :</h4>
                            <label>Expéditeur : </label><br/>
                            <input type="text" class="form-control" name="username" value="<%=username%>"/>
                            <label>Destinataire : </label>
                            <input type="text" class="form-control" name="username_dest" value="<%=username_dest%>"/>                           
                            <input type="hidden" class="form-control" name="nom" value="<%=nom%> <%=prenom%>"/>                            
                            <input type="hidden" class="form-control" name="email" value="<%=courriel%>"/>                            
                            <input type="hidden" class="form-control" name="telephone" value="<%=telephone%>"/>                           
                            <input type="hidden" class="form-control" name="adresse" value="<%=adresse%>"/>        
                            <input type="hidden" class="form-control" name="photo" value="<%=photo%>"/>
                            <input type="hidden" class="form-control" name="photo" value="<%=preferences%>"/>
                            <label>Message : </label>
                            <textarea rows="4" cols="50"  class="form-control" name="message"></textarea><br> 
                            <input type="submit" class="btn btn-primary" value="Envoyer"/>
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

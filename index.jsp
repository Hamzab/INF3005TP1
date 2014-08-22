<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="./connexion.jsp" %>
<%@ page import = "java.sql.*"%>

<%@page import="classes.*" %>

<%-- create an instance of MobileDeviceDetector --%>
<% MobileDeviceDetector deviceDetector = new MobileDeviceDetector(); %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <!-- Bootstrap core CSS -->
        <link href="./css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom styles for this template -->
        
        <% 

if(deviceDetector.isMobile(request)) {
    //deviceDetector.printHeaders(request,response);
    %>
    <link href="./css/signin_mobile.css" rel="stylesheet">
    
    <%
} else {
    //deviceDetector.printHeaders(request,response);%>
    
    
    <link href="./css/signin.css" rel="stylesheet">
    
<%}

%>
        
        
        
        
    </head>
    <body>


        <%
            if (session.getAttribute("username") == null) {
        %>
       
            <div class="form-signin">
                <div class="panel panel-default well-lg">
                    <div class="panel-body"> 
                        <form name="firstForm" class="form-signin" role="form" action="controler" method="post" >
                            <h4 class="form-signin-heading fonts"><span class="glyphicon glyphicon-log-in"></span> Connection</h4></br>
                            <label class="fonts">Nom utilisateur : </label></br><input type="text" class="form-control fonts" name="userName" placeholder="Nom utilisateur" required autofocus /></br>
                            <label class="fonts">Mot de passe : </label></br><input type="password" class="form-control fonts" name="password" placeholder="Mot de passe" required /></br>
                            <p class="fonts"><input type="submit" class="btn btn-primary fonts" name="Valider" value="Valider"/></p>
                            <p class="msgerreur" class="form-signin"><%if (request.getSession().getAttribute("errorMsg") != null) {%><%=request.getSession().getAttribute("errorMsg")%><%}%></p>
                            <br><a class="fonts" href="inscription.jsp" class="form-signin">inscrivez-vous</a> | <a class="fonts" href="oubliermp.jsp" class="form-signin">Oublier mot de passe ?</a>

                        </form></div>
                </div> </div> </div> 
       <% } else {%>

  
        <div class="form-signin">
            <div class="panel panel-default">
                <div class="panel-body">
                    <nav>
                        <ul class="nav nav-pills">
                            <li class="active fonts"><a href="index.jsp">Acceuil</a></li>
                            <li class="fonts"><a href="profil.jsp">Profil</a></li>
                            <li class="fonts"><a href="geolocalisation.jsp">Géolocalisation</a></li>
                        </ul>
                    </nav>
                    <p align="right"><a class="logout fonts" href="deconnecte"><span class="glyphicon glyphicon-log-out"></span> Déconnecté</a></p>
                    
                    
                    <h4 class="fonts"> Bonjour: <%=session.getAttribute("username")%> </h4><br>
                    <%=session.getAttribute("comparer")%>

                    <%
                        ResultSet rs = null;
                        Statement stmt = null;
                        try {
                            stmt = conn.createStatement();
                            rs = stmt.executeQuery("SELECT * FROM messages where username_dest='" + session.getAttribute("username")+"'" );

                    %>        

                    <table  class='table table-condensed fonts'>
                        <tr class='active'><th class="fonts"><span class="glyphicon glyphicon-envelope"></span> Messages :</th><th></th></tr>      


                        <%
                            while (rs.next()) {
                        %>             

                        <tr>
                            <td class="fonts"><%=rs.getString("username")%></td>
                            <td align="right" class="fonts"><a href="./detail.jsp?id=<%=rs.getInt("id")%>" title="Détail">
                                    <span class="glyphicon glyphicon-edit"></span></a>
                            </td>
                        </tr>       

                        <%}
                        %>

                    </table>
                       
                    <%
                            rs.close();
                            stmt.close();
                            conn.close();
                        } catch (SQLException e) {
                            System.out.println("Error!!!!!!" + e);
                        }
                    %>                 

                    <%}%>
                </div>
            </div>
        </div>
   
</body>
</html>

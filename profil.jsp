<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.lang.* " %>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>


<%!
    public List<String> decouperChaines(String uneChaine) {
        List<String> liste = new ArrayList<String>();

        String str = "";
        for (int i = 0; i < uneChaine.length(); i++) {
            if (uneChaine.charAt(i) == '|') {
                liste.add(str);
                str = "";
            } else {
                str += uneChaine.charAt(i);
            }
        }
        return liste;
    }

    public String getPreferences(String uneChaine) {
        List<String> mesPreferences = decouperChaines(uneChaine);
        String res ="";
      res = "<table class='table table-condensed'><tr><th class='active'>Preferences</th></tr>";
        for (int i = 0; i < mesPreferences.size(); i++) {
            res += "<tr><td>" + mesPreferences.get(i) + "</td></tr>";
        }
        res += "</table>";
        return res;
    }
%>
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

        <div class="logouttext">
            <a href="index.jsp"><img src="./images/logo.png" border="0"/></a><br>
        </div>
        <%
            if (session.getAttribute("username") == null) {
        %>
        <div class="container">

            <form name="firstForm" class="form-signin" role="form" action="controler" method="post" >
                <h2 class="form-signin-heading">Connection</h2>
                <p>Nom utilisateur : <input type="text" class="form-control" name="userName" placeholder="Nom utilisateur" required autofocus /></p>
                <p>Mot de passe : <input type="password" class="form-control" name="password" placeholder="Mot de passe" required /></p>
                <p><input type="submit" class="btn btn-primary btn-lg" name="Valider" value="Valider"/></p>
                <br><a href="inscription.jsp">inscrivez-vous</a> | <a href="oubliermp.jsp">Oublier le mot de passe ?</a>
        
    </form></div>
<c:out value="${errorMsg}"/>
</div>  

<% } else {%>

<div class="container">
    <div class="form-signin">

        <div class="panel panel-default">
            <div class="panel-body">
                <nav>
                    <ul class="nav nav-pills">
                        <li><a href="index.jsp">Acceuil</a></li>
                        <li class="active"><a href="profil.jsp">Profil</a></li>
                        <li><a href="geolocalisation.jsp">Géolocalisation</a></li>

                    </ul>
                </nav>
<p align="right"><a class="logout" href="deconnecte"><span class="glyphicon glyphicon-log-out"></span> Déconnecté</a></p>
                    
                <h4> Bonjour: <%= session.getAttribute("username")%></h4><br>
                     <%=getPreferences((String)session.getAttribute("preferences"))%>

      
                <%}%>
            </div>
        </div>
    </div>
</div>
</body>
</html>

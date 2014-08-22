<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="./connexion.jsp" %>
<%

    Statement stmt = null;

    String nom = request.getParameter("nom");
    String username = request.getParameter("username");
    String username_dest = request.getParameter("username_dest");
    String courriel = request.getParameter("email");
    String adresse = request.getParameter("adresse");
    String telephone = request.getParameter("telephone");
    String photo = request.getParameter("photo");
    String preferences = request.getParameter("preferences");
    String message = request.getParameter("message");

    try {

        stmt = conn.createStatement();

        int rs = stmt.executeUpdate("insert into messages(username, username_dest, nom, courriel, adresse, telephone, photo, preferences, message) values "
                + "( '" + username + "','" + username_dest + "','" + nom + "','" + courriel
                + "','" + adresse + "','" + telephone + "','" + photo + "','" + preferences + "','" + message + "' )");

        stmt.close();
        conn.close();
    } catch (SQLException e) {
        System.out.println("Error!!!!!!" + e);
    }
    response.sendRedirect("index.jsp");
%>
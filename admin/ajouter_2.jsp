<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../connexion.jsp" %>
<%
    if (session.getAttribute("username") != null) {
%>
<%

    Statement stmt = null;

    String nom = request.getParameter("nom");
    int idcat = Integer.parseInt(request.getParameter("categorie"));;
    
       try {

        stmt = conn.createStatement();

        int rs = stmt.executeUpdate("insert into motscles(idcat, nom) values "
                + "( '" + idcat + "', '" +  nom  + "' )" );
        
        stmt.close();
        conn.close();
    } catch (SQLException e) {
        System.out.println("Error!!!!!!" + e);
    }
    response.sendRedirect("motscles.jsp");
%>
<% } else {
        response.sendRedirect("../index.jsp");
    }%>
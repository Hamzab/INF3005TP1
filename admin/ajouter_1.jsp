<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../connexion.jsp" %>
<%
    if (session.getAttribute("username") != null) {
%>
<%

    Statement stmt = null;

    String nom = request.getParameter("nom");
    
       try {

        stmt = conn.createStatement();

        int rs = stmt.executeUpdate("insert into categories(nom) values "
                + "( '" + nom +  "' )" );
        
        stmt.close();
        conn.close();
    } catch (SQLException e) {
        System.out.println("Error!!!!!!" + e);
    }
    response.sendRedirect("categories.jsp");
%>

<% } else {
        response.sendRedirect("../index.jsp");
    }%>
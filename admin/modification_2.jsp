<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../connexion.jsp" %>
<%
    if (session.getAttribute("username") != null) {
%>
<%
    Statement stmt = null;

    int id = Integer.parseInt(request.getParameter("id"));
    String nom = request.getParameter("nom");
    int idcat = Integer.parseInt(request.getParameter("categorie"));;

    try {
        stmt = conn.createStatement();
        int rs = stmt.executeUpdate("update motscles set nom='" + nom
                + "' , "
                + "idcat='" + idcat
                + "' where id=" + id);
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
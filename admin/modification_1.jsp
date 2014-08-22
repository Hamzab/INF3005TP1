<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../connexion.jsp" %>
<%
    if (session.getAttribute("username") != null) {
%>
<%
    Statement stmt = null;
    try {

        int id = Integer.parseInt(request.getParameter("id"));
        String nom = request.getParameter("nom");

        stmt = conn.createStatement();
        int rs = stmt.executeUpdate("update categories set nom='" + nom
                + "' where id=" + id);
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


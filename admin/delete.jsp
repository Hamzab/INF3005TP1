<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../connexion.jsp" %>
<%
    if (session.getAttribute("username") != null) {
%>
<%
    Statement stmt = null;
    int id = Integer.parseInt(request.getParameter("id"));
    try {
        stmt = conn.createStatement();
        int rs = stmt.executeUpdate("delete from users where id=" + id);
        stmt.close();
        conn.close();
    } catch (SQLException e) {
        System.out.println("Error!!!!!!" + e);
    }
    response.sendRedirect("index.jsp");
%>
<% } else {
        response.sendRedirect("../index.jsp");
    }%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../connexion.jsp" %>
<%
    if (session.getAttribute("username") != null) {
%>
<%

    Statement stmt = null;

    int id = Integer.parseInt(request.getParameter("id"));
    String nom = request.getParameter("nom");
    String prenom = request.getParameter("prenom");
    String userName = request.getParameter("username");
    String pwd = request.getParameter("password");
    String courriel = request.getParameter("email");
    try {

        stmt = conn.createStatement();

        int rs = stmt.executeUpdate("update users set first_name='" + nom
                + "' , "
                + "last_name='" + prenom + "', user_name='" + userName
                + "', password='" + pwd + "', email='" + courriel
                + "' where id=" + id);
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
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../connexion.jsp" %>
<%
    if (session.getAttribute("username") != null) {
%>
<%
    Statement stmt = null;

    String nom = request.getParameter("nom");
    String prenom = request.getParameter("prenom");
    String userName = request.getParameter("username");
    String pwd = request.getParameter("password");
    String courriel = request.getParameter("email");
    
       try {

        stmt = conn.createStatement();

        int rs = stmt.executeUpdate("insert into users(first_name, last_name, user_name, password, email, nrue, rue, ville, province, cp, pays, telephone, photo, preferences) values "
                + "( '" + nom + "','" + prenom + "','" + userName
                + "','" + pwd + "','" + courriel + "','','','','','','','','','' )" );
        
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
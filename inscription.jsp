<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@include file="./connexion.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <div class="logouttext">
            <a href="index.jsp"><img src="./images/logo.png" border="0"/></a>
        </div>
        <div class="container">
            <div class="form-signin">
                <div class="panel panel-default">
                    <div class="panel-body"> 

                        <form action="inscription" class="form-signin" role="form" method="post" enctype="multipart/form-data">
                            <h4 class="form-signin-heading"><span class="glyphicon glyphicon-check"></span> Inscription :</h4>
                            <label>Nom d'utilisateur : </label>
                            <input type="text" class="form-control" name="username" value="" placeholder="Nom utilisateur" required autofocus />
                            <label>Mot de passe : </label>
                            <input type="password" class="form-control" name="password" value="" placeholder="Mot de passe" required />
                            <label>Nom : </label>
                            <input type="text" class="form-control" name="nom" value="" placeholder="Nom" required />
                            <label>Prénom : </label>
                            <input type="text" class="form-control" name="prenom" value="" placeholder="Prénom" required />
                            <label>Courriel : </label>
                            <input type="email" class="form-control" name="email" value="" placeholder="Courriel" required />
                            <label>Adresse : </label>               
                            <div class="row">

                                <div class="col-xs-4">
                                    <input type="text" class="form-control" name="nrue" placeholder="N&deg;Rue">
                                </div>
                                <div class="col-xs-8">
                                    <input type="text" class="form-control" name="rue" placeholder="Rue">
                                </div>
                            </div>
                            <br/>
                            <div class="row">

                                <div class="col-xs-7">
                                    <input type="text" class="form-control" name="ville" placeholder="Ville">
                                </div>
                                <div class="col-xs-5">
                                    <select class="form-control" name="province"> 
                                        <option>Province</option>
                                        <option> </option>
                                        <option value="AB">AB</option>
                                        <option value="BC">BC</option>
                                        <option value="MB">MB</option>
                                        <option value="NB">NB</option>
                                        <option value="NL">NL</option>
                                        <option value="NS">NS</option>
                                        <option value="NT">NT</option>
                                        <option value="NU">NU</option>
                                        <option value="ON">ON</option>
                                        <option value="PE">PE</option>
                                        <option value="QC">QC</option>
                                        <option value="SK">SK</option>
                                        <option value="YT">YT</option>	
                                    </select> 
                                </div>
                            </div>
                            <br/>
                            <div class="row">

                                <div class="col-xs-5">
                                    <input type="text" class="form-control" name="cp" placeholder="Code postal">
                                </div>
                                <div class="col-xs-7">
                                    <input type="text" class="form-control" name="pays" placeholder="Pays" value="Canada">
                                </div>
                            </div>  
                            <label>Téléphone : </label>
                            <input type='tel' name="telephone" class="form-control" pattern='[\(]\d{3}[\)]\d{3}[\-]\d{4}' title='Phone Number (Format: (999)999-9999)'> 


                            <label>Photo : </label>
                            <input type="file" class="form-control" name="fname"/>



                            <%
                                
                                Statement stmt = null;
                                Statement stmt1 = null;
                                ResultSet rs = null;
                                ResultSet rs1 = null;

                                try {
           
                                    stmt = conn.createStatement();
                                    stmt1 = conn.createStatement();
                                    rs = stmt.executeQuery("select * from categories");
                                    rs1 = stmt1.executeQuery("select * from motscles");
                                    while (rs.next()) {

                            %>

                            <h4><span class="label label-primary"><%=rs.getString("nom")%></span></h4> 

                            <%
                                while (rs1.next()) {
                                    if (rs.getInt("id") == rs1.getInt("idcat")) {

                            %>

                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" name="<%=rs1.getString("nom")%>" value="checkbox">
                                    <%=rs1.getString("nom")%>
                                </label>
                            </div>
                            <%
                                            }
                                        }
                                        rs1.first();
                                    }

                                    rs1.close();
                                    rs.close();
                                    stmt.close();
                                    conn.close();
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                            %>
                            </br>
                            <input type="submit" class="btn btn-primary" value="Enregistrer"/>  <a href="./index.jsp" role="button">Retour</a>

                        </form>
                    </div> 
                </div> 
            </div> 
        </div>
    </body>
</html>



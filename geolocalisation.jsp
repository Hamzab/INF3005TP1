<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>GEOLOCALISATION Page</title>
        <!-- Bootstrap core CSS -->
        <link href="./css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom styles for this template -->
        <link href="./css/signin.css" rel="stylesheet">
        <script type="text/javascript" src="./js/getMapByAddress.js"></script>
    </head>
    <body>
        <div class="logouttext">
            <a href="index.jsp"><img src="./images/logo.png" border="0"/></a>
        </div>            
        <div class="container">
            <div class="form-signin">
                <div class="panel panel-default">
                    <div class="panel-body"> 
                        <nav>
                            <ul class="nav nav-pills">
                                <li><a href="index.jsp">Acceuil</a></li>
                                <li><a href="profil.jsp">Profil</a></li>
                                <li class="active"><a href="geolocalisation.jsp">Géolocalisation</a></li>

                            </ul>
                        </nav>
                        <p align="right"><a class="logout" href="deconnecte"><span class="glyphicon glyphicon-log-out"></span> Déconnecté</a></p>

                        <div class="logouttext">
                            <div id="map" style="width: 280px; height: 340px; display: none;"></div><br>
                            <form onsubmit="return false">
                                <input type="hidden" name="addresse1" id="addresse1" value="4040 saint joseph est h1x1x7"/>
                                <input type="hidden" name="addresse2" id="addresse2" value="7625 Rue Saint-Hubert, Montréal, QC H2R 2N6"/>
                                <input type="hidden" name="addresse3" id="addresse3" value="6597 Rue Jeanne-Mance, Montréal, QC H2X 2K5"/>
                                <input type="submit" value="Géolocalisez" class="btn btn-primary" onclick="searchAddress(map)"/>
                                <a class="btn btn-default" href="./index.jsp" role="button">Retour</a>
                            </form>
                            
                            
                        </div>  
                    </div> 
                </div> 
            </div>
        </div>
    </body>
</html>


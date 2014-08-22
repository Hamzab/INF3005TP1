<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>OUBLIER MOT DE PASSE Page</title>
        <!-- Bootstrap core CSS -->
        <link href="./css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom styles for this template -->
        <link href="./css/signin.css" rel="stylesheet">
    </head>
    <body>        <div class="logouttext">
            <a href="index.jsp"><img src="./images/logo.png" border="0"/></a>

        </div>
        <div class="container">
            <div class="form-signin">
                <div class="panel panel-default">
                    <div class="panel-body">    

                        <form name="firstForm" class="form-signin" role="form" action="recuperer" method="post" >
                            <h4 class="form-signin-heading"><span class="glyphicon glyphicon-share"></span> Récupérer mot de passe :</h4><br><br>
                            <label>Courriel : </label><br/>
                            <input type="email" class="form-control" name="email" value="" placeholder="Courriel" required /><br/>
                            <p><input type="submit" class="btn btn-primary" name="Valider" value="Envoyer"/>  <a class="btn btn-default" href="./index.jsp" role="button">Retour</a></p>

                        </form>
                    </div> 
                </div>
            </div>
        </div> 
    </body>
</html>

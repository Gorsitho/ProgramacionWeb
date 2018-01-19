		<!DOCTYPE html>
<html lang="en">
<head>
  <title>Iniciar Sesión</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="../css/bootstrap.min.css">
  <script src="../js/jquery.min.js"></script>
  <script src="../js/bootstrap.min.js"></script>
  <link href="../css/Login.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-sm-6 col-md-4 col-md-offset-4">
        <a href="../">Inicio</a>
        </div>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-sm-6 col-md-4 col-md-offset-4">
            <h1 class="text-center login-title">¡ Ingresa con tu cuenta de Openyourmind !</h1>
            <div class="account-wall">
                <img class="profile-img" src="../imagenes/iconoU.png"
                    alt="">
                <form action="j_security_check" method="post" class="form-signin">
                <input type="text" class="form-control" name="j_username" placeholder="Usuario" required autofocus>
                <input type="password" class="form-control" name="j_password" placeholder="Contraseña" required>
                <button class="btn btn-lg btn-primary btn-block" type="submit" name="login" value="Ingresar al Sistema">Ingresar</button>
                   <a href="#" class="pull-right need-help">¿ Olvidaste tu contraseña?</a><span class="clearfix"></span>
                </form>
            </div>
            <a href="#" class="text-center new-account">Create una cuenta</a>
        </div>
    </div>
</div><br><br><br><br>

<div class="container">
<footer>
 <p>&copy; 2017 Company, Inc. &middot; <a href="#">Privacidad</a> &middot; <a href="#">Condiciones</a>&middot; <a href="#">Ayuda</a></p>
</footer>
</div>

</body>
</html>
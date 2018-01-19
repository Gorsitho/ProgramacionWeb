<%@ page import="java.util.Vector"%>
<%@ page import="org.comercio.producto.Producto"%>
<%
	Vector compras = (Vector) session.getAttribute("compras");
	int total = 0;
	if (compras == null) {
		total = 0;
	} else {
		for (int i = 0; i < compras.size(); i++) {
			Producto compra = (Producto) compras.elementAt(i);
			total = total + compra.getCantidad();
		}
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Catalogo</title>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- Bootstrap Core CSS -->
<link href="../css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/shop-homepage.css" rel="stylesheet">

<link href="../css/login.css" rel="stylesheet">

<link href="../css/estilo1.css" rel="stylesheet">

<style>
/* Note: Try to remove the following lines to see the effect of CSS positioning */
.affix {
	top: 0;
	width: 19%;
}
</style>

</head>

<body>

	<!-- Navigation -->
	<nav class="navbar navbar-inverse navbar-static-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="../">Openyourmind</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="../">Inicio</a></li>
					<li class="active"><a href="">Catalogo</a></li>
				</ul>
				<form class="navbar-form navbar-left">
					<div class="input-group">
						<input type="text" class="form-control" placeholder=" Buscar">
						<div class="input-group-btn">
							<button class="btn btn-default" type="submit">
								<i class="glyphicon glyphicon-search"></i>
							</button>
						</div>
					</div>
				</form>
				<ul class="nav navbar-nav navbar-right">
					<%
						String usuario = "";
						try {
							usuario = request.getUserPrincipal().getName();
						} catch (Exception e) {
							System.out.println("Error: " + e.toString());
						}
						if (usuario == "") {
					%>
					<li><a href="../usuario"><span
							class="glyphicon glyphicon-user"></span> Iniciar Sesion</a></li>
					<%
						} else {
					%>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false"><span class="glyphicon glyphicon-user"></span>
							<%=usuario%> <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="../usuario"><span
									class="glyphicon glyphicon-user"></span> Perfil</a></li>
							<li><a href="../usuario/ajustes.jsp"><span
									class="glyphicon glyphicon-cog"></span> Ajustes</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="../login/salir.jsp"><span
									class="glyphicon glyphicon-log-out"></span> Cerrar sesion</a></li>
						</ul></li>
					<%
						}
					%>
					
					<li><a href="carrito.jsp"><span
							class="glyphicon glyphicon-shopping-cart"></span><span
							class="badge"><%=total%></span> Carrito</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<jsp:include page="listaProductos.jsp"></jsp:include>

	<div class="w3-black w3-center w3-padding-24">
		<p>
			&copy; 2017 Company, Inc. &middot; <a href="#">Privacidad</a>
			&middot; <a href="#">Condiciones</a>&middot; <a href="#">Ayuda</a>
		</p>
	</div>

	<!-- jQuery -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="../js/bootstrap.min.js"></script>

</body>

</html>
<%@ page import="org.comercio.user.usuarios"%>
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
<html>
<title>Openyourmind</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel='stylesheet'
	href='https://fonts.googleapis.com/css?family=Roboto'>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Bootstrap Core CSS -->
<link href="../css/bootstrap.min.css" rel="stylesheet">

<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="../js/bootstrap.min.js"></script>
<style>
html, body, h1, h2, h3, h4, h5, h6 {
	font-family: "Roboto", sans-serif
}
</style>
<body class="w3-light-grey">

	<!-- Page Container -->
	<div class="w3-content w3-margin-top" style="max-width: 1400px;">

		<nav class="navbar navbar-default navbar-static-top">
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
						<li class="active"><a href="../">Inicio</a></li>
						<li><a href="../productos">Catalogo</a></li>
					</ul>
					<form class="navbar-form navbar-left">
						<div class="input-group">
							<input type="text" class="form-control" placeholder="Search">
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
							if (request.isUserInRole("CLIENTE")) {
						%>
						<li><a href="../pedido">Pedidos</a></li>
						<%
							} else if (request.isUserInRole("ADMINISTRADOR")) {
						%>
						<li><a href="../admin">Administración</a></li>
						<%
							}
						%>
						<li><a href="../productos/carrito.jsp"><span
								class="glyphicon glyphicon-shopping-cart"></span><span
								class="badge"><%=total%></span> Carrito</a></li>
					</ul>
				</div>
			</div>
		</nav>

		<!-- The Grid -->
		<div class="w3-row-padding">

			<!-- Left Column -->
			<div class="w3-third">

				<div class="w3-white w3-text-grey w3-card-4">
					<div class="w3-display-container">
						<img
							src="../imagenes/pedro.jpg"
							style="width: 100%" alt="Avatar">
						<div class="w3-display-bottomleft w3-container w3-text-black">
							<h2><%=usuario%></h2>
						</div>
					</div>
					<br>
					<div class="w3-container">
						<p>
							<i
								class="fa fa-briefcase fa-fw w3-margin-right w3-large w3-text-teal"></i>
							<%
								if (request.isUserInRole("CLIENTE")) {
							%>
							Cliente
							<%
								} else if (request.isUserInRole("ADMINISTRADOR")) {
							%>
							Administrador
							<%
								}
							%>
						</p>
						<p>
							<i class="fa fa-home fa-fw w3-margin-right w3-large w3-text-teal"></i>Huila,
							Colombia
						</p>
						<p>
							<i
								class="fa fa-envelope fa-fw w3-margin-right w3-large w3-text-teal"></i>gorsitho@gmail.com
						</p>
						<p>
							<i
								class="fa fa-phone fa-fw w3-margin-right w3-large w3-text-teal"></i>8700262
						</p>
						<hr>

						<p class="w3-large">
							<b><i
								class="fa fa-asterisk fa-fw w3-margin-right w3-text-teal"></i>Habilidades</b>
						</p>
						<p>Java</p>
						<div class="w3-light-grey w3-round-xlarge w3-small">
							<div class="w3-container w3-center w3-round-xlarge w3-teal"
								style="width: 95%">95%</div>
						</div>
						<p>Paint</p>
						<div class="w3-light-grey w3-round-xlarge w3-small">
							<div class="w3-container w3-center w3-round-xlarge w3-teal"
								style="width: 70%">
								<div class="w3-center w3-text-white">70%</div>
							</div>
						</div>
						<p>Autocad</p>
						<div class="w3-light-grey w3-round-xlarge w3-small">
							<div class="w3-container w3-center w3-round-xlarge w3-teal"
								style="width: 20%">20%</div>
						</div>
						<p>Baile</p>
						<div class="w3-light-grey w3-round-xlarge w3-small">
							<div class="w3-container w3-center w3-round-xlarge w3-teal"
								style="width: 50%">50%</div>
						</div>
						<br>

						<p class="w3-large w3-text-theme">
							<b><i class="fa fa-globe fa-fw w3-margin-right w3-text-teal"></i>Idiomas</b>
						</p>
						<p>Ingles</p>
						<div class="w3-light-grey w3-round-xlarge">
							<div class="w3-round-xlarge w3-teal"
								style="height: 24px; width: 100%"></div>
						</div>
						<p>Español</p>
						<div class="w3-light-grey w3-round-xlarge">
							<div class="w3-round-xlarge w3-teal"
								style="height: 24px; width: 55%"></div>
						</div>
						<p>Aleman</p>
						<div class="w3-light-grey w3-round-xlarge">
							<div class="w3-round-xlarge w3-teal"
								style="height: 24px; width: 25%"></div>
						</div>
						<br>
					</div>
				</div>
				<br>

				<!-- End Left Column -->
			</div>

			<!-- Right Column -->
			<div class="w3-twothird">

				<div class="w3-container w3-card-2 w3-white w3-margin-bottom">
					<h2 class="w3-text-grey w3-padding-16">
						<i
							class="fa fa-suitcase fa-fw w3-margin-right w3-xxlarge w3-text-teal"></i>Experiencia Laboral
					</h2>
					<div class="w3-container">
						<h5 class="w3-opacity">
							<b>Google</b>
						</h5>
						<h6 class="w3-text-teal">
							<i class="fa fa-calendar fa-fw w3-margin-right"></i>Enero 2017 - <span
								class="w3-tag w3-teal w3-round">Hoy en dia</span>
						</h6>
						<p>Trabajo para Google por mas de 5 años.</p>
						<hr>
					</div>
					<div class="w3-container">
						<h5 class="w3-opacity">
							<b>Facebook</b>
						</h5>
						<h6 class="w3-text-teal">
							<i class="fa fa-calendar fa-fw w3-margin-right"></i>2005 - 2008
						</h6>
						<p>Trabajo en facebook por 3 años junto a Mark Zuckerberg, Eduardo Saverin y Andrew McCollum.</p>
						<hr>
					</div>
					<div class="w3-container">
						<h5 class="w3-opacity">
							<b>PSL</b>
						</h5>
						<h6 class="w3-text-teal">
							<i class="fa fa-calendar fa-fw w3-margin-right"></i>2009-2013
						</h6>
						<p>Trabajo para la empresa PSL durante 3 años en donde se destaco varias veces por su gran eficiencia.</p>
						<br>
					</div>
				</div>

				<div class="w3-container w3-card-2 w3-white">
					<h2 class="w3-text-grey w3-padding-16">
						<i
							class="fa fa-certificate fa-fw w3-margin-right w3-xxlarge w3-text-teal"></i>Estudios
					</h2>
					<div class="w3-container">
						<h5 class="w3-opacity">
							<b>Universidad Surcolombiana</b>
						</h5>
						<h6 class="w3-text-teal">
							<i class="fa fa-calendar fa-fw w3-margin-right"></i>2014
						</h6>
						<p>Termino la carreca universitaria de ingenieria de software</p>
						<hr>
					</div>
					<div class="w3-container">
						<h5 class="w3-opacity">
							<b>Harvard university</b>
						</h5>
						<h6 class="w3-text-teal">
							<i class="fa fa-calendar fa-fw w3-margin-right"></i>2014 - 2016
						</h6>
						<p>Maestria en ciencias de la computacion</p>
						<hr>
					</div>
					<div class="w3-container">
						<h5 class="w3-opacity">
							<b>cambridge university</b>
						</h5>
						<h6 class="w3-text-teal">
							<i class="fa fa-calendar fa-fw w3-margin-right"></i>Hoy en dia
						</h6>
						<p>Hace su doctorado en seguridad informatica</p>
						<br>
					</div>
				</div>

				<!-- End Right Column -->
			</div>

			<!-- End Grid -->
		</div>

		<!-- End Page Container -->
	</div>

	<footer class="w3-container w3-teal w3-center w3-margin-top">
		<p>Encuentrame en mis redes sociales</p>
		<i class="fa fa-facebook-official w3-hover-opacity"></i> <i
			class="fa fa-instagram w3-hover-opacity"></i> <i
			class="fa fa-snapchat w3-hover-opacity"></i> <i
			class="fa fa-pinterest-p w3-hover-opacity"></i> <i
			class="fa fa-twitter w3-hover-opacity"></i> <i
			class="fa fa-linkedin w3-hover-opacity"></i>
		<p>
			Diseñado por <a href="https://www.google.com/"
				target="_blank">w3.css</a>
		</p>
	</footer>

</body>
</html>

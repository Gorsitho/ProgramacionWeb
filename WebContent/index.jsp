<%@ page import="java.util.Vector"%>
<%@ page import="org.comercio.producto.Producto"%>
<%@ page import="org.comercio.user.usuarios"%>
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
<title>Openyourmind</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link href="css/carousel.css" rel="stylesheet">
<link href="css/estilo1.css" rel="stylesheet">
<link href="css/login.css" rel="stylesheet">


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
</head>
<style>

.carousel-caption h1 p, .carousel-caption h1{

font-size: 3.6em;
font-weight: bold;

}

#tituloPrincipal{
font: bold 4.0em Comic sans MS,Verdana,Geneva,sans-serif; 


}

.col-sm-4 p{

text-align : justify;

}
</style>
<body>
	<div class="navbar-wrapper">
		<div class="container">

			<nav class="navbar navbar-inverse navbar-static-top">
				<div class="container">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse" data-target="#navbar"
							aria-expanded="false" aria-controls="navbar">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="">Openyourmind</a>
					</div>
					<div id="navbar" class="navbar-collapse collapse">
						<ul class="nav navbar-nav">
							<li class="active"><a href="">Inicio</a></li>
							<li><a href="productos">Catalogo</a></li>
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
							<li><a href="usuario"><span
									class="glyphicon glyphicon-user"></span> Iniciar Sesion</a></li>
							<%
								} else {
							%>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false"><span class="glyphicon glyphicon-user"></span>
									<%=usuario%> <span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="usuario"><span
											class="glyphicon glyphicon-user"></span> Perfil</a></li>
									<li><a href="usuario/ajustes.jsp"><span
											class="glyphicon glyphicon-cog"></span> Ajustes</a></li>
									<li role="separator" class="divider"></li>
									<li><a href="login/salir.jsp"><span
											class="glyphicon glyphicon-log-out"></span> Cerrar sesion</a></li>
								</ul></li>
							<%
								}
							%>
							
							<li><a href="productos/carrito.jsp"><span
									class="glyphicon glyphicon-shopping-cart"></span><span
									class="badge"><%=total%></span> Carrito</a></li>
						</ul>
					</div>
				</div>
			</nav>

		</div>
	</div>


	<!-- Carousel
    ================================================== -->
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<img class="first-slide" src="imagenes/banner1.jpg"
					alt="First slide">
				<div class="container">
					<div class="carousel-caption">
						<h1>Aprende el poder de la lectura</h1>
						<p>"Un lector vive mil dias antes de morir, el que no lee,
							solo vive una."</p>

					</div>
				</div>
			</div>
			<div class="item">
				<img class="second-slide" src="imagenes/banner2.jpg"
					alt="Second slide">
				<div class="container">
					<div class="carousel-caption">
						<h1>Crea tu propia libreria virtual</h>
					</div>
				</div>
			</div>
			<div class="item">
				<img class="third-slide" src="imagenes/banner3.jpg"
					alt="Third slide">
				<div class="container">
					<div class="carousel-caption">
						<h1>Esperalo . . .</h1>
						<h1>Muy pronto.</h1>
						<p></p>
					</div>
				</div>
			</div>
		</div>
		<a class="left carousel-control" href="#myCarousel" role="button"
			data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
			aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel" role="button"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
	<!-- /.carousel -->

	<div class="container text-center">
		<h1 id="tituloPrincipal">Open your mind</h1>
		<br>
		<div class="row">
			<div class="col-sm-4">
				<img src="imagenes/question.jpg" class="proimg" alt="Image">
				<br>
				<p> ¿ Que es Openyourmind ? Openyourmind es una libreria virtual que nacio en el
				año 2017 con los desarrolladores Daniel Velasquez y Luis Mateo Marin. La idea
				de tener cualquier libro a la alcance de tu mano resulta genial. ¿ No lo crees ?</p>
			</div>
			<div class="col-sm-4">
				<img src="imagenes/principal2.gif" class="proimg" alt="Image">
				<br>
				<p>La celebraci&oacute;n del d&iacute;a del libro se remonta a
					principios del siglo XX. La historia del libro se hace festiva y
					surgen actividades literarias en toda Espa&ntilde;a. Hoy, el
					d&iacute;a 23 de abril se celebra en todo el mundo, el d&iacute;a
					del libro internacional. El Origen del d&iacute;a del libro se
					remonta a 1926. El 23 de abril de 1616 fallec&iacute;an Cervantes,
					Shakespeare e Inca Garcilaso de la Vega. Tambi&eacute;n en un 23 de
					abril nacieron o murieron otros escritores eminentes como Maurice
					Druon, K. Laxness, Vladimir Nabokov, Josep Pla o Manuel
					Mej&iacute;a Vallejo. Por este motivo, esta fecha tan
					simb&oacute;lica para la literatura universal fue la escogida por
					la Conferencia General de la UNESCO para rendir un homenaje mundial
					al libro y sus autores, y alentar a todos, en particular a los
					m&aacute;s j&oacute;venes, a descubrir el placer de la lectura y
					respetar la irreemplazable contribuci&oacute;n de los creadores al
					progreso social y cultural.</p>
			</div>
			<div class="col-sm-4">
				<div class="well">
					<!-- Subscribe section -->
<div class="w3-container w3-black w3-padding-32">
	<h1>SUSCRIBETE</h1>
	<p>Grandes ofertas te est&aacute;n esperando</p>
	<p>
		<input class="w3-input w3-border" type="text"
			placeholder=" Ingresa tu e-mail" style="width: 100%">
	</p>
	<button type="button" class="w3-button w3-red w3-margin-bottom">Enviar solicitud</button>
</div>
				</div>
			
				<img src="imagenes/principal1.gif" class="proimg" alt="Image">
				<br>
				<p>Los libros son uno de las principales y m&aacute;s accesibles
					fuentes de informaci&oacute;n y conocimiento para miles de millones de
					personas en el mundo. Han permanecidos a trav&eacute;s de los años,
					difundiendo el conocimiento y la historia de la Humanidad. El
					contenido y utilidad de los libros abarca para infinidades
					extensiones y temas; los hay recreativos (cuentos, novelas, obras,
					narraciones, etc.), informativos (novedades científicas,
					acontecimientos), de consulta (diccionarios, enciclopedias, atlas),
					científicos, educativos, contables, entre otros.</p>
			
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>


	

<!-- Footer -->
<footer class="w3-padding-64 w3-light-grey w3-small w3-center"
	id="footer">
	<div class="w3-row-padding">
		<div class="w3-col s4">
			<h4>Contactanos</h4>
			<p>¿ Tienes alguna pregunta ? Animate.</p>
			<form action="/action_page.php" target="_blank">
				<p>
					<input class="w3-input w3-border" type="text" placeholder="Nombre"
						name="Name" required>
				</p>
				<p>
					<input class="w3-input w3-border" type="text" placeholder="Email"
						name="Email" required>
				</p>
				<p>
					<input class="w3-input w3-border" type="text" placeholder="Asunto"
						name="Subject" required>
				</p>
				<p>
					<input class="w3-input w3-border" type="text" placeholder="Mensaje"
						name="Message" required>
				</p>
				<button type="submit" class="w3-button w3-block w3-black">Enviar</button>
			</form>
		</div>

		<div class="w3-col s4">
			<h4>Acerca de nosotros</h4>
			<p>
				<a href="#">Conocenos</a>
			</p>

			<p>
				<a href="#">Soporte</a>
			</p>
			<p>
				<a href="#">Localizacion</a>
			</p>
			<p>
				<a href="#">Envio</a>
			</p>
			<p>
				<a href="#">Pago</a>
			</p>
			<p>
				<a href="#">Tarjeta de regalo</a>
			</p>
			<p>
				<a href="#">Return</a>
			</p>
			<p>
				<a href="#">Ayuda</a>
			</p>
		</div>

		<div class="w3-col s4 w3-justify">
			<h4>Informacion</h4>
			<p>
				<i class="fa fa-fw fa-map-marker"></i> Openyourmind
			</p>
			<p>
				<i class="fa fa-fw fa-phone"></i> 3145978053
			</p>
			<p>
				<i class="fa fa-fw fa-envelope"></i> openyourmind@gmail.com	
			</p>
			<h4>Aceptamos</h4>
			<p>
				<i class="fa fa-fw fa-credit-card"></i> Tarjeta de credito
			</p>
			<br> <i
				class="fa fa-facebook-official w3-hover-opacity w3-large"></i> <i
				class="fa fa-instagram w3-hover-opacity w3-large"></i> <i
				class="fa fa-snapchat w3-hover-opacity w3-large"></i> <i
				class="fa fa-pinterest-p w3-hover-opacity w3-large"></i> <i
				class="fa fa-twitter w3-hover-opacity w3-large"></i> <i
				class="fa fa-linkedin w3-hover-opacity w3-large"></i>
		</div>
	</div>
</footer>
	<div class="container">
		<footer>
			<p class="pull-right">
				<a href="#">Back to top</a>
			</p>
			<p>
				&copy; 2017 Company, Inc. &middot; <a href="#">Privacidad</a>
				&middot; <a href="#">Condiciones</a>&middot; <a href="#">Ayuda</a>
			</p>
		</footer>
	</div>

</body>
</html>
<%@ page import="java.util.Vector"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="org.comercio.tienda.UnProducto"%>
<%@ page import="org.comercio.producto.Producto"%>
<%
	String code = "";
	code = request.getParameter("codigo");
	ArrayList<Producto> lista = new ArrayList<Producto>() ;
	if(code==null){
	response.sendRedirect("../");	
	}else{
	int pro_codigo = Integer.parseInt(code);
	UnProducto tienda = new UnProducto();
	lista = tienda.getProducto(pro_codigo);
	}
%>
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


<title>Detalles</title>

					<%
						String usuario = "";
						try {
							usuario = request.getUserPrincipal().getName();
						} catch (Exception e) {
							System.out.println("Error: " + e.toString());
						}
						%>
						
						<% if(usuario ==""){ 
						%>
					<frameset rows=’100%, *’ frameborder=no framespacing=0 border=0> 
			<frame src="../usuario/index.jsp"
name=mainwindow frameborder=no framespacing=0 marginheight=0 marginwidth=0></frame>
		</frameset>
		<noframes>
			Su navegador no soporta frames. Le recomendamos actualizar su navegador.
		</noframes>
						<% }else{%>

<!-- Bootstrap Core CSS -->
<link href="../css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/shop-item.css" rel="stylesheet">

<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700"
	rel="stylesheet">
<link href="../css/estilo.css" rel="stylesheet">
<link href="../css/login.css" rel="stylesheet">
</head>
<body>


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
					<li class="active"><a href="../">Inicio</a></li>
					<li><a href="../productos">Productos</a></li>
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

						
					<%	if (usuario == "") {  	%>
				
					<li><a href="../usuario"><span
							class="glyphicon glyphicon-user"></span> Iniciar Sesion</a></li>
			
			
					<%	} else {
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

	<!-- Formulario de Login -->
	<!--<jsp:include page="../login/Login.jsp"></jsp:include>  -->
	<!-- /Formulario de Login -->

	<!-- Page Content -->
	<div class="container theme-showcase" role="main">

		<div class="row">

			<div class="card">
				<div class="container-fliud">
					<div class="wrapper row">
						<%
							for (Producto kkk : lista) {
						%>
						<div class="preview col-md-6">
							<div class="preview-pic tab-content">
								<div class="tab-pane active" id="pic-1">
									<img src="../<%=kkk.getImagen()%>" />
								</div>
							</div>
						</div>
						<div class="details col-md-6">
							<h3 class="product-title"><%=kkk.getNombre()%></h3>
							<div class="rating">
								<div class="stars">
									<span class="fa fa-star checked"></span> <span
										class="fa fa-star checked"></span> <span
										class="fa fa-star checked"></span> <span class="fa fa-star"></span>
									<span class="fa fa-star"></span>
								</div>
								<span class="review-no">64 vistas</span>
							</div>
							<p class="product-description"><%=kkk.getDescripcion_larga()%></p>
							<h4 class="price">
								Precio: <span>$<%=kkk.getPrecio()%></span>
							</h4>
							<p class="vote">
								<strong>74%</strong> de las personas han disfrutado este libro! <strong>(24
									votos)</strong>
							</p>
							<form action="../Comprar" method="post">
								<p>
									<input type="hidden" name="codigo" id="codigo"
										value="<%=kkk.getCodigo()%>" /> cantidad <input type="number"
										name="cantidad" min="1" max="500" value="1">
								</p>
								<div class="action">
									<button class="add-to-cart btn btn-default" type="submit">Agregar al carrito</button>
									<button class="like btn btn-default" type="button">
										<span class="fa fa-heart"></span>
									</button>
								</div>
							</form>
						</div>
						<%
							}
						%>
					</div>
				</div>
			</div>

			<div class="well">

				<div class="text-right">
					<a class="btn btn-success">Leave a Review</a>
				</div>

				<hr>

				<div class="row">
					<div class="col-md-12">
						<span class="glyphicon glyphicon-star"></span> <span
							class="glyphicon glyphicon-star"></span> <span
							class="glyphicon glyphicon-star"></span> <span
							class="glyphicon glyphicon-star"></span> <span
							class="glyphicon glyphicon-star-empty"></span> Anonimo <span
							class="pull-right">Hace 2 meses</span>
						<p>Este libro fue excelente en términos de calidad. me gustaría
Definitivamente comprar otro en esta tienda!</p>
					</div>
				</div>

				<hr>

				<div class="row">
					<div class="col-md-12">
						<span class="glyphicon glyphicon-star"></span> <span
							class="glyphicon glyphicon-star"></span> <span
							class="glyphicon glyphicon-star"></span> <span
							class="glyphicon glyphicon-star"></span> <span
							class="glyphicon glyphicon-star-empty"></span> Luisa Fernanda <span
							class="pull-right">Hace 3 meses</span>
						<p>Ya he pedido otro para mi hermano, esta genial. Lo recomiendo muchisimo</p>
					</div>
				</div>

				<hr>

				<div class="row">
					<div class="col-md-12">
						<span class="glyphicon glyphicon-star"></span> <span
							class="glyphicon glyphicon-star"></span> <span
							class="glyphicon glyphicon-star"></span> <span
							class="glyphicon glyphicon-star"></span> <span
							class="glyphicon glyphicon-star-empty"></span> GaRen2015 <span
							class="pull-right">Hace 1 hora</span>
						<p>Me gusto bastante la historia, este es uno de mis autores favoritos.</p>
					</div>
				</div>

			</div>

		</div>

	</div>

	<!-- /.container -->

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

	<!-- jQuery -->
	<script src="../js/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="../js/bootstrap.min.js"></script>
	
	<% } %>

</body>

</html>
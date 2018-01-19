<%@ page import="java.util.Vector"%>
<%@ page import="org.comercio.producto.Producto"%>

<%
	Vector compras = (Vector) session.getAttribute("compras");
	int total = 0;
	int subtotal = 0, cantidad = 1;
	double totalPrecio = 0;
	if (compras == null) {
		total = 0;
	} else {
		for (int i = 0; i < compras.size(); i++) {
			Producto compra = (Producto) compras.elementAt(i);
			total = total + compra.getCantidad();
			totalPrecio = totalPrecio + (compra.getPrecio() * compra.getCantidad());
		}
		subtotal = compras.size();
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

<title>Openyourmind</title>

<!-- Bootstrap Core CSS -->
<link href="../css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/shop-homepage.css" rel="stylesheet">

<link href="../css/login.css" rel="stylesheet">

<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="../js/bootstrap.min.js"></script>

<script src="../js/script2.js"></script>

</head>

<body>
	<div id="div1">
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
						<li><a href="../productos">Catalogo</a></li>
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
						
						<li class="active"><a href="carrito.jsp"><span
								class="glyphicon glyphicon-shopping-cart"></span><span
								class="badge"><%=total%></span> Carrito</a></li>
					</ul>
				</div>
			</div>
		</nav>

		<%
			if (compras == null) {
		%>

	
		<div class="container">
			<h2>Lo siento, tu carrito de compras está vacío.</h2>
			<br>
		<img src="../imagenes/carritoM1.gif" class="proimg" alt="Image" width=250 height=250 center>
			<p>
				Ingresa primero a tu cuenta de Openyoumind para disfrutar de nuestros productos.Ademas, 
				podras obtener grandes ofertas.<a href="../"> Openyourmind.com </a>
			</p>
			<p>Recuerda mantenerte informado para que te enteres de las ofertas, eventos, noticias y todo
			lo relacionado al habito de la lectura. Suscribete y obten todos estos beneficios</p>
		</div>
		<%
			} else {
				if (compras.size() == 0) {
					compras.clear();
					session.removeAttribute("compras");
					response.sendRedirect("carrito.jsp");
				} else {
		%>
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="page-header">
						<h2 class="sub-header">Carrito de compras</h2>
					</div>
					<div class="table-responsive">
						<table class="table table-condensed">
							<thead>
								<tr>
									<th></th>
									<th>Producto</th>
									<th>Valor Unidad</th>
									<th>Cantidad</th>
									<th>Valor Total</th>
								</tr>
							</thead>
							<tbody>
								<%
									for (int i = 0; i < compras.size(); i++) {
												Producto compra = (Producto) compras.elementAt(i);
												cantidad = compra.getCantidad();
								%>
								<tr>
									<td><img src="../<%out.println(compra.getImagen());%>"
										alt="" width="82" height="102"></td>
									<td>
										<%
											out.println(compra.getNombre());
										%> <br> <%
 	out.println(compra.getDescripcion());
 %> <br> <a href="javascript:removeCompra(<%=i%>)"
										id="borrar<%=i%>">
											<button class="btn btn-sm btn-link">Borrar</button> <input
											type="hidden" id="index" name="index" value="<%=i%>">
									</a>
									</td>
									<td>$ <%
										out.println(compra.getPrecio());
									%></td>
									<td>
									<%out.println(compra.getCantidad());%>
									</td>
									<td>$ <%
										out.println(compra.getPrecio() * compra.getCantidad());
									%></td>
								</tr>
								<%
									}
								%>
							</tbody>
						</table>
					</div>
					<div>
						<input type="hidden" name="size" id="size"
							value="<%=compras.size()%>" />
						<h4 class="text-right">
							<%
								out.println("Subtotal(" + subtotal + " productos)");
							%>
						</h4>
						<h4 class="text-right">
							<%
								out.println("Total(" + total + " items): $" + totalPrecio);
							%>
						</h4>
						<a href="../pedido">
							<button class="btn btn-sm btn-warning">Comprar</button>
						</a>
						<button class="btn btn-sm btn-danger" id="vaciar">
							Vaciar carro <span class="glyphicon glyphicon-shopping-cart"></span>
						</button>
					</div>
				</div>
				<!--  
				<div class="col-lg-3">
					<div class="thumbnail">
						<img src="http://placehold.it/320x150" alt="">
						<div class="caption">
							<h4 class="pull-right">$24.99</h4>
							<h4>
								<a href="productoDetalle.jsp">First Product</a>
							</h4>
							<p>
								See more snippets like this online store item at <a
									target="_blank" href="http://www.bootsnipp.com">Bootsnipp -
									http://bootsnipp.com</a>.
							</p>
						</div>
						<div class="ratings">
							<p class="pull-right">15 reviews</p>
							<p>
								<span class="glyphicon glyphicon-star"></span> <span
									class="glyphicon glyphicon-star"></span> <span
									class="glyphicon glyphicon-star"></span> <span
									class="glyphicon glyphicon-star"></span> <span
									class="glyphicon glyphicon-star"></span>
							</p>
						</div>
					</div>
				</div>
				-->
		</div>
		</div>
		<%
			}
			}
		%>

	</div>
	<hr>

	<div class="container">
		<!-- Footer -->
		<footer>
			<div class="row">
				<div class="col-lg-12">
					<p>
						&copy; 2017 Company, Inc. &middot; <a href="#">Privacidad</a>
						&middot; <a href="#">Condiciones</a>&middot; <a href="#">Ayuda</a>
					</p>
				</div>
			</div>
		</footer>

	</div>
	<!-- /.container -->

</body>

</html>
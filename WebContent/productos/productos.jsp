<%@ page import="org.comercio.tienda.Tienda"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="org.comercio.producto.Producto"%>
<!--
<script src="../js/script4.js"></script>
-->		<style>
		img{

padding: 4px;

box-shadow: black 5px 5px 10px;
border-radius: 20px;

-webkit-transition:-webkit-transform 0.3s ease-in-out 0.1s;
margin-bottom: 25px;
}
		img:hover{
		
		-webkit-transform:scale(1.2);
		
		}

.w3-container p {

box-shadow: black 5px 5px 10px;
border-radius: 2px;
padding-left:15px;
background-color: #E0F8F1;
}
.w3-container p:hover{

background-color: lightblue;
}
	
		</style>
<div class="container">
	<div class="page-header">
		<h1>Catalogo de lectura</h1>
	</div>
	<div class="row">
		<%
			String categoria = "";
			categoria = request.getParameter("categoria");
			Tienda tienda = new Tienda();
			ArrayList<Producto> lista = new ArrayList<Producto>();
			int i = 0, size = 0;
			if (categoria == null) {
				response.sendRedirect("../");
			} else {
				int pro_categoria = Integer.parseInt(categoria);
				lista = tienda.getProductos(pro_categoria);
			}
			for (Producto producto : lista) {
		%>

		<div class="col-sm-3">
			<div class="w3-container">
				<a href="productoDetalle.jsp?codigo=<%=producto.getCodigo()%>"><img
					src="../<%=producto.getImagen()%>" alt="" class="proimg"></a>
					<br><br>
				<p><%=producto.getNombre()%><br> <b><%=producto.getDescripcion()%></b><br>
					<b>$<%=producto.getPrecio()%></b>
				</p>
			</div><br>
		</div>
		
		
		<%
			i++;
			}
			size = i;
		%>
		<input type="hidden" name="size" id="size" value="<%=size%>" />
	</div>
</div>


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

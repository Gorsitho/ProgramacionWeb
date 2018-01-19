function carrito(producto) {
	var size = document.getElementById("size").value;
	var cantidad = document.getElementById("cantidad").value;
	var codigo = document.getElementById("codigo").value;
	for (var i = 0; i <=size; i++) {
		$("#carrito"+i).click(function() {
			alert(codigo+" carrito"+i);
			$.post("../Comprar", {
				cantidad : cantidad,
				codigo : codigo
			}, function() {
				$("#productos").load("index.jsp"+" #productos");
			});
		});
	}
}
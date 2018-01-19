<%@ page import="org.comercio.tienda.Mcategoria"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="org.comercio.categoria.Categoria"%>
<%
String cat = "";
int defec = 0;
cat = request.getParameter("cat");
if(cat==null){
	defec = -1;
}else{
defec= Integer.parseInt(cat);
}
%>
<input type="hidden" name="aa" id="aa" value="<%=defec%>" /> 
<script src="../js/script1.js"></script>

      <div class="row">

        <div class="col-sm-2 text-center">
          <div class="list-group">
          <% 
 			Mcategoria mcategoria = new Mcategoria();
 			ArrayList <Categoria> lista = mcategoria.getCategoria();
			int contador = 1,size=0;	
 			for(Categoria categoria : lista){	
 			if(contador==1){	
 			%>
 			<a id="c<%=categoria.getCodigo()%>" href="javascript:getProductos(<%=categoria.getCodigo()%>)" class="list-group-item active"><%=categoria.getNombre()%></a>
 			<%
 			if(defec == -1){
 			defec = categoria.getCodigo();
 			}
 			}else {
 			%>	
            <a id="c<%=categoria.getCodigo()%>" href="javascript:getProductos(<%=categoria.getCodigo()%>)" class="list-group-item"><%=categoria.getNombre()%></a>
          <% 
 			}
          %>
          <% 
 			contador++;
            size = categoria.getCodigo();
 			}
          %>
        <input type="hidden" name="size" id="size" value="<%=size%>" />
        <input type="hidden" name="si" id="si" value="<%=defec%>" />    
		</div>
        </div><!-- /.col-sm-3 -->
        
        <div id="div_productos" class="col-sm-10">
        <jsp:include page="productos.jsp">
        	<jsp:param name="categoria" value="<%= defec %>" />
        </jsp:include>
          </div>
      </div>
      


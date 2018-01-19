package org.comercio.user;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.ws.rs.PathParam;
import org.comercio.utilidad.BaseDato;
public class BaseUsuario {

	public ArrayList<usuarios> getusuarios(){
		ArrayList<usuarios> lista = new ArrayList<usuarios>();
		BaseDato basedato = new BaseDato();
		Connection conexion1 = null;
		Statement sentencia1 = null;

		ResultSet rs1 = null;
		String sql = "";
		try{
			
			conexion1 = basedato.getConexion();
			sentencia1 = conexion1.createStatement();
			sql = "select * FROM usuario";
			
			rs1 = sentencia1.executeQuery(sql);

			while(rs1.next()){

			String nombre = rs1.getString("usu_nombre");
			
			String imagen = rs1.getString("usu_imagen");
			;
			
		 usuarios nuevo = new usuarios();

			
			nuevo.setNombre_usuario(nombre);
			
			nuevo.setImagen(imagen);
			lista.add(nuevo);

			}

			}

			catch(Exception e){

			System.out.println("Error: " + e.toString());

			}

			return new ArrayList<usuarios>(lista);

			}
	
				
	
}

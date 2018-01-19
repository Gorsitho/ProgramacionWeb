package org.comercio.user;

public class usuarios {
    String nombre_usuario;

	String imagen;

	
	public usuarios() {
		super();
		// TODO Auto-generated constructor stub
	}

	public usuarios(String nombre_usuario, String imagen) {
		super();
		this.nombre_usuario = nombre_usuario;
		this.imagen = imagen;
	}

	public String getNombre_usuario() {
		return nombre_usuario;
	}

	public void setNombre_usuario(String nombre_usuario) {
		this.nombre_usuario = nombre_usuario;
	}

	public String getImagen() {
		return imagen;
	}

	public void setImagen(String imagen) {
		this.imagen = imagen;
	}

	@Override
	public String toString() {
		return "usuarios [nombre_usuario=" + nombre_usuario + ", imagen=" + imagen + "]";
	}

	


}
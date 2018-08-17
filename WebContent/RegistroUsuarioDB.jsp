<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registro de usuario</title>
</head>
<style>
input[type=submit] {
    background-color: #1a53ff;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

input[type=submit]:hover {
    background-color: #45a049;
}

table {
	margin: 0 auto;
}
</style>
<body>
<%@page import="java.sql.*" %>
<jsp:include page="Header.jsp"></jsp:include><br/>
	<%
	String nombre = request.getParameter("nombre");
	String apellidoP = request.getParameter("apellidoP");
	String apellidoM = request.getParameter("apellidoM");
	String domicilio = request.getParameter("domicilio");
	String telefono = request.getParameter("telefono");
	String usuario = request.getParameter("usuario");
	String contra = request.getParameter("contra");
	String contraConf = request.getParameter("contraConf");
	
	if (nombre.equals("") || apellidoP.equals("") || apellidoM.equals("") || domicilio.equals("") || telefono.equals("") || usuario.equals("") || contra.equals("")){
		%>
		<jsp:include page="Header.jsp"></jsp:include>
		
		
		<table align="center">
		<tr>
			<td><p style="color:rgb(255,0,0);" align="center">Por favor llena la información solicitada</p><td>
			
		</tr>
		</table>
		<table align="center">
		<tr >
			<td>
				<form action="RegistroUsuario.jsp" method="get">
    			<input type="submit" value="Regresar" name="Submit" id="frm1_submit" />
				</form>			
			</td>
		</tr>
		</table>
		<%
		
	}else{
	
	if (!contra.equals(contraConf)){
		%>
		<jsp:include page="Header.jsp"></jsp:include>
		
		
		<table align="center">
		<tr>
			<td><p style="color:rgb(255,0,0);" align="center">La contraseña no coincide, por favor ingrese las dos contraseñas correctamente</p><td>
			
		</tr>
		</table>
		<table align="center">
		<tr >
			<td>
				<form action="RegistroUsuario.jsp" method="get">
    				<input type="submit" value="Regresar" name="Submit" id="frm1_submit" />
				</form>	
			</td>
		</tr>
		</table>
		<% 
		
	}else{
		
	
	// Database
		Class.forName("com.mysql.jdbc.Driver");
		String query="{CALL creaUsuario(?,?,?,?,?,?,?)}";
		ResultSet rs;
		int status;
		try{
		
		Connection auditoriodbConexion=DriverManager.getConnection("jdbc:mysql://35.196.88.143:3306/auditoriodb","auditorio","auditorio123Y#");
		// creaUsuario(usuario,nombre,apellidoP,apellidoM,domicilio,telefono,contra)
		
		CallableStatement stmt=auditoriodbConexion.prepareCall(query);
		
		stmt.setString(1, usuario);
		stmt.setString(2, nombre);
		stmt.setString(3, apellidoP);
		stmt.setString(4, apellidoM);
		stmt.setString(5, domicilio);
		stmt.setString(6, telefono);
		stmt.setString(7, contra);
		rs = stmt.executeQuery();
		
		%>
		<h3 style="text-align: center">Usuario creado</h3>
		
			<form action="Home.jsp" method="post">
				<table width="33%">
				<tr>
					<td align="center" width="33%"><input type="submit"
					name="buttonOpt" id="button" value="Regresar"></td>
				</table>
			</form>
		<%
		}catch(Exception e){
			String msg = e.getMessage();
			out.println("Ha habido un error en la base de datos: "+msg);
			
		}
	}
	}
	
	%>

</body>
</html>
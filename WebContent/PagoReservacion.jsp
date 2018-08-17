<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Pago reservacion</title>
</head>
<style>
.center {
    display: block;
    margin-left: auto;
    margin-right: auto;
}

table {
	  margin: 0 auto;
	  width: 45%;
	  text-align: right;	  
}

input[type=submit] {
    width: 100%;
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

input[type=password], select {
    width: 100%;
    height: 40px;
    padding-left: 10px;
    padding-right: 10px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

table.blueTable {
width: 40%;
vertical-align: middle;
  text-align: right;
  border-collapse: collapse;
  margin: 0 auto;
}


table.blueTable td + td{
text-align: left;
    width: 100%;
    height: 40px;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}


</style>

<body>
<%@page import="java.sql.*" %>
<jsp:include page="Header.jsp"></jsp:include><br/>
		<%
		String sesion = (String) session.getAttribute("Sesion"); 
		String evento = request.getParameter("evento");
		String asiento = request.getParameter("asiento");
		String zona = request.getParameter("zona");
		String idReservacion = request.getParameter("idReservacion");
		int IdReservacionI = 0;
		  if (sesion == null){
			 response.sendRedirect("UserLogin.jsp"); 
		  }else{
		
		
		if (idReservacion == null){
			response.sendRedirect("ConsultaReservacion.jsp");
		}else{
		
		IdReservacionI = Integer.parseInt(idReservacion);
		int zonaI =Integer.parseInt(zona);
		int asientoI =Integer.parseInt(asiento);
		
		String button = request.getParameter("buttonOpt");
						
		Class.forName("com.mysql.jdbc.Driver");
		
		String query="select ID_EVENTO, from_unixtime(FECHA_EVENTO, '%m-%d-%Y'), from_unixtime(FECHA_EVENTO, '%H:%i:%s') from EVENTO where EVENTO='"+ evento +"';";
		String idUser="select ID_USUARIO from USUARIO where USUARIO='"+ sesion +"';";
		ResultSet rs;
		ResultSet rs1;
		ResultSet rs2;
		
		Connection auditoriodbConexion=DriverManager.getConnection("jdbc:mysql://35.196.88.143:3306/auditoriodb","auditorio","auditorio123Y#");

		Statement getList=auditoriodbConexion.createStatement();
		Statement getid=auditoriodbConexion.createStatement();
		
		PreparedStatement update;
		String QueryUpdate= "update RESERVACION set ESTADO=? where ID_RESERVACION=?;";
		update=auditoriodbConexion.prepareStatement(QueryUpdate);
		update.setInt(1, 0);
		update.setInt(2, IdReservacionI);
		update.executeUpdate();
		
		
		
		rs = getList.executeQuery(query);
		rs1 = getid.executeQuery(idUser);
		rs.first();
		rs1.first();
		int idEvento=rs.getInt(1);	
		int usuario=rs1.getInt(1);
		String fecha = rs.getString(2);
		String hora = rs.getString(3);
	
		// creaVenta(monto , usuario , personal , evento, zona , asiento)
			String procedure="{CALL creaVenta(?,?,?,?,?,?)}";
		
			CallableStatement stmt=auditoriodbConexion.prepareCall(procedure);
			
			
			stmt.setInt(1, 250);
			stmt.setInt(2, usuario);
			stmt.setInt(3, 7);
			stmt.setInt(4, idEvento);
			stmt.setInt(5, zonaI);
			stmt.setInt(6, asientoI);
			rs2 = stmt.executeQuery();	
			rs2.first();
		
		if (rs2.getInt(1) != 0){
			
			session.removeAttribute("Zona");
			session.removeAttribute("Hora");
			session.removeAttribute("Accion");
			session.removeAttribute("Evento");
			%>
			<h1 style="text-align: center">Boleto</h1>
					<img class="center" src="images/auditorio_logo.jpg">
			<table class="blueTable">			
			<tr>
				<td><label for="evento">ID: </label></td>
				<td><label for="evento"><%out.println(rs2.getInt(1));%></label></td>
			</tr>
			<tr>
				<td><label for="evento">Evento: </label></td>
				<td><label for="evento"><%out.println(evento);%></label></td>
			</tr>
			<tr>
				<td><label for="evento">Fecha: </label></td>
				<td><label for="fecha"><%out.println(fecha);%> </label></td>
			</tr>
			<tr>
			<td><label for="evento">Hora: </label></td>
				<td><label for="hora"><%out.println(hora);%></label></td>
			</tr>
			<tr>
			<td><label for="evento">Zona: </label></td>
				<td><label for="hora"><%out.println(zona);%></label></td>
			</tr>
			<tr>
			<td><label for="evento">asiento: </label></td>
				<td><label for="hora"><%out.println(asiento);%></label></td>
			</tr>
		</table>
		 <%
		}else{
			out.println("lugares ocupados");	
		}
				
		}
		}
		 %>
</body>
</html>

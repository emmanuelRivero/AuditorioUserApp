<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Consulta de compras</title>
</head>
<style>
table.blueTable {
  border: 1px solid #1C6EA4;
  background-color: #EEEEEE;
  text-align: center;
  border-collapse: collapse;

}
table.blueTable td, table.blueTable th {
  border: 1px solid #AAAAAA;
  padding: 3px 2px;
}
table.blueTable tbody td {
  font-size: 16px;
}
table.blueTable tr:nth-child(even) {
  background: #D0E4F5;
}
table.blueTable thead {
  background: #1C6EA4;
  background: -moz-linear-gradient(top, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
  background: -webkit-linear-gradient(top, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
  background: linear-gradient(to bottom, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
  border-bottom: 2px solid #444444;
}
table.blueTable thead th {
  font-size: 15px;
  font-weight: bold;
  color: #FFFFFF;
  border-left: 2px solid #D0E4F5;
}
table.blueTable thead th:first-child {
  border-left: none;
}

table.blueTable tfoot {
  font-size: 14px;
  font-weight: bold;
  color: #FFFFFF;
  background: #D0E4F5;
  background: -moz-linear-gradient(top, #dcebf7 0%, #d4e6f6 66%, #D0E4F5 100%);
  background: -webkit-linear-gradient(top, #dcebf7 0%, #d4e6f6 66%, #D0E4F5 100%);
  background: linear-gradient(to bottom, #dcebf7 0%, #d4e6f6 66%, #D0E4F5 100%);
  border-top: 2px solid #444444;
}
table.blueTable tfoot td {
  font-size: 14px;
}
table.blueTable tfoot .links {
  text-align: right;
}
table.blueTable tfoot .links a{
  display: inline-block;
  background: #1C6EA4;
  color: #FFFFFF;
  padding: 2px 8px;
  border-radius: 5px;
}

</style>
<body>
<%@page import="com.auditorio.date.*"%>
<%@page import="java.sql.*" %>
	<% String sesion= (String) session.getAttribute("Sesion"); 
	  if (sesion == null){
		  response.sendRedirect("UserLogin.jsp");
	  }else{
	
	%>
	<jsp:include page="Header.jsp"></jsp:include><br/>
	<jsp:include page="ConsultaCompras.html"></jsp:include><br/>
	
	<%
	long timeI=0;
	long timeF=0;
	String evento=request.getParameter("evento");
	String fechaI = request.getParameter("fechaInicial");
	String fechaF = request.getParameter("fechaFinal");
	
	
	String queryVenta;
	ResultSet rs1;
	ResultSet rs2;
	
	if (evento == null){

	}else{
		if (fechaI.equals("")){
			timeI=0;
		}else{
			fechaI = fechaI + " 00:00:00";
			timeI = epochTime.convert(fechaI);
		}
		
		if (fechaF.equals("")){
			timeF = System.currentTimeMillis() / 1000L;
		}else{
			fechaF = fechaF + " 23:59:59";
			timeF = epochTime.convert(fechaF);
		}
		
		if (timeF < timeI){
			response.sendRedirect("Eventos.jsp");
		}else{
		
		// Database
		Class.forName("com.mysql.jdbc.Driver");
		String idUser="select ID_USUARIO from USUARIO where USUARIO='"+ sesion +"';";
		
		
		
		Connection auditoriodbConexion=DriverManager.getConnection("jdbc:mysql://35.196.88.143:3306/auditoriodb","auditorio","auditorio123Y#");
		// creaPersonal(in newUsuario ,Pnombre , APaterno , AMaterno , dom , tel ,Ppuesto , contraseña)
		
		Statement getId=auditoriodbConexion.createStatement();
		Statement getVenta=auditoriodbConexion.createStatement();
		
		rs1 = getId.executeQuery(idUser);
		rs1.first();
		int idUsuario = rs1.getInt(1);
		
		queryVenta=SetQueryConsulta.getVenta(evento, idUsuario, timeI, timeF);
		rs2 = getVenta.executeQuery(queryVenta);
	
	%>
	<form action="GeneraBoleto.jsp" method="post">
	<table class="blueTable">
		<thead>
		<tr>	
			<th>ID:</th>
			<th>Evento:</th>
			<th>Fecha del evento:</th>
			<th>Monto:</th>
			<th>Fecha de compra:</th>
			<th>Zona:</th>
			<th>Asiento:</th>
		</tr>
		</thead>
		<% 
			while(rs2.next()){
			%>
			<tr>
				<td><input type="radio" name="idVenta"
					value="<%=rs2.getInt(1) %>" id="idVenta"><%=rs2.getInt(1) %></td>
				<td><input type="hidden" id="evento" name="evento" value="<%=rs2.getString(4) %>"><%=rs2.getString(4) %></td>
				<td><%=rs2.getString(5) %></td>
				<td><%=rs2.getInt(2) %></td>
				<td><%=rs2.getString(3) %></td>
				<td><input type="hidden" id="zona" name="zona" value="<%=rs2.getString(6) %>"><%=rs2.getInt(6) %></td>
				<td><input type="hidden" id="asiento" name="asiento" value="<%=rs2.getString(7) %>"><%=rs2.getInt(7) %></td>
			</tr>
			<% 
			}
		%>		
	
	</table>
			
			<table>
				<tr>
					<td align="center" width="33%"><input type="submit"
					name="buttonOpt" id="button" value="Generar Boleto"></td>
				</table>
			</form>
	
	<%
	}
	}
	 }
	%>
	
</body>
</html>
package com.auditorio.date;

public class SetQueryConsulta {
	public static String getVenta(String evento, int idUsuario, long fechaI, long fechaF) {
		String query;
		
		if (evento.equals("") && fechaI !=0){
			query = "select V.ID_VENTA, V.MONTO, from_unixtime(V.FECHA, '%m-%d-%Y %H:%i:%s'), E.EVENTO, from_unixtime(E.FECHA_EVENTO, '%m-%d-%Y %H:%i:%s'), V.ID_ZONA, V.ASIENTO_NUM FROM VENTA AS V JOIN USUARIO AS U ON U.ID_USUARIO=V.ID_USUARIO JOIN EVENTO AS E ON V.ID_EVENTO=E.ID_EVENTO WHERE U.ID_USUARIO="+idUsuario+" AND ID_PERSONAL=7+ AND E.FECHA_EVENTO between "+fechaI+" AND "+fechaF+";";
			return query;
		}else if (evento.equals("") && fechaI == 0){
			query= "select V.ID_VENTA, V.MONTO, from_unixtime(V.FECHA, '%m-%d-%Y %H:%i:%s'), E.EVENTO, from_unixtime(E.FECHA_EVENTO, '%m-%d-%Y %H:%i:%s') ,V.ID_ZONA, V.ASIENTO_NUM FROM VENTA AS V JOIN USUARIO AS U ON U.ID_USUARIO=V.ID_USUARIO JOIN EVENTO AS E ON V.ID_EVENTO=E.ID_EVENTO WHERE U.ID_USUARIO="+idUsuario+" AND ID_PERSONAL=7;";	
			return query;
		}else if (!evento.equals("") && fechaI ==0){
			query= "select V.ID_VENTA, V.MONTO, from_unixtime(V.FECHA, '%m-%d-%Y %H:%i:%s'), E.EVENTO, from_unixtime(E.FECHA_EVENTO, '%m-%d-%Y %H:%i:%s'), V.ID_ZONA, V.ASIENTO_NUM FROM VENTA AS V JOIN USUARIO AS U ON U.ID_USUARIO=V.ID_USUARIO JOIN EVENTO AS E ON V.ID_EVENTO=E.ID_EVENTO WHERE U.ID_USUARIO="+idUsuario+" AND ID_PERSONAL=7 AND E.EVENTO='"+evento+"';";				
			return query;
		}else if (!evento.equals("") && fechaI != 0){
			query= "select V.ID_VENTA, V.MONTO, from_unixtime(V.FECHA, '%m-%d-%Y %H:%i:%s'), E.EVENTO, from_unixtime(E.FECHA_EVENTO, '%m-%d-%Y %H:%i:%s'), V.ID_ZONA, V.ASIENTO_NUM FROM VENTA AS V JOIN USUARIO AS U ON U.ID_USUARIO=V.ID_USUARIO JOIN EVENTO AS E ON V.ID_EVENTO=E.ID_EVENTO WHERE U.ID_USUARIO="+idUsuario+" AND ID_PERSONAL=7 AND E.EVENTO='"+evento+"' AND E.FECHA_EVENTO between "+fechaI+" AND "+fechaF+";";					
			return query;
		}
		return "";
	}
	
	public static String getReservacion(String evento, int idUsuario, long fechaI, long fechaF) {
		String query;
		
		if (evento.equals("") && fechaI !=0){
			query = "select V.ID_RESERVACION, V.PAGO_INICIAL, from_unixtime(V.FECHA_RESERVACION, '%m-%d-%Y %H:%i:%s'), from_unixtime(V.FECHA_VENCIMIENTO, '%m-%d-%Y %H:%i:%s'), E.EVENTO, from_unixtime(E.FECHA_EVENTO, '%m-%d-%Y %H:%i:%s'), V.ID_ZONA, V.ASIENTO_NUM FROM RESERVACION AS V JOIN USUARIO AS U ON U.ID_USUARIO=V.ID_USUARIO JOIN EVENTO AS E ON V.ID_EVENTO=E.ID_EVENTO WHERE U.ID_USUARIO="+idUsuario+" AND V.ESTADO=1 AND ID_PERSONAL=7 AND E.FECHA_EVENTO between "+fechaI+" AND "+fechaF+";";
			return query;
		}else if (evento.equals("") && fechaI == 0){
			query= "select V.ID_RESERVACION, V.PAGO_INICIAL, from_unixtime(V.FECHA_RESERVACION, '%m-%d-%Y %H:%i:%s'), from_unixtime(V.FECHA_VENCIMIENTO, '%m-%d-%Y %H:%i:%s'), E.EVENTO, from_unixtime(E.FECHA_EVENTO, '%m-%d-%Y %H:%i:%s'), V.ID_ZONA, V.ASIENTO_NUM FROM RESERVACION AS V JOIN USUARIO AS U ON U.ID_USUARIO=V.ID_USUARIO JOIN EVENTO AS E ON V.ID_EVENTO=E.ID_EVENTO WHERE U.ID_USUARIO="+idUsuario+" AND V.ESTADO=1 AND ID_PERSONAL=7;";	
			return query;
		}else if (!evento.equals("") && fechaI ==0){
			query= "select V.ID_RESERVACION, V.PAGO_INICIAL, from_unixtime(V.FECHA_RESERVACION, '%m-%d-%Y %H:%i:%s'), from_unixtime(V.FECHA_VENCIMIENTO, '%m-%d-%Y %H:%i:%s'), E.EVENTO, from_unixtime(E.FECHA_EVENTO, '%m-%d-%Y %H:%i:%s'), V.ID_ZONA, V.ASIENTO_NUM FROM RESERVACION AS V JOIN USUARIO AS U ON U.ID_USUARIO=V.ID_USUARIO JOIN EVENTO AS E ON V.ID_EVENTO=E.ID_EVENTO WHERE U.ID_USUARIO="+idUsuario+" AND E.EVENTO='"+evento+"' AND V.ESTADO=1 AND ID_PERSONAL=7;";				
			return query;
		}else if (!evento.equals("") && fechaI != 0){
			query= "select V.ID_RESERVACION, V.PAGO_INICIAL, from_unixtime(V.FECHA_RESERVACION, '%m-%d-%Y %H:%i:%s'), from_unixtime(V.FECHA_VENCIMIENTO, '%m-%d-%Y %H:%i:%s'), E.EVENTO, from_unixtime(E.FECHA_EVENTO, '%m-%d-%Y %H:%i:%s'), V.ID_ZONA, V.ASIENTO_NUM FROM RESERVACION AS V JOIN USUARIO AS U ON U.ID_USUARIO=V.ID_USUARIO JOIN EVENTO AS E ON V.ID_EVENTO=E.ID_EVENTO WHERE U.ID_USUARIO="+idUsuario+" AND E.EVENTO='"+evento+"' AND V.ESTADO=1 AND ID_PERSONAL=7 AND E.FECHA_EVENTO between "+fechaI+" AND "+fechaF+";";					
			return query;
		}
		return "";
	}
	
	public static String getEventos(String evento, long fechaI, long fechaF) {
		String query;
		
		if (evento.equals("") && fechaI !=0){
			query = "select EVENTO, from_unixtime(FECHA_EVENTO, '%m-%d-%Y'), from_unixtime(FECHA_EVENTO, '%H:%i:%s') from EVENTO where FECHA_EVENTO between " + fechaI + " AND "+ fechaF +";";
			return query;
		}else if (evento.equals("") && fechaI == 0){
			query = "select EVENTO, from_unixtime(FECHA_EVENTO, '%m-%d-%Y'), from_unixtime(FECHA_EVENTO, '%H:%i:%s') from EVENTO where FECHA_EVENTO between " + fechaI + " AND "+ fechaF +";";
			return query;
		}else if (!evento.equals("") && fechaI !=0){
			query = "select EVENTO, from_unixtime(FECHA_EVENTO, '%m-%d-%Y'), from_unixtime(FECHA_EVENTO, '%H:%i:%s') from EVENTO where EVENTO = '"+evento+"' AND FECHA_EVENTO between " + fechaI + " AND "+ fechaF +";";
			return query;
		}else if (!evento.equals("") && fechaI ==0){
			query = "select EVENTO, from_unixtime(FECHA_EVENTO, '%m-%d-%Y'), from_unixtime(FECHA_EVENTO, '%H:%i:%s') from EVENTO where EVENTO = '"+evento+"' AND FECHA_EVENTO between " + fechaI + " AND "+ fechaF +";";
			return query;
		}

		return "";
	}
	
}

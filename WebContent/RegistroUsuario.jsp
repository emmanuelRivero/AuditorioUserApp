<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Registro de usuario</title>
<style>
input[type=text], select {
    width: 100%;
    height: 40px;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
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

input[type=password], select {
    width: 100%;
    eight: 40px;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

input[type=submit]:hover {
    background-color: #45a049;
}

table {
magin: 0px auto;
}

</style>
</head>

<body>
<jsp:include page="Header.jsp"></jsp:include><br/>
	<h1 style="text-align: center">Registro de usuario</h1>
	<form action="RegistroUsuarioDB.jsp" method="post">

		<table width="50%" align="center">
			<tr>
				<td width="35%" ><label for="nombre">Nombre: </label></td>
				<td width="65%" ><input type="text" name="nombre" id="nombre"></td>
			</tr>
			<tr>
				<td><label for="apellidoP">Apellido Paterno: </label></td>
				<td><input type="text" name="apellidoP" id="apellidoP"></td>
			</tr>
			<tr>
				<td><label for="apellidoM">Apellido Materno: </label></td>
				<td><input type="text" name="apellidoM" id="apellidoM"></td>
			</tr>
			<tr>
			<tr>
				<td><label for="domicilio">Domicilio: </label></td>
				<td><input type="text" name="domicilio" id="domicilio"></td>
			</tr>
			<tr>
				<td><label for="telefono">Teléfono: </label></td>
				<td><input type="text" name="telefono" id="telefono"></td>
			</tr>
			<tr>
				<td><label for="usuario">Usuario: </label></td>
				<td><input type="text" name="usuario" id="usuario"></td>
			</tr>
			<tr>
			<tr>			
			
				<td><label for="contra">Contraseña: </label></td>
				<td><input type="password" name="contra" id="contra"></td>
			</tr>
			<tr>			
				<td><label for="contra">Confirmar Contraseña: </label></td>
				<td><input type="password" name="contraConf" id="contraConf"></td>
			</tr>
			
			<tr>
				<td colspan="2" align="center"><input type="submit"
					name="button" id="button" value="Enviar"></td>
			</tr>
		</table>
		<p>
			<br>
		</p>
	</form>
</body>
</html>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap eCommerce Page Template</title>
    <!-- Bootstrap -->
    <link href="css/bootstrap-4.0.0.css" rel="stylesheet">
  </head>
  <body>
    <%
  String sesion= (String) session.getAttribute("Sesion"); 
  String buttonLog="";
  String urlLog="";
	
  if (sesion == null){
	  buttonLog = "Iniciar Sesion";
	  urlLog = "UserLogin.jsp";
  }else{
	  buttonLog="Cerrar sesión";
	  urlLog="CerrarSesion.jsp";
  }
  
  %>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark col-xl-12">
  <div class="container">
<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
    </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
              <a class="nav-link" href="Home.jsp">Home <span class="sr-only">(current)</span></a>
            </li>
			  <li class="nav-item active">
              <a class="nav-link" href="Historia.jsp"> Historia <span class="sr-only">(current)</span></a>
            </li>
	        <li class="nav-item active">
              <a class="nav-link" href="Ubicacion.jsp">Ubicación <span class="sr-only">(current)</span></a>
            </li>  
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Consultas</a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                <a class="dropdown-item" href="Eventos.jsp">Comprar o reservar</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="ConsultaCompras.jsp">Consultar compras</a>
                <a class="dropdown-item" href="ConsultaReservacion.jsp">Consultar reservaciones</a>
              </div>
            </li>
            <% if (sesion != null){ %>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Tu cuenta</a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                <a class="dropdown-item" href="ActualizarUsuario.jsp">Actualiza tus datos</a>
                <div class="dropdown-divider"></div>
              </div>
            </li>
            <% 
            }
            %>
           </ul>
          <form class="form-inline my-2 my-lg-0" action="<%=urlLog %>">
          <button class="btn btn-outline-success my-2 my-sm-0" type="submit"><%=buttonLog%></button>
          </form>
        </div>
  </div>
  </nav>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery-3.2.1.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap-4.0.0.js"></script>
  </body>
</html>
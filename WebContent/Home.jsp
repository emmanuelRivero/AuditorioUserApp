<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Auditorio Nacional</title>
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
 <!--  Main Courusel -->
<div class="container mt-3">
  <div class="row">
        <div class="col-12">
          <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
              <li data-target="#carouselExampleControls" data-slide-to="0" class="active"></li>
              <li data-target="#carouselExampleControls" data-slide-to="1"></li>
              <li data-target="#carouselExampleControls" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
              <div class="carousel-item active">
                <img class="d-block w-100" src="images/Evento_1.jpg" alt="First slide">
                <div class="carousel-caption d-none d-md-block">
   <!--               <h5>Item 1 Heading</h5>
                  <p>Item 1 Description</p> -->
                </div>
              </div>
              <div class="carousel-item">
                <img class="d-block w-100" src="images/Evento_2.jpg" alt="Second slide">
                <div class="carousel-caption d-none d-md-block">
                  <h5>Item 2 Heading</h5>
                  <p>Item 2 Description</p>
                </div>
              </div>
              <div class="carousel-item">
                <img class="d-block w-100" src="images/Evento_3.jpg" alt="Third slide">
                <div class="carousel-caption d-none d-md-block">
  <!--                <h5>Item 3 Heading</h5>
                  <p>Item 3 Description</p> -->
                </div>
              </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
            </a>
          </div>
        </div>
  </div>
      <hr>
  </div>
   <!--> eventos</-->
    <div class="container">
      <div class="row">
        <div class="col-4">
          <div class="row">
            <div class="col-2"><img class="rounded-circle" alt="Free Shipping" src="images/40X40.gif"></div>
            <div class="col-lg-6 col-10 ml-1">
              <h4>Eventos Deportivos</h4>
            </div>
          </div>
        </div>
        <div class="col-4">
          <div class="row">
            <div class="col-2"><img class="rounded-circle" alt="Free Shipping" src="images/40X40.gif"></div>
            <div class="col-lg-6 col-10 ml-1">
              <h4>Conciertos </h4>
            </div>
          </div>
        </div>
        <div class="col-4">
          <div class="row">
            <div class="col-2"><img class="rounded-circle" alt="Free Shipping" src="images/40X40.gif"></div>
            <div class="col-lg-6 col-10 ml-1 col-xl-9">
              <h4>Grandes Precios &nbsp; &nbsp; &nbsp; &nbsp;promociones</h4>
            </div>
          </div>
        </div>
      </div>
    </div>
	<!-- evento -->
    <hr>
    <h2 class="text-center">EVENTOS EN CARTELERA</h2>
    <hr>
    <div class="container">
      <div class="row text-center">
        <div class="col-md-4 pb-1 pb-md-0">
          <div class="card">
            <img class="card-img-top" src="images/400X200.gif" alt="Card image cap">
            <div class="card-body">
              <h5 class="card-title">Evento 1</h5>
              <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
</div>
          </div>
        </div>
        <div class="col-md-4 pb-1 pb-md-0">
          <div class="card">
            <img class="card-img-top" src="images/400X200.gif" alt="Card image cap">
            <div class="card-body">
              <h5 class="card-title">Evento 2</h5>
              <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
</div>
          </div>
        </div>
        <div class="col-md-4 pb-1 pb-md-0">
          <div class="card">
            <img class="card-img-top" src="images/400X200.gif" alt="Card image cap">
            <div class="card-body">
              <h5 class="card-title">Evento 3</h5>
              <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
</div>
          </div>
        </div>
      </div>
      <div class="row text-center mt-4">
        <div class="col-md-4 pb-1 pb-md-0">
          <div class="card">
            <img class="card-img-top" src="images/400X200.gif" alt="Card image cap">
            <div class="card-body">
              <h5 class="card-title">Evento 4</h5>
              <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
</div>
          </div>
        </div>
        <div class="col-md-4 pb-1 pb-md-0">
          <div class="card">
            <img class="card-img-top" src="images/400X200.gif" alt="Card image cap">
            <div class="card-body">
              <h5 class="card-title">Evento 5</h5>
              <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
</div>
          </div>
        </div>
        <div class="col-md-4 pb-1 pb-md-0">
          <div class="card">
            <img class="card-img-top" src="images/400X200.gif" alt="Card image cap">
            <div class="card-body">
              <h5 class="card-title">Card title</h5>
              <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
</div>
          </div>
        </div>
      </div>
    </div>
    <hr>
	<!-- proximos eventos -->
    <h2 class="text-center">Próximos Eventos</h2>
    <hr>
    <div class="container">
      <div class="row">
        <div class="col-lg-4">
          <ul class="list-unstyled">
            <li class="media">
              <img class="mr-3" src="images/100X125.gif" alt="Generic placeholder image">
              <div class="media-body">
                <h5 class="mt-0 mb-1">List-based media object</h5>
                Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
              </div>
            </li>
            <li class="media my-4">
              <img class="mr-3" src="images/100X125.gif" alt="Generic placeholder image">
              <div class="media-body">
                <h5 class="mt-0 mb-1">List-based media object</h5>
                Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
              </div>
            </li>
            <li class="media">
              <img class="mr-3" src="images/100X125.gif" alt="Generic placeholder image">
              <div class="media-body">
                <h5 class="mt-0 mb-1">List-based media object</h5>
                Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
              </div>
            </li>
          </ul>
        </div>
        <div class="col-lg-4">
          <ul class="list-unstyled">
            <li class="media">
              <img class="mr-3" src="images/100X125.gif" alt="Generic placeholder image">
              <div class="media-body">
                <h5 class="mt-0 mb-1">List-based media object</h5>
                Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
              </div>
            </li>
            <li class="media my-4">
              <img class="mr-3" src="images/100X125.gif" alt="Generic placeholder image">
              <div class="media-body">
                <h5 class="mt-0 mb-1">List-based media object</h5>
                Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
              </div>
            </li>
            <li class="media">
              <img class="mr-3" src="images/100X125.gif" alt="Generic placeholder image">
              <div class="media-body">
                <h5 class="mt-0 mb-1">List-based media object</h5>
                Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
              </div>
            </li>
          </ul>
        </div>
        <div class="col-lg-4">
          <ul class="list-unstyled">
            <li class="media">
              <img class="mr-3" src="images/100X125.gif" alt="Generic placeholder image">
              <div class="media-body">
                <h5 class="mt-0 mb-1">List-based media object</h5>
                Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
              </div>
            </li>
            <li class="media my-4">
              <img class="mr-3" src="images/100X125.gif" alt="Generic placeholder image">
              <div class="media-body">
                <h5 class="mt-0 mb-1">List-based media object</h5>
                Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
              </div>
            </li>
            <li class="media">
              <img class="mr-3" src="images/100X125.gif" alt="Generic placeholder image">
              <div class="media-body">
                <h5 class="mt-0 mb-1">List-based media object</h5>
                Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
              </div>
            </li>
          </ul>
        </div>
      </div>
    </div>
    <hr>
	<!-- footer -->
    <div class="container text-white bg-dark p-4">
      <div class="row">
        
        <div class="col-md-4 col-lg-5 col-6">
          <address>
            <strong>Auditorio Nacional</strong><br>
            Paseo de la Reforma 50, Miguel Hidalgo<br>
            11580 Ciudad de México, CDMX<br>
            <abbr title="Phone">P:</abbr> ()01) 55 9138 1350
          </address>
          <address>
            <a href="mailto:#">contacto@auditorionacional.com.mx</a>
          </address>
        </div>
      </div>
    </div>
    <footer class="text-center">
      <div class="container">
        <div class="row">
          <div class="col-12">

          </div>
        </div>
      </div>
    </footer>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery-3.2.1.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap-4.0.0.js"></script>
  </body>
</html>
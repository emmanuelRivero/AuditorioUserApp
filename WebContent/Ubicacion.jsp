<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ubicación</title>
</head>
    <style>
      #map {
        height: 400px;  
        width: 400px;  
        margin: 0 auto;
       }
    </style>
  </head>
<body>
	<jsp:include page="Header.jsp"></jsp:include><br/>
	
	    <h3 style="text-align: center">Ubícanos</h3>
    <!--The div element for the map -->
    <p style="text-align: center">Paseo de la Reforma 50, Miguel Hidalgo, 11580 Ciudad de México, CDMX</p>
    
    <p style="text-align: center">Teléfonos: 01 55 9138 1350</p>
    
    <div id="map"></div>
    <script>
// Initialize and add the map
function initMap() {
  // The location of Uluru
  var uluru = {lat: 19.4248097, lng: -99.19492559999998};
  // The map, centered at Uluru
  var map = new google.maps.Map(
      document.getElementById('map'), {zoom:16, center: uluru});
  // The marker, positioned at Uluru
  var marker = new google.maps.Marker({position: uluru, map: map});
}
    </script>
    <!--Load the API from the specified URL
    * The async attribute allows the browser to render the page while the API loads
    * The key parameter will contain your own API key (which is not needed for this tutorial)
    * The callback parameter executes the initMap() function
    -->
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD9xj3AGR2BA2G_Sc2vAaD3tlFUmoPY4IY&callback=initMap">
    </script>
	
</body>
</html>
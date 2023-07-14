<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>AS-New Reading</title>
	    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
	</head>
	<body>
		<div class="nav-container">
		<nav class="centered-logo top-bar">
		  	<div class="container">
				  <div class="row">
				    <div class="col-sm-12 text-center">
				    	<form >
							<a href="index_logged.jsp"><img class="logo logo-dark" alt="Logo" src="img/as.png" style="width: 150px; height: 150px;"></a>
						</form>
						<p class="lead">Accesso eseguito come: </p>
						<%out.print(session.getAttribute("email")); %>
				    </div>
				  </div>
				  
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link" href="index.jsp">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="catalogo.jsp">I Nostri Libri</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="contatti.jsp">Contatti</a>
          </li>
         
          <li class="nav-item">
            <form action="UserOrdini"  method="post"> <a class="nav-link">Ordini</a></form>
          </li>
          
         
          <li class="nav-item"> 
            <a class="nav-link" href="carrello.jsp">
            Carrello
            <span class="navbar-text">
             <img src="img/Cart.png" alt="Carrello">
            </span>
           </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="Logout.java">Logout
             <span class="navbar-text">
             </span>
             </a>
            </li>   
        </ul>
      </div>
    </div>
  </nav>
			</div>
		</nav>
	</div>
</body>
</html>
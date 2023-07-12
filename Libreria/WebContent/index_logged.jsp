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
				  <br>
				  <div class="row">
				    <div class="col text-center">
				      	<form action="catalogo_logged.jsp" method="get">
							<button type="submit" class="btn btn-success">Catalogo</button>
						</form>
				    </div>
				    <div class="col text-center">
				      	<form action="carrello.jsp" method="get">
							<button type="submit" class="btn btn-success">Carrello</button>
						</form>
				    </div>
				    <div class="col text-center">
				      	<form action="UserOrdini" method="post">
							<button type="submit" class="btn btn-success">Ordini</button>
						</form>
				    </div>				    
				    <div class="col text-center">
						<form action="Logout" method="post">
							<button class="btn btn-danger">Logout</button>
						</form>
				    </div>
				  </div>
			</div>
		</nav>
	</div>
</body>
</html>
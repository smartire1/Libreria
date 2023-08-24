<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="java.sql.*"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="it">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
	<link href="css/footer.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet"> 
	<link rel="icon" type="image/png" href="img/ico.png">
	<title>AS-New Readings</title>
	
</head>
<body>
	<div class="logo-container">
		<a href="index.jsp">
			<img src="img/as.png" alt="Logo">
		</a>
	</div>

	<jsp:include page="navbar.jsp" />
	
<div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
    	<a href="catalogo.jsp"> 
      		<img src="img/sfondo2.png" class="d-block w-100" alt="First Image">
    	</a>
    </div>
    <div class="carousel-item">
    	<a href="catalogo.jsp"> 
      		<img src="img/sfondo1.png" class="d-block w-100" alt="Second Image">
      	</a>
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>

		
	<footer>
		<div class="footer-container">
			<div class="container">
				<div class="row">
					<div class="col-sm-12 text-center">
						<p>Seguici sui social per rimanere sempre aggiornato!</p>
						<ul class="social-icons">
							<li>
								<a href="https://twitter.com/login?lang=it">
									<i class="fab fa-twitter fa-2x"></i>
								</a>
							</li>
							<li>
								<a href="https://www.facebook.com/">
									<i class="fab fa-facebook fa-2x"></i>
								</a>
							</li>
							<li>
								<a href="https://www.google.com/?hl=it">
									<i class="fab fa-instagram fa-2x"></i>
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</footer>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://kit.fontawesome.com/your-fontawesome-kit.js" crossorigin="anonymous"></script>
</body>
</html>

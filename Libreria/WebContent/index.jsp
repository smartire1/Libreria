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
	<link rel="icon" type="image/png" href="img/ico.png">
	<title>AS-New Reading</title>

	<style>
		.image-bg {
			background-image: url('img/LibreriaAntica.png');
			background-size: cover;
			background-position: center;
			width: 100%;
			height: 65%;
		}

		.row-border {
			border: 2px solid red;
			padding: 10px;
		}
		.product-image {
			transition: opacity 0.3s ease;
		}
		
		.product-image:hover {
			opacity: 0.7;
		}
		
		.product-image {
			width: 200px; 
			height: 250px;
		}		
		@media (max-width: 490px) {
			.product-image {
				width: 150px; 
				height: 200px;
			}
		}
		
		@media (max-width: 490px) {
			.texteduce {
				font-size: 0.8em;
			}
		}
	</style>

</head>
<body>
	<div class="logo-container">
		<a href="index.jsp">
			<img src="img/as.png" alt="Logo" style="width: 150px; height: 150px;">
		</a>
	</div>

	<jsp:include page="navbar.jsp" />

	<div class="image-bg" style="position: relative;">
		<div class="bg-white mx-auto border border-danger border-2 p-3 rounded" style="width: 100%; max-width: 600px; position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); background-image: url('img/caroselloWalpaper.png'); background-size: cover;">
			<div class="container ">
				<h4 style="font-family: Didot, serif; font-style: italic; margin-right:50px; margin-bottom:-5px; font-variant: small-caps; text-align: right;"><strong>Di Tendenza</strong></h4>
				<div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
					<div class="carousel-inner">
						<div class="carousel-item active">
							<div class="row">
								<div class="col-6 d-flex align-items-center">
									<a href="catalogo.jsp">
										<img src="img/Products/OnePiece.png" class="d-block product-image" alt="Prodotto1">
									</a>
								</div>
								<div class="col-6 d-flex align-items-center">
									<ul class="pricing-content" style="display: flex; flex-direction: column; justify-content: center; align-items: center; font-size:24px;">
										<li><p class="texteduce"><strong>titolo:</strong>One Piece</li>
										<li><p class="texteduce"><strong>prezzo:</strong>9,99 euro</li>
									</ul>
								</div>
							</div>
						</div>
						<div class="carousel-item">
							<div class="row">
								<div class="col-6 d-flex align-items-center">
									<a href="catalogo.jsp">
										<img src="img/Products/HarryPotter.png" class="d-block product-image" alt="Prodotto2">
									</a>
								</div>
								<div class="col-6 d-flex align-items-center">
									<ul class="pricing-content" style="display: flex; flex-direction: column; justify-content: center; align-items: center; font-size:24px;">
										<li><p class="texteduce"><strong>titolo:</strong>Harry Potter</li>
										<li><p class="texteduce"><strong>prezzo:</strong>27.99 euro</li>
									</ul>
								</div>
							</div>
						</div>
						<div class="carousel-item">
							<div class="row">
								<div class="col-6 d-flex align-items-center">
									<a href="catalogo.jsp">
										<img src="img/Products/DragonBall.png" class="d-block product-image" alt="Prodotto3">
									</a>
								</div>
								<div class="col-6 d-flex align-items-center">
									<ul class="pricing-content" style="display: flex; flex-direction: column; justify-content: center; align-items: center; font-size:24px;">
										<li><p class="texteduce"><strong>titolo:</strong>Dragon Ball<p></li>
										<li><p class="texteduce"><strong>prezzo:</strong>9,99 euro</li>
									</ul>
								</div>
							</div>
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
			</div>
		</div>
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

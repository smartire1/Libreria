<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">	
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" type="image/png" href="img/ico.png">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
	<link href="css/footer.css" rel="stylesheet"> 
	<link href="css/style.css" rel="stylesheet"> 
	<script src="js/validate.js"></script>
	<script src="https://code.jquery.com/jquery-3.7.0.slim.min.js" integrity="sha256-tG5mcZUtJsZvyKAxYLVXrmjKBVLd6VpVccqz/r4ypFE=" crossorigin="anonymous"></script>
	<title>AS-New Readings</title>
</head>
<body class="page-body">
	<div class="logo-container">
		<a href="index.jsp">
			<img src="img/as.png" alt="Logo">
		</a>
	</div>
	
	<div class="image-login inset-border">
		<div id="loginBox" class="mx-auto">
			<div class="container">
				<p class="lead text-center"><strong>LOGIN</strong></p>
				<form name="log_in" action="Login" method="post" onsubmit="return validateForm()">
					<div class="container">
						<div class="row text-center">
							<div class="col-sm-12">
								<input type="text" placeholder="email" name="email"/>
							</div>
							<div class="col-sm-12">
								<input type="password" placeholder="Password" name="pass"/>
							</div>
							<div class="col-sm-12">
								<br>
								<input type="submit" value="Accedi" class="btn btn-danger btn-sm" />
							</div>
							<div class="col-sm">
								<br>
								<br>
								<p class="lead">Non sei registrato? <a href="signin.jsp" target="_self">Registrati</a></p>
							</div>
						</div>
					</div>
				</form>
				<br></br>
			</div>
		</div>
	</div>
	<% if(null != request.getAttribute("errorMessage")) { %>	
	<script>showElement();</script>				
	<% } %>
	
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

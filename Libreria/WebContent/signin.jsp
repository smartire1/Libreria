<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="it">
<head>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">	
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" type="image/png" href="img/ico.png">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
	<link href="css/footer.css"rel="stylesheet"> 
	<link href="css/style.css" rel="stylesheet">
	<script src="js/validate.js"></script>
	<script src="https://code.jquery.com/jquery-3.7.0.slim.min.js" integrity="sha256-tG5mcZUtJsZvyKAxYLVXrmjKBVLd6VpVccqz/r4ypFE=" crossorigin="anonymous"></script>
	<title>AS-New Readings</title>
</head>
<body>
 	<div class="logo-container">
		<a href="index.jsp">
			<img src="img/as.png" alt="Logo">
		</a>
	</div>
	
	<div class="image-login">
		<div id="loginBox" class="bg-white mx-auto">
			<div class="container">
			    <div class="row justify-content-center">
			        <div class="col-sm-12 text-center">
			            <p class="lead"><strong>Inserisci Dati</strong></p>
			            <form action="AddAccount" method="post" id="inviaForm" onsubmit="return validateFormS()">
			                <div class="container">
			                    <div class="row text-center">
			                        <div class="col-sm-12">
			                            <input id="nome1" type="text" placeholder="nome" name="nome" />
			                        </div>
			                        <div class="col-sm-12">
			                            <input id="cognome1" type="text" placeholder="cognome" name="cognome" />
			                        </div>
			                        <div class="col-sm-12">
			                            <input class="email1" type="text" placeholder="email" name="email" pattern="[a-zA-Z0-9._]+(@gmail\.com|@outlook\.com)$"/>
			                        	
			                        </div>
			                        <div class="col-sm-12">
			                            <input id="pass1" type="password" placeholder="Password" name="pass" />
			                        </div>
			                        <div class="col-sm-12">
			                            <br>
			                            <input type="submit" value="Avanti" class="btn btn-danger btn-sm">
			                        </div>
			                    </div>
			                </div>
			            </form>
			        </div>
			    </div>
			</div>
			</div>
		</div>


    <% if (null != request.getAttribute("Message")) { %>
        <br>
        <p class="lead text-center"><strong><%= request.getAttribute("Message") %></strong></p>
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

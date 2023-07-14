
<!DOCTYPE html>
<html lang="it">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
  <style>
    
    
    .logo-container {
      text-align: center;
      margin-top: 20px;
      margin-bottom: 20px;
    }
   
    html, body {
      height: 70%;
    }

    .footer-container {
      min-height: 120%;
      background-color: brown;
      padding: 50px;
      color: white;
    }
    .social-icons {
      list-style-type: none;
      padding: 0;
      margin: 0;
      text-align: center;
    }
    .social-icons li {
      display: inline-block;
      margin-right: 30px;
    }
    .social-icons a {
      color: white;
    }
    .footer-container p {
     font-size: 30px;
    }
  
	.product-text {
  	font-size: 50px;
  	margin-bottom: 50px;
  	color: black; /* Aggiungi il colore desiderato per il testo */
	}
	
  </style>
  <title>AS-New Reading</title>
</head>
<body>

  <div class="logo-container">
    <a href="index.jsp">
      <img src="img/as.png" alt="Logo" style="width: 150px; height: 150px;">
    </a>
   
  </div>

  <jsp:include page="navbar.jsp" />


<img src="img/LibreriaAntica.png" alt="Immagine fissa" class="image-above" style="width: 100%; height: 170%;">




 <!-- Controlli del footer -->
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




  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://kit.fontawesome.com/your-fontawesome-kit.js" crossorigin="anonymous"></script>
</body>
</html>

 <!DOCTYPE html>
<html lang="it">
<head>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
  <link rel="icon" type="image/png" href="img/ico.png">
  <title>AS-New Reading</title>
  <link href="css/style.css" rel="stylesheet"> 
	<link href="css/footer.css" rel="stylesheet">
  
  <style>
    .logo-container {
      text-align: center;
      margin-top: 20px;
      margin-bottom: 20px;
    }
    
    .map-holder {
      position: relative;
      width: 100%;
      height: 100vh; /* Altezza dello schermo intero */
      overflow: hidden;
    }

    .map-holder iframe {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
    }

    .contact-center {
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
    height: calc(100vh - 150px); /* Altezza dello schermo intero */
    }
    .contact-center h1,
  .contact-center p {
    margin: 10px 0;
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
		
  <div class="main-container"></div>
  
  <section class="map">
    <div class="map-holder">
      <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3025.5058998357626!2d40.7773181!3d14.7785808!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x133bc23488bfb48d%3A0x278aaa67b2cdf452!2sLargo+Andrea+Sinno%2C+173%2C+84126+Salerno+SA!5e0!3m2!1sit!2sit!4v1517020866174"
      width="100%" height="100%" style="border:0"></iframe>
    </div>
  </section>
  
  <section class="contact-center">
    <div class="container">
      <div class="row">
        <div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2 text-center">
          <h1>Avete Domande? <br>Non esitate a conttatarci per avere informazioni<br></h1>
          <p class="lead">contatto: As-NewReadings@ewine.com
            <br>Recapito Telefonico
            <br><img src="img/whatsapp.png"> +0813335566 <br>
            <br>As-New Readings<br> Campania, Salerno
          </p>
        </div>
      </div>
    </div>
  </section>
			
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
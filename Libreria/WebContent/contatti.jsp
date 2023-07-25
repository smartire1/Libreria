 <!DOCTYPE html>
<html lang="it">
<head>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
  <link rel="icon" type="image/png" href="img/ico.png">
  <link href="css/style.css" rel="stylesheet"> 
	<link href="css/footer.css" rel="stylesheet">
	<title>AS-New Reading</title>
  
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
      height: 65%;
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
			<img src="img/as.png" alt="Logo">
		</a>
	</div>
  
  <jsp:include page="navbar.jsp" />
		
  <div class="main-container"></div>
  
  <section class="map">
    <div class="map-holder">
      <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d6043.058601307324!2d14.78893848995371!3d40.772376356289385!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x133bc5a5643af19d%3A0xc377a069f69748ad!2sDipartimento%20di%20Informatica%2C%20Universit%C3%A0%20di%20Salerno!5e0!3m2!1sit!2sit!4v1690295820275!5m2!1sit!2sit" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
    </div>
  </section>
  
  <section class="contact-center">
    <div class="container">
      <div class="row">
        <div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2 text-center">
          <h1>Avete Domande? <br>Non esitate a conttatarci per avere informazioni<br></h1>
          <p class="lead">contatto: info@As-NewReadings.com
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
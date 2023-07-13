
<!DOCTYPE html>
<html lang="it">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
  <style>
    .carousel-item img {
      width: 100%;
      height: 70vh;
    }
    .logo-container {
      text-align: center;
      margin-top: 20px;
      margin-bottom: 20px;
    }
    .navbar-nav {
      font-size: 20px;
      justify-content: center;
    }
    .navbar-nav .nav-link {
      padding: 10px 20px;
    }
    .navbar-text img {
      width: 20px;
      height: 20px;
      margin-left: 5px;
    }
    .navbar-nav .nav-item + .nav-item {
      margin-left: 100px;
    }
    html, body {
      height: 70%;
    }

    .footer-container {
      min-height: 100%;
      background-color: brown;
      padding: 40px;
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
  </style>
  <title>AS-New Reading</title>
</head>
<body>

  <div class="logo-container">
    <a href="index.jsp">
      <img src="img/as.png" alt="Logo" style="width: 220px; height: 220px;">
    </a>
   
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
            <a class="nav-link" href="login.jsp">Accedi
             <span class="navbar-text">
             <img src="img/Login.png" alt="Accedi">
             </span>
            </a>
          </li>
          <li class="nav-item"> 
            <a class="nav-link" onClick="alert('Effetua prima il Login')">
            Carrello
            <span class="navbar-text">
             <img src="img/Cart.png" alt="Carrello">
            </span>
           </a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
    <!-- Immagini del carosello -->
    <div class="carousel-inner">
      <div class="carousel-item active">
        <img src="img/LibreriaAntica.png" alt="Immagine 1">
      </div>
      <div class="carousel-item">
        <img src="img/LibreriaAntica.png" alt="Immagine 2">
      </div>
      <div class="carousel-item">
        <img src="img/LibreriaAntica.png" alt="Immagine 3">
      </div>
    </div>

    <!-- Controlli del carosello -->
    <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
<<<<<<< HEAD
      <span class="visually-hidden">Precedente</span>
=======
      <span class="visually-hidden">Precedente </span>
>>>>>>> branch 'main' of https://github.com/smartire1/Libreria.git
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Successivo</span>
    </button>
  </div>

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
              <a href="https://www.instagram.com/?hl=it">
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

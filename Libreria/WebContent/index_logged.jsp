<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
  <link href="css/footer.css" rel="stylesheet">
  <link href="css/navbar.css" rel="stylesheet">
  <link rel="icon" type="image/png" href="img/ico.png">
  <title>AS-New Reading</title>
</head>
<body>
  <div class="nav-container">
    <nav class="centered-logo top-bar">
      <div class="container">
        <div class="row">
          <div class="col-sm-12 text-center">
            <form>
              <a href="index_logged.jsp"><img class="logo logo-dark" alt="Logo" src="img/as.png" style="width: 150px; height: 150px;"></a>
            </form>
          </div>
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
                <a class="nav-link" href="index_logged.jsp">Home</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="catalogo_logged.jsp">I Nostri Libri</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="contatti.jsp">Contatti</a>
              </li>
              <li class="nav-item">
                <form action="UserOrdini" method="post" name="ordiniUser"> 
                  <a href="javascript:void(0)" class="nav-link" onclick="document.forms['ordiniUser'].submit()">Ordini</a>
                </form>
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
                <form action="Logout" method="post" name="log-out"> 
                  <a href="javascript:void(0)" class="nav-link" onclick="document.forms['log-out'].submit()">Logout</a>
                </form>
              </li>   
            </ul>
          </div>
        </div>
      </nav>
    </nav>
  </div>
  
    <img src="img/LibreriaAntica.png" alt="Immagine fissa" class="image-above" style="width: 100%; height: 65%; object-fit: cover;">

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

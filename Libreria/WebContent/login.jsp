<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">	
  <meta charset="ISO-8859-1">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>AS-New Reading</title>
  <link rel="icon" type="image/png" href="img/ico.png">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
  <link href="css/footer.css" rel="stylesheet"> 
  <script src="https://code.jquery.com/jquery-3.7.0.slim.min.js" integrity="sha256-tG5mcZUtJsZvyKAxYLVXrmjKBVLd6VpVccqz/r4ypFE=" crossorigin="anonymous"></script>
  <script>	
    function validateForm() {
      let x = document.forms["log_in"]["email"].value;
      let y = document.forms["log_in"]["pass"].value;
      if(x == "" || y == "") {
        alert("riempi tutti i campi");
        return false;
      }
    }	
  </script>	
  <script>
    function showElement() {
      document.body.innerHTML += "<p class='lead text-center'><strong>Password errata o utente inesistente</strong></p>"
    }
  </script>
  <style>
    .image-bg {
      background-image: url('img/LibreriaAntica.png');
      background-size: cover;
      background-position: center;
      width: 100%;
      height: 65%;
    }
  </style>
</head>
<body class="page-body">
  <div class="container">
    <div class="row">
      <div class="col-sm-12 text-center">
        <form>
          <a href="index.jsp"><img class="logo logo-dark" alt="Logo" src="img/as.png" style="width: 150px; height: 150px;"></a>
        </form>
      </div>
    </div>
  </div>
  <div class="image-bg" style="position: relative;">
    <div id="loginBox" class="bg-white mx-auto" style="border: 1px solid; padding: 10px; border-radius: 5px; width: 300px; position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);">
      <div class="container">
        <p class="lead text-center">Inserisci email e password</p>
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
                <input type="submit" value="Accedi" class="btn btn-success btn-sm" />
              </div>
              <div class="col-sm">
                <br>
                <p class="lead">Non sei registrato?</p>
                <a href="signin.jsp" class="btn btn-warning" target="_self">Registrati</a>
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


<style>
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


</style>



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
<link href="css/navbar.css" rel="stylesheet">

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse justify-content-center flex-grow-1" id="navbarNav">
      <ul class="navbar-nav ml-auto align-items-center">
        <li class="nav-item">
          <a class="nav-link" href="index.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="catalogo.jsp">I Nostri Libri</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="contatti.jsp">Chi Siamo</a>
        </li>
        <li class="nav-item " id="cart"> 
          <% if( session.getAttribute("nome") == null || session.getAttribute("nome").equals("") ) { %>
	        <a class="nav-link " onClick="alert('Effettua prima il Login')">
	          Carrello
	          <span class="navbar-text">
	            <img src="img/Cart.png" alt="Carrello">
	          </span>
	        </a>
          <% } else { %>
            <a class="nav-link " href="carrello.jsp">
	          Carrello
	          <span class="navbar-text">
	            <img src="img/Cart.png" alt="Carrello">
	          </span>
	        </a>
	      <% } %>
        </li>        
        <li class="nav-item" id="access">
          <% if( session.getAttribute("nome") == null || session.getAttribute("nome").equals("") ) { %>
	          <a class="nav-link" href="login.jsp">Accedi
	            <span class="navbar-text" >
	              <img src="img/Login.png" alt="Accedi">
	            </span>
	          </a>
          <% } else { %>
	          <form action="Logout" method="post" name="log-out"> 
	         	<a href="javascript:void(0)" class="nav-link" onclick="document.forms['log-out'].submit()">Logout 	            
		         	<span class="navbar-text">
		              <img src="img/Login.png" alt="">
		            </span> [<%=session.getAttribute("nome")%>]
	            </a>
	          </form>
          <% } %>
        </li>
      </ul>
    </div>
  </div>
</nav>

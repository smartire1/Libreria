<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="java.sql.*"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<title>AS-New Reading</title>
<link href="css/style.css" rel="stylesheet"> 
<link href="css/footer.css" rel="stylesheet"> 
<link href="css/card.css" rel="stylesheet"> 
  <script src="js/addCart.js"></script>
<link rel="icon" type="image/png" href="img/ico.png">

<style>
	.col-sm-12  {
		margin-top:10px;
	}
	.col-sm-12 > hr {
  /* Le regole CSS per l'elemento hr qui */
}


	.price-filter {
	  display: flex;
	  flex-direction: column;
	  align-items: center;
	  margin-top: 20px;
	}
	
	input[type="range"] {
	  width: 200px;
	  
	}
</style>

</head>
<body class="bgSand">

	<div class="nav-container" style="background-color: white;">
		<nav class="centered-logo top-bar">
		  	<div class="container">
				  <div class="row">
				    <div class="col-sm-12 text-center">
				    	<form >
							<a href="index.jsp"><img class="logo logo-dark" alt="Logo" src="img/as.png" style="width: 150px; height: 150px;"></a>
						</form>
						
				    </div>
				  </div>
			</div>
		</nav>
	</div>
 
 	<jsp:include page="navbar.jsp" />


    <%ResultSet res;
    if(null != request.getAttribute("show")) {
    	res = (ResultSet) request.getAttribute("show");
    }
    else {
      String db_url = "jdbc:mysql://localhost:3306/Librerie";
      String user_db = "root";
      String pass_db = "admin";
      Connection connessione = null;
      Class.forName("com.mysql.jdbc.Driver");
      connessione = DriverManager.getConnection(db_url,user_db,pass_db);
      Statement cmd = connessione.createStatement();
      String query = "select * from Products";
      res = cmd.executeQuery(query); }%>
      
      <br>
      <form action="ShowCatalogo" method="post">
		<div class="container text-center pricingTable">
		  <div class="row">
		    <div class="col-lg-3 col-md-12 col-sm-12 ">
		      <p class="lead text-center"> Cerca per ISBN:</p>
		      <input name="Fisbn" type="text" placeholder="isbn"/>
		    </div>
		    <div class="col-lg-3 col-md-12 col-sm-12 ">
		      <p class="lead">Cerca per casa editrice:</p>
				<select class="form-select" id="FcasaEditrice" name="FcasaEditrice">
				  <option value="" selected>Tutte</option>
				  <option value="Adelfi">Adelfi</option>
				  <option value="Rizzoli">Rizzoli</option>
				  <option value="Soprani">Soprani</option>
				  <option value="Ferdona">Ferdona</option>
				  <!-- Aggiungi altre opzioni qui -->
				</select>
		    </div>
		    <div class="col-lg-3 col-md-12 col-sm-12 ">

				<div class="price-filter">
				  <p class="lead text-center"> Cerca per prezzo:</p>
				  <input type="range" id="max-price" name="Fmaxprice" min="0" max="30" step="1" value="30">
				  <span id="max-price-value">30</span> euro
				</div>
				
		    </div>
		    <div class="col-lg-3 col-md-12 col-sm-12 d-flex justify-content-center align-items-center">
		       <button type="submit" class="btn btn-danger ">Applica filtri</button>
		    </div>
		  </div>
		</div>
	</form>
		<div class="container text-center pricingTable" style="background-image: url('img/cat.png'); border-radius:15px; background-position: center;">
		  <div class="row ">
		  <% while(res.next()){%>	
		    <div class="col-lg-4 d-flex justify-content-center" style="margin-top: 60px; ">
				<div class="card pricingTable" style="width: 18rem; border-width: 2px; border-color: brown; background-color: #f2f0f0; border-radius:15px;">
				  <h5 class="card-title" style="margin-bottom: 10px; margin-top: 10px;"><%= res.getString("titolo") %> </h5><hr/>
				  <span><img src="<%= res.getString("img") %>" class="card-img-top" style="width: 200px; height: 300px;" alt="img"></span>
				  <br>
				  <div class="card-body ">
				    <hr/><p class="card-text"><strong>ISBN: </strong><%= res.getString("isbn") %>  <input id="isbn" name="isbn" type="hidden" value="<%= res.getString("isbn") %>"/></p>
				    <p class="card-text"><strong>casa editrice:  </strong><%= res.getString("casaEditrice") %></p>
				    <p class="card-text"><strong>prezzo: </strong> <%= res.getString("prezzo") %> euro</p><hr/>
				    
	                  <% if( session.getAttribute("email") != null && !session.getAttribute("email").equals("") ) { %>
	                      <button type="button" class="btn btn-danger" onclick="addToCart('<%= res.getString("isbn") %>', '<%= session.getAttribute("email") %>')">Aggiungi al carrello</button>
	                  <% } else { %>
	                      <button type="button" class="btn btn-danger" onclick="alert('E\' necessario loggarsi!');">Aggiungi al carrello</button>
	                  <% } %>
				    
				  </div>
				</div>		      
		    </div>
		    <% } %>
		  </div>
		</div>      
		<br>
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
  <script>
  const maxPriceInput = document.getElementById('max-price');
  const maxPriceValue = document.getElementById('max-price-value');

  // Aggiorniamo il valore visualizzato quando l'utente sposta la barra
  maxPriceInput.addEventListener('input', () => {
    maxPriceValue.textContent = maxPriceInput.value;
  });
</script>
  

 
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://kit.fontawesome.com/your-fontawesome-kit.js" crossorigin="anonymous"></script>
</body>
</html>
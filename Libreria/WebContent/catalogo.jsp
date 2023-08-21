<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="java.sql.*" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <link href="css/style.css" rel="stylesheet"> 
    <link href="css/footer.css" rel="stylesheet"> 
    <link href="css/card.css" rel="stylesheet"> 
    <script src="js/addCart.js"></script>
    <link rel="icon" type="image/png" href="img/ico.png">

	<title>AS-New Reading</title>
	
    <script>
    	function voidCartMessage() {
    		document.getElementById("table-bg").style.height = "40%"; 	
    		}
    </script>
	

	<title>AS-New Readings</title>

</head>
<body class="bgSand">
    <div class="bg-white">
		<div class="logo-container">
			<a href="index.jsp">
				<img src="img/as.png" alt="Logo">
			</a>
		</div>
    </div>

    <jsp:include page="navbar.jsp" />

    <% ResultSet res;
    if (null != request.getAttribute("show")) {
        res = (ResultSet) request.getAttribute("show");
    } else {
        String db_url = "jdbc:mysql://localhost:3306/Librerie";
        String user_db = "root";
        String pass_db = "admin";
        Connection connessione = null;
        Class.forName("com.mysql.jdbc.Driver");
        connessione = DriverManager.getConnection(db_url, user_db, pass_db);
        Statement cmd = connessione.createStatement();
        String query = "select * from Products";
        res = cmd.executeQuery(query);
    } %>

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

	<% if (null != request.getAttribute("Fisbn") || null != request.getAttribute("FcasaEditrice") || null != request.getAttribute("Fmaxprice")) { %>
	    <div class="container text-center filterTable">

	            <div class="col-md-12">
	                <p style="color: red;">Ricerca per:</p>
	                <p><span style="color: black;">ISBN</span> - "<%= ("" == request.getAttribute("Fisbn").toString()) ? "Tutti" : request.getAttribute("Fisbn").toString() %>"</p>
	                <p><span style="color: black;">Casa Editrice</span> - "<%= ("" == request.getAttribute("FcasaEditrice").toString()) ? "Tutte" : request.getAttribute("FcasaEditrice").toString() %>"</p>
	                <p><span style="color: black;">Prezzo max</span> - "<%= ("" == request.getAttribute("Fmaxprice").toString()) ? "Max" : request.getAttribute("Fmaxprice").toString() %>"</p>
	            </div>
	       
	    </div>
	<% } %>


    <div class="container pricingTable" id="table-bg">
        <div class="row ">
	        <% if (res.next()) { %>
	            <% do {%>	
	            <div class="col-lg-4 d-flex justify-content-center" style="margin-top: 60px; ">
	                <div class="card pricingTable" >
	                    <h3 class="title" ><%= res.getString("titolo") %> </h3>
	                    <span><img src="<%= res.getString("img") %>" class="card-img-top"></span>
	                    <br>
	                    <div class="card-body">
	                        <hr/><p><strong>ISBN: </strong><%= res.getString("isbn") %>  <input id="isbn" name="isbn" type="hidden" value="<%= res.getString("isbn") %>"/></p>
	                        <p><strong>casa editrice:  </strong><%= res.getString("casaEditrice") %></p>
	                        <p><strong>prezzo: </strong> <%= res.getString("prezzo") %> &#8364</p><hr/>
	
	                        <% if( session.getAttribute("email") != null && !session.getAttribute("email").equals("") ) { %>
	                            <button type="button" class="btn btn-danger" onclick="addToCart('<%= res.getString("isbn") %>', '<%= session.getAttribute("email") %>')">Aggiungi al carrello</button>
	                        <% } else { %>
	                            <button type="button" class="btn btn-danger" onclick="alert('E\' necessario loggarsi!');">Aggiungi al carrello</button>
	                        <% } %>
	
	                    </div>
	                </div>		      
	            </div>
	            <%} while(res.next()); %>
	        <% } else { %>
				<script>
					voidCartMessage();
				</script>
				<p id="void">Nessun prodotto trovato</p>  	        	
	        <%} %>
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

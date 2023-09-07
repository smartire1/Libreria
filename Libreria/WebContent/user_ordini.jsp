<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="java.sql.*" import="java.text.DecimalFormat" import="java.util.*" import="model.*" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <link href="css/style.css" rel="stylesheet"> 
    <link href="css/footer.css" rel="stylesheet"> 
    <link href="css/card.css" rel="stylesheet">   
    <link rel="icon" type="image/png" href="img/ico.png">
    <title>AS-New Readings</title>
</head>
<body class="bgSand">
	 <div class="bg-white">
	    <div class="logo-container">
		     <%if(session.getAttribute("admin") == null) {%>
		        <a href="index.jsp">
		            <img src="img/as.png" alt="Logo">
		        </a>
		    <%} else { %>
		        <a href="index_admin.jsp">
		            <img src="img/as.png" alt="Logo">
		        </a>
		    <%} %>    
	    </div>
	  	</div>
	    <jsp:include page="navbar.jsp" />
	  
	    <br>
	    <br>
	    <div class="container">
		    <div class="row" style="min-height:650px;">
		        <% 
					Double totale = 0.0;
					String totaleFormattato = "0";
					DecimalFormat decimalFormat = new DecimalFormat("#.##");
		            HashMap<Integer, List<OrderItem>> mappa = (HashMap<Integer, List<OrderItem>>) request.getAttribute("HashMap");
		            if (!mappa.isEmpty()) { 
		                for (Map.Entry<Integer, List<OrderItem>> entry : mappa.entrySet()) {
		        %>
				        <div class="col-lg-4 col-md-6 mb-4"> 
				            <div class="card mb-4 pricingTable" style="height: 350px;"> <!-- Inizia una nuova card per ogni ordine -->
				                <div class="card-body ">
				                    <h3 class="card-title">Numero ordine: <%= entry.getKey() %></h3>
				                    <br>
				                    
				                    <div class="scrollable-content">
					                    <% 
					                    String dataOrdine = "";
					                    for (OrderItem o : entry.getValue()) {  
					                       for(int i=0; i < o.getQuantity() ;i++)	totale += o.getPrezzo();%>
					                    
					                    <div class="pricing-content">
					                        <strong>isbn:</strong> <%= o.getIsbn() %>
					                        <strong>qta:</strong> <%= o.getQuantity() %>
					                        <% dataOrdine = o.getDataOrdine();%>					                        
					                    </div>
					                    <% } totaleFormattato = decimalFormat.format(totale);%>	
					                    	<hr>
					                    	<strong>data: </strong> 	<%= dataOrdine%>	
					                    	<br>			                        					                        
					                        <strong>Totale: </strong> 	<%= totaleFormattato%>&#8364	
					                        <%totale = 0.0;%>	
					                </div>							
				                </div>
				            </div>
				        </div>
		        <% 		} 
		            } else {  %>
				        <div class="col-12" style="height:650px;">
				            <p class="lead text-center">Nessun ordine effettuato</p>
				        </div>
		        <% } %>
		    </div>
		</div>

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
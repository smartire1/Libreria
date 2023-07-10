<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" import="java.util.*" import="model.*" import="dao.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>root@AS-New Reading</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <!-- Aggiungi eventuali stili CSS o script JS necessari -->
</head>
<body>
		<div class="nav-container">
		<nav class="centered-logo top-bar">
		  	<div class="container">
				  <div class="row">
				    <div class="col-sm-12 text-center">
				    	<form >
							<a href="index_admin.jsp"><img class="logo logo-dark" alt="Logo" src="images/eer.png" style="width: 80px; height: 60px;"></a>
						</form>
						<p class="lead">Accesso eseguito come Admin: </p>
						<p class="lead"> Bentornato <%=session.getAttribute("nome") %></p>
				    </div>
				  </div>
				  <br>
				  <div class="row">
				    <div class="col text-center">
				      	<form action="admin_utenti.jsp" method="get">
							<button type="submit" class="btn btn-outline-warning">Indietro</button>
						</form>
				    </div>				    
				    <div class="col text-center">
						<form action="Logout" method="post">
							<button class="btn btn-danger">Logout</button>
						</form>
				    </div>
				  </div>
			</div>
		</nav>
	</div>
	<br></br>
	<div class="container-sm" style="max-width: 200px;">
		<p class="border border-danger p-3 lead text-center">Ordini effettuati:</p>
	</div>
	<div class="container">
	<% HashMap<Integer, List<OrderItem>> mappa = (HashMap<Integer, List<OrderItem>>) request.getAttribute("HashMap");
	if (!mappa.isEmpty()) { %>
	    <div class="container demobg">
	        <div class="row">	            
	          	<%for (Map.Entry<Integer, List<OrderItem>> entry : mappa.entrySet()) { %>	      
	                <div class="col-md-4 col-sm-4 border border-success">
	                    <div class="pricingTable">
	                        <br>
	                        <h3 class="numero_ordine">Numero ordine: <%= entry.getKey() %> </h3>
	                        <span class="subtitle"></span>
	                        <% for (OrderItem o : entry.getValue()) { %>	
	                            <div class="col-md col-sm border border-danger">
	                                <div class="pricingTable">
	                                    <br>
	                                    <h3 class="title"><%= o.getTitolo() %></h3>              
	                                    <span class="subtitle"></span>
	                                    <ul class="pricing-content">
	                                        <li><strong>isbn:</strong> <%= o.getIsbn() %></li>
	                                        <li><strong>titolo:</strong> <%= o.getTitolo() %></li>
	                                        <li><strong>prezzo:</strong> &#8364 <%= o.getPrezzo() %></li>
	                                        <li><strong>casaEditrice:</strong> <%= o.getCasaEditrice() %></li>
	                                    </ul>
	                                </div>
	                            </div> 
	                        <% } %>			                            
	                    </div>
	                </div> 
	            <% } %>
	        </div>
	    </div>
	<% }	else if(mappa.isEmpty()) { %>
	    		<p class="lead text-center"> Nessun ordine effettuato</p>
	<% } %>
    </div>
</body>
</html>
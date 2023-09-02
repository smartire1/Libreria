<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.text.DecimalFormat" import="java.sql.*" import="java.util.*" import="model.*" import="dao.*" %>
<!DOCTYPE html>
<html>
<head>
    <base href="/Libreria/" />
    <meta charset="ISO-8859-1">
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="icon" type="image/png" href="img/ico.png">
    <title>root@AS-New Readings</title>
    <!-- CSS Files -->
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"> 
    <link href="css/style.css" rel="stylesheet">
    <link href="css/footer.css" rel="stylesheet">
    <link href="css/navbar.css" rel="stylesheet">
    <link href="css/card.css" rel="stylesheet"> 
       
</head>
<body class="bgSand">
    <div class="bg-white">
        <div class="logo-container">
            <a href="index_admin.jsp">
                <img src="img/as.png" alt="Logo">
            </a>
            <p style="margin-bottom: 0; padding-bottom: 15px;">Logged as Admin</p>
        </div>
    </div>
    
    <jsp:include page="../navbar.jsp" />
	<br></br>
    
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
					                    String user = "";
					                    for (OrderItem o : entry.getValue()) {  
					                       for(int i=0; i < o.getQuantity() ;i++)	totale += o.getPrezzo();%>
					                    
					                    <div class="pricing-content">
					                        <strong>isbn:</strong> <%= o.getIsbn() %>
					                        <strong>qta:</strong> <%= o.getQuantity() %>
					                        <% dataOrdine = o.getDataOrdine();%>
					                        <% user = o.getCasaEditrice();%>					                        
					                    </div>
					                    <% } totaleFormattato = decimalFormat.format(totale);%>	
					                    	<hr>
					                    	<strong>user: </strong> 	<%= user%>
					                    	<br>
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
    
    <footer class="footer bg-white">
        <div class="container">
            <nav>
                <p class="copyright text-center">
                    Copyright
                    <script>
                        document.write(new Date().getFullYear())
                    </script>
                    <a href="index_admin.jsp">AS-New Readings</a>
                </p>
            </nav>
        </div>
    </footer> 
           
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/your-fontawesome-kit.js" crossorigin="anonymous"></script> 
</body>
</html>
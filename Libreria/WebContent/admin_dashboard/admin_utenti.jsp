<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" import="java.util.*" import="model.*" import="dao.*" %>
<!DOCTYPE html>
<html lang="it">
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
<body >

	<%if(session.getAttribute("admin") == null) {%>
		<script>
        	window.location.href = 'index.jsp';
    	</script>
	<%} %>

    <div class="bg-white">
        <div class="logo-container">
            <a href="index_admin.jsp">
                <img src="img/as.png" alt="Logo">
            </a>
            <p style="margin-bottom: 0; padding-bottom: 15px;">Logged as Admin</p>
        </div>
    </div>
    
    <jsp:include page="../navbar.jsp" />
	<br>
	
	<%String db_url = "jdbc:mysql://localhost:3306/Librerie";
    String user_db = "root";
    String pass_db = "admin";
    Connection connessione = null;
    Class.forName("com.mysql.jdbc.Driver");
    connessione = DriverManager.getConnection(db_url,user_db,pass_db);
    CustomerDAO CDAO = new CustomerDAO(connessione);
    List<Customer> customers = CDAO.getAllCustomers();
	%>
	<form id="controllo" action="UserOrdini" method="post">
        <div class="container pricingTableBackX">
	        <div class="text-center pricingTable">
	            <div class="row d-flex align-items-center">
	                <div class="col-lg-3 col-md-12 col-sm-12 ">
						<h4>Visualizza ordini complessivi</h4>
	                </div>
					<div class="col-lg-3 col-md-12 col-sm-12">
					    <div class="form-group">
					        <p for="datepicker">Data inizio</p>
					        <input id="dataI" name="dataI" type="text" class="form-control datepicker start-date">
					    </div>
					</div>
	                <div class="col-lg-3 col-md-12 col-sm-12">
	              		<div class="form-group">
		                	<p for="datepicker">Data fine</p>
							<input id="dataF" name="dataF" type="text" class="form-control datepicker end-date">
						</div>
	                </div>
	                <div class="col-lg-3 col-md-12 col-sm-12">               
                        <button name="controllo" type="submit" onclick="return validateFormDate();" class="btn btn-outline-danger">Visualizza</button>                                      
	                </div>
	            </div>
	        </div>
        </div>
     </form> 
   	 <br>
   	 <br>  	 
		    <div class="overlay" id="Overlay"></div>
		    <div class="container text-center pricingTable" id="Popup1">
		        <button id="closeBtn"><i class="fas fa-times"></i></button>
		        <div class="container">
		            <h3 id="Operation" class="title">User: </h3>
		            <form action="UserOrdini" method="post" onSubmit="submitForm()">
		                <ul class="pricing-content">
		                    <li class="form-group">
		                        <strong>nome:</strong>
		                        <input type="text" class="form-control" readonly="readonly" name="Unome" id="Unome" value="" />
		                    </li>
		                    <li class="form-group">
		                        <strong>cognome:</strong>
		                        <input type="text" class="form-control" readonly="readonly" name="Ucognome" id="Ucognome" value="" />
		                    </li>
		                    <li class="form-group">
		                        <strong>email:</strong>
		                        <input type="text" class="form-control" readonly="readonly" name="Uemail" id="Uemail" value="" />
		                        <input type="hidden" name="email" id="toSend" value="">
		                    </li>             
		                </ul>
		                <div class="text-center">
		                    <button id="viewButton" type="submit" class="btn btn-outline-danger">Visualizza Ordini</button>		                        
		                </div>                                                                                
		            </form>         
		        </div>
		    </div>
		       	 
	<div class="container text-center pricingTableUser">
		<h3>User</h3>
		<div class="scrollable-content">
		<% for (Customer  c: customers) { if(!c.getRole()) {%>		
		
			<div class="container text-center">				
				<h2><a onclick="viewButton('<%= c.getEmail() %>', '<%= c.getNome() %>', '<%= c.getCognome() %>')" class="open-popup-btn"><%= c.getEmail() %></a></h2>
				<br><br>
			</div>		
		<% }} %>
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
    
	<script>
	    $(function() {
	        $(".datepicker").datepicker({
	            dateFormat: 'dd-mm-yy',
	            minDate: "-1M",
	            maxDate: new Date()
	        });
	
	        $("#controllo").on("submit", function(event) {
	            var startDate = $(".start-date").datepicker("getDate");
	            var endDate = $(".end-date").datepicker("getDate");
	            
	            if (endDate < startDate) {
	                event.preventDefault(); // Blocca l'invio del form
	                alert("La data di fine deve essere maggiore o uguale alla data di inizio.");
	            }
	        });
	    });
	    
	    function validateFormDate() {  
	    	  if ($("#dataI").val() === "" ||
	    	      $("#dataF").val() === "") {
	    	    alert('Riempire ogni campo data');
	    	    return false;
	    	  }
	    	};
	</script>   

	<script src="js/AddRemove.js"></script>
    <script src="js/offCanvas.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/your-fontawesome-kit.js" crossorigin="anonymous"></script>
</body>
</html>
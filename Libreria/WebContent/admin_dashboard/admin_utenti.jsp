<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" import="java.util.*" import="model.*" import="dao.*" %>
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
    
    <script>
        function voidCartMessage() {
            document.getElementById("table-bg").style.height = "40%";    
        }
    </script>    
    
    <title>root@AS-New Readings</title>
</head>
<body >
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
	
        <div class="container pricingTableBackX">
	        <div class="text-center pricingTable">
	            <div class="row d-flex align-items-center">
	                <div class="col-lg-3 col-md-12 col-sm-12 ">
						<h4>Visualizza ordini complessivi</h4>
	                </div>
					<div class="col-lg-3 col-md-12 col-sm-12">
					    <div class="form-group">
					        <p for="datepicker">Data inizio</p>
					        <input type="text" class="form-control datepicker" id="datepicker">
					    </div>
					</div>
	                <div class="col-lg-3 col-md-12 col-sm-12">
	              		<div class="form-group">
		                	<p for="datepicker">Data fine</p>
							<input type="text" class="form-control datepicker" id="datepicker">
						</div>
	                </div>
	                <div class="col-lg-3 col-md-12 col-sm-12">
                        <form action="../UserOrdini" method="post">
                            <button type="submit" class="btn btn-outline-danger">Visualizza</button>
                        </form>                  
	                </div>
	            </div>
	        </div>
        </div>
   	 <br>
   	 <br>
   	 
     <div class="text-center container table-center">
        <table class="table">
            <thead>
                <tr>
                    <th>Nome</th>
                    <th>Cognome</th>
                    <th>Email</th>
                    <th>Azioni</th>
                </tr>
            </thead>
            <tbody>
                <%-- Esegui un loop per ogni utente e crea una riga della tabella --%>
                <% for (Customer  c: customers) { if(!c.getRole()){%>
                    <tr>
                        <td><%= c.getNome() %></td>
                        <td><%= c.getCognome() %></td>
                        <td><%= c.getEmail() %></td>
                        <td>
                            <form action="../UserOrdini" method="post">
                                <input type="hidden" name="email" value="<%= c.getEmail() %>">
                                <button type="submit" class="btn btn-outline-danger">Visualizza ordini</button>
                            </form>
                        </td>
                    </tr>
                <% }} %>
            </tbody>
        </table>
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
	            dateFormat: "yy-mm-dd",  // Formato della data
	            minDate: "-1M",    // Data minima selezionabile (oggi)
	            maxDate: new Date()          // Data massima selezionabile (1 mese nel futuro)
	        });
	    });
	</script>
            
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/your-fontawesome-kit.js" crossorigin="anonymous"></script>
</body>
</html>

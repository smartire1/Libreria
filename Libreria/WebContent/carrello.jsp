<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="java.sql.*"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>


<style>
  .btn-primary:hover {
    border: 2px solid #28a745;
  }
</style>

<meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="css/footer.css" rel="stylesheet"> 
	<link href="css/card.css" rel="stylesheet"> 
	<link href="css/style.css" rel="stylesheet">   
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
	<link href="css/style.css" rel="stylesheet"> 
<title>AS-New Reading</title>
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
	
	<div class="container text-center">
	  <br>
	  <div class="row">
		<div class="col text-center">
	     	<form action="Checkout" method="post">
				<button class="btn btn-danger">Acquista</button>
			</form>
	    </div>
	    <div class="col text-center">
	      	<form action="UserOrdini" method="post">
				<button type="submit" class="btn btn-danger">Ordini</button>
			</form>
		</div>	    
	  </div>
	</div>


    <%String db_url = "jdbc:mysql://localhost:3306/Librerie";
      String user_db = "root";
      String pass_db = "admin";
      Connection connessione = null;
      Class.forName("com.mysql.jdbc.Driver");
      connessione = DriverManager.getConnection(db_url,user_db,pass_db); 
      
      
      String query = "SELECT * FROM Cart WHERE Customer = ?";
      PreparedStatement statement = connessione.prepareStatement(query);
      statement.setString(1, session.getAttribute("email").toString());
      ResultSet res = statement.executeQuery();
      
  /*    Statement cmd = connessione.createStatement();
      String query = "select * from Cart";
      ResultSet res = cmd.executeQuery(query);*/
      %>
      
      <br>
		<div class="container text-center pricingTable" style="background-image: url('img/cat.png'); border-radius:15px; background-position: center;">
            <div class="row row-cols-1">
            	
			<% if (res.next()) {
			     do { %>	      
			        <div class="col d-flex justify-content-center">
			          <div class="card pricingTable d-flex flex-column align-items-center">
			            <div class="">
			              <h3 class="title"><%= res.getString("titolo") %></h3>
			              <img src="<%= res.getString("img") %>" class="card-img-top" style="width: 200px; height: 300px;" alt="img">
			            </div>
			            <div class="">
			              <form action="RimuoviCarrello" method="post">
			                <ul class="pricing-content">
			                  <li><strong>isbn:</strong>  <%= res.getString("isbn") %> <input name="isbn" type="hidden" value="<%= res.getString("isbn") %>"/></li>
			                  <li><strong>titolo:</strong> <%= res.getString("titolo") %></li>
			                  <li><strong>prezzo:</strong> &#8364 <%= res.getString("prezzo") %></li>
			                  <li><strong>casaEditrice:</strong> <%= res.getString("casaEditrice") %></li>
			                </ul>
			                <div class="container">
			                  <Button type="submit" class="btn btn-danger">Rimuovi</Button>
			                </div>
			              </form>
			            </div>
			          </div>
			        </div> 
			  <% } while(res.next());
			} else { %>
			    <h3 class="title text-center">Il carrello è vuoto...</h3>
			<% } %>


	      			
	      			<br>
	      			
					<p class="lead text-center" >
						<%
							if(null != request.getAttribute("errorMessage")) {
								out.print(request.getAttribute("errorMessage"));
							} 
						
							if(null != request.getAttribute("ringiaziamenti")) {
								out.print(request.getAttribute("ringiaziamenti"));
							}
						%>	      			
					</p>
             </div>
    </div>
	<br>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://kit.fontawesome.com/your-fontawesome-kit.js" crossorigin="anonymous"></script> 	
</body>
</html>